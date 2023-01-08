import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

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
            resp.sendRedirect( "../search.jsp?medName="+medName+"medtype="+medtype+"medComposition="+medComposition+"manufacturedby="+manufacturedby+"price="+price+"lowerAge="+lowerAge+"upperAge="+upperAge+"uses="+uses);
        }
        catch (Exception e){
            System.out.println(e);
        }
    }
}
