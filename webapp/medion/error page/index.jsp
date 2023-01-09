<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

        String eCode="404";
        String msg="Page Not Found";
        try{
            if(request.getParameter("ecode")!=null){
                eCode=request.getParameter("ecode");
                if(eCode.equals("400")){
                    msg="Bad Request";
                }
                else if(eCode.equals("401")){
                    msg="Unauthorized";
                }
                else if(eCode.equals("500")){
                    msg="In-Server Error";
                }
                System.out.println(request.getParameter("ecode"));
                }
           }
            catch(Exception e){
                System.out.println(e);
                response.sendRedirect("index.jsp?ecode=404");
            }

%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:700,900" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="css/style.css" />
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>
<body>
	<div id="notfound">
		<div class="notfound">
			<div class="notfound-404">
				<h1><%=eCode%></h1>
				<h2><%=msg%></h2>
			</div>
			<a href="../index.jsp">Homepage</a>
		</div>
	</div>

</body>
</html>
