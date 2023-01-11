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
import DatabaseConnection.Connect;

public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //userid name password address phno age
        long phoneNumber = Long.parseLong(req.getParameter("phno"));
        String password = req.getParameter("password");


        try {
            Connect c=new Connect();
        } catch (Exception e) {
            resp.sendRedirect("../error%20page/index.jps?ecode=500");
        }

        //Inserting the Data to database
        ResultSet rs = null;
        try{
            System.out.println(phoneNumber);
            System.out.println(password);
            String sql = "select * from userDetails where phno="+phoneNumber+"and password = '"+password+"'";

            rs = Connect.st.executeQuery(sql);
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
                if(name.equals("admin")){
                    resp.sendRedirect("../admin.html");
                }
                else{
                    resp.sendRedirect("../medicine.jsp");
                }
            }
            else{
               resp.sendRedirect("../error%20page/index.jsp?ecode=400");
            }

        }
        catch (Exception ex){
            resp.sendRedirect("../error%20page/index.jsp?ecode=500");
        }

    }
}
