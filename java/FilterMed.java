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

public class FilterMed extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
//        medtype comp manufactured by age uses
        String medName = req.getParameter("medName");
        String medtype = req.getParameter("medtype");
        String medComposition = req.getParameter("medComposition");
        String manufacturedby = req.getParameter("manufacturedby");
        String price = req.getParameter("price");
        String lowerAge = req.getParameter("lowerAge");
        String upperAge = req.getParameter("upperAge");
        String uses = req.getParameter("uses");
        String sym = req.getParameter("sym");

//        Adding into session and redirect to search.jsp
        try{
            HttpSession session = req.getSession();
            session.setAttribute("medName", medName);
            session.setAttribute("medType", medtype);
            session.setAttribute("medComposition", medComposition);
            session.setAttribute("manufacturedby", manufacturedby);
            session.setAttribute("price", price);
            session.setAttribute("lowerAge", lowerAge);
            session.setAttribute("upperAge", upperAge);
            session.setAttribute("uses", uses);

            if(sym!=null && sym.length()!=0){

                int id=1;
                ResultSet rs=null;
                try {
                    rs = Connect.st.executeQuery("SELECT id FROM sym ORDER BY id DESC");
                    if(rs.next()){
                        id=rs.getInt("id")+1;
                    }
                    System.out.println(id);
                }
                catch (Exception e) {
                    //resp.sendRedirect("../error page/index.jsp?ecode=500");
                    System.out.println(e);
                }
                try{
                    int userid=(Integer)session.getAttribute("userid");
                    System.out.println(id);
                    String sql="insert into sym values("+id+","+userid+",'"+ sym+"')";
                    int n=Connect.st.executeUpdate(sql);
                    System.out.println(n);
                }
                catch (Exception e){
                    System.out.println(e);
                }

            }
            resp.sendRedirect( "../search.jsp?medName="+medName+"&medtype="+medtype+"&medComposition="+medComposition+"&manufacturedby="+manufacturedby+"&price="+price+"&lowerAge="+lowerAge+"&upperAge="+upperAge+"&uses="+uses+"&sym="+sym);
        }
        catch (Exception e){
            resp.sendRedirect("../error%20page/index.jsp?ecode=400");
        }
    }
}
