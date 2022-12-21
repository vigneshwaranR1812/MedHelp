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
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "system";
        String pass = "root";
        Connection con = null;
        try {
            DriverManager.registerDriver(
                    new oracle.jdbc.OracleDriver());
            con = DriverManager.getConnection(url, user,
                    pass);
            try{
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from student");
                PrintWriter pt= resp.getWriter();
                while(rs.next()){
                   pt.println("ID");
                  pt.println(rs.getInt("id"));
                }
                con.close();
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
