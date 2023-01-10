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

public class AddMed extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String medtype = req.getParameter("medtype");
        String medName = req.getParameter("medName");
        String medComposition = req.getParameter("medComposition");
        String manufacturedBy = req.getParameter("manufacturedBy");
        String sym = req.getParameter("sym");
        int price = Integer.parseInt(req.getParameter("price"));
        int upper = Integer.parseInt(req.getParameter("upperAge"));
        int lower = Integer.parseInt(req.getParameter("lowerAge"));
        String uses = req.getParameter("uses");
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
            rs = st.executeQuery("SELECT medid FROM medicine ORDER BY medid DESC");
            if(rs.next()){
                id=rs.getInt("medid")+1;
            }
        }
        catch (Exception e) {
            resp.sendRedirect("../error page/index.jsp?ecode=500");
        }
        try{

            String sql = "insert into medicine values("+id+",'" + medName + "','" + medComposition + "','" + manufacturedBy + "','" + price + "'," + upper + "," + lower + ",'" + uses + "','"+medtype+"','"+sym+"')";

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
