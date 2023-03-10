
import DatabaseConnection.Connect;
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
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        long phno = Long.parseLong(req.getParameter("phno"));
        int id=1;



        ResultSet rs=null;
        try {
            rs = Connect.st.executeQuery("SELECT did FROM delivery ORDER BY did DESC");
            if(rs.next()){
                id=rs.getInt("did")+1;
            }
        }
        catch (Exception e) {
            System.out.println("catch 2");
            resp.sendRedirect("../error%20page/index.jsp?ecode=500");
        }
        try{

            String sql = "insert into delivery values("+id+"," + age + ",'" + name + "','" + gender + "'," + phno + ",'" + area + "',0)";

            int m = Connect.st.executeUpdate(sql);
            if (m == 1) {
                resp.sendRedirect("../admin.html");
            }
            else{
                resp.sendRedirect("../error%20page/index.jsp?ecode=500");
            }

        }
        catch (Exception ex){
            System.out.println("final catch");
            resp.sendRedirect("../error page/index.jsp?ecode=500");
        }
    }
}
