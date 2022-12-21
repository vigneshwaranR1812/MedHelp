import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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

        System.out.println("medType : "+medtype+" "+"composition : "+medComposition+" ");
        try{
            resp.sendRedirect( "../search.jsp?medName="+medName+"medtype="+medtype+"medComposition="+medComposition+"manufacturedby="+manufacturedby+"price="+price+"lowerAge="+lowerAge+"upperAge="+upperAge+"uses="+uses);
        }
        catch (Exception e){
            System.out.println(e);
        }
    }
}
