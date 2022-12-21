import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class FilterMed extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
//        medtype comp manufactured by age uses
        String medType = req.getParameter("medType");
        String composition = req.getParameter("composition");
        String manufacturedBy = req.getParameter("manufacturedBy");
        int age = Integer.parseInt(req.getParameter("age"));
        String uses = req.getParameter("uses");

        System.out.println("medType : "+medType+" "+"composition : "+composition+" "+"manufacturedBy : "+manufacturedBy+" "+"age : "+age+" "+"uses : "+uses+" ");
        try{
            resp.sendRedirect( "../webapp/medion/search.jsp?medType="+medType+"composition="+composition+"manufacturedBy="+manufacturedBy+"age="+age+"uses="+uses);
        }
        catch (Exception e){
            System.out.println(e);
        }
    }
}
