<%@page import="java.*"%>

<%
    if(session.getAttribute("userid")!=null){
        System.out.println("sesion");
        response.sendRedirect("medicine.jsp");
    }
    else{
        response.sendRedirect("index.html");
    }

%>