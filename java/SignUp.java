import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
public class SignUp extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //userid name password address phno age
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        String address = req.getParameter("address");
        long phoneNumber = Long.parseLong(req.getParameter("phno"));
        int id=1;
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "system";
        String pass = "root";
        Connection con = null;
        Statement st=null;
        try {
            DriverManager.registerDriver(
                    new oracle.jdbc.OracleDriver());
            con = DriverManager.getConnection(url, user,
                    pass);
             st= con.createStatement();
        } catch (Exception e) {
            resp.sendRedirect("../error page/index.jsp?ecode=500");
        }
        //Fetching last person id

        //Inserting the Data to database
        ResultSet rs=null;
        try {
            rs = st.executeQuery("SELECT userid FROM userDetails ORDER BY userid DESC");
            if(rs.next()){
                id=rs.getInt("userid")+1;
            }
        }
        catch (Exception e) {
            resp.sendRedirect("../error page/index.jsp?ecode=500");
        }
        try{
            System.out.println(id);
            System.out.println(name);
            System.out.println(password);
            System.out.println(address);
            System.out.println(phoneNumber);
            String sql = "insert into userDetails values("+id+",'" + name + "','" + password + "','" + address + "'," + phoneNumber + ")";

            int m = st.executeUpdate(sql);
            System.out.println(m);
            if (m == 1) {
                System.out.println("Hey");
                HttpSession session=req.getSession();
                session.setAttribute("name",name);
                session.setAttribute("userid",id);
                session.setAttribute("phoneNumber",phoneNumber);
                session.setAttribute("address",address);
                System.out.println("Nakku1");
                if(name.equals("admin")){
                    resp.sendRedirect("../admin.html");
                }
                else{
                    resp.sendRedirect("../medicine.jsp");
                }
            }
            else{
                resp.sendRedirect("../error page/index.jsp?ecode=400");
            }

        }
        catch (Exception ex){
            resp.sendRedirect("../error page/index.jsp?ecode=500");
        }

    }
}
