import DatabaseConnection.Connect;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Database extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

            try{

                ResultSet rs = Connect.st.executeQuery("select * from student");
                PrintWriter pt= resp.getWriter();
                while(rs.next()){
                   pt.println("ID");
                  pt.println(rs.getInt("id"));
                }

            }
            catch (Exception ex) {
                System.out.println(ex);
            }
        }
        catch (Exception ex) {
            System.err.println(ex);
        }
    }
}
