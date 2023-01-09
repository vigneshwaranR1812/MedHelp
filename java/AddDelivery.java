
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

public class AddDelivery extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String area = req.getParameter("area");
        String gender = req.getParameter("gender");
        int age = Integer.parseInt(req.getParameter("age"));
        int phno = Integer.parseInt(req.getParameter("phno"));
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
            rs = st.executeQuery("SELECT did FROM delivery ORDER BY did DESC");
            if(rs.next()){
                id=rs.getInt("did")+1;
            }
        }
        catch (Exception e) {
            resp.sendRedirect("../error page/index.jsp?ecode=500");
        }
        try{

            String sql = "insert into delivery values("+id+"," + age + ",'" + gender + "'," + phno + ",'" + area + "')";

            int m = st.executeUpdate(sql);
            if (m == 1) {
                resp.sendRedirect("../admin.html");
            }
            else{
                resp.sendRedirect("../error page/index.jsp?ecode=500");
            }

        }
        catch (Exception ex){
            resp.sendRedirect("../error page/index.jsp?ecode=500");
        }
    }
}
