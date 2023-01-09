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

public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //userid name password address phno age
        long phoneNumber = Long.parseLong(req.getParameter("phno"));
        String password = req.getParameter("password");

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
            System.out.println(e);
        }

        //Inserting the Data to database
        ResultSet rs = null;
        try{
            System.out.println(phoneNumber);
            System.out.println(password);
            String sql = "select * from userDetails where phno="+phoneNumber+"and password = '"+password+"'";

            rs = st.executeQuery(sql);
            if (rs.next()) {
                int id=rs.getInt("userid");
                String name = rs.getString("name");
                long phno = rs.getLong("phno");
                String address = rs.getString("address");
                HttpSession session=req.getSession();
                session.setAttribute("name",name);
                session.setAttribute("userid",id);
                session.setAttribute("phoneNumber",phno);
                session.setAttribute("address",address);
                System.out.println("Nakku1");
                if(name.equals("admin")){
                    resp.sendRedirect("addMed.html");

                }
                else{
                    resp.sendRedirect("../medicine.jsp");
                }
            }
            else{
//                RequestDispatcher rd = req.getRequestDispatcher("servlet2");
//                rd.forward(req, resp);
               resp.sendRedirect("../error%20page/index.html");
            }

        }
        catch (Exception ex){
            System.out.println(ex);
            System.out.println("tro");
        }

    }
}
