<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Medicine</title>
</head>
<body>
<table border="1">
    <th>
        <td>Medid</td>
        <td>medname</td>
        <td>manufacturedby</td>
        <td>uses</td>
        <td>price</td>
        <td>medComposition</td>
        <td>medtype</td>
    </th>

<%
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "system";
        String pass = "root";
        Connection con = null;
        Statement st=null;
        try {
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            con = DriverManager.getConnection(url, user,pass);
            st= con.createStatement();
            ResultSet resultSet = null;
                    boolean flag = true;

                    String medName = request.getParameter("medName");
                    String medtype = request.getParameter("medtype");
                    String medComposition = request.getParameter("medComposition");
                    String manufacturedby = request.getParameter("manufacturedby");
                    String price = request.getParameter("price");
                    String lowerAge = request.getParameter("lowerAge");
                    String upperAge = request.getParameter("upperAge");
                    String uses = request.getParameter("uses");

                    System.out.println("medName= "+medName+" medtype= "+medtype+" medComposition= "+medComposition+"manufacturedby="+manufacturedby+"price="+price+"lowerAge="+lowerAge+"upperAge="+upperAge+"uses="+uses);

                    String resultQuery = "select medid, medname, manufacturedby, medcomposition, price, uses, medtype from medicine where ";

                    if(medName.length()!=0){
                        if(flag==false){
                            resultQuery+=" and ";
                        }
                        flag=false;
                        resultQuery+="medname like '%"+medName+"%'";
                    }

                    if(medComposition.length()!=0){
                        if(flag==false){
                            resultQuery+=" and ";
                        }
                        flag=false;

                        String[] composition = medComposition.split(",");
                        int stringLength = composition.length;
                        int count=0;
                        for(String name : composition){
                            count++;
                            resultQuery+="medcomposition like '%"+name+"%'";
                            if(count < stringLength) {
                                resultQuery+=" or ";
                            }
                        }
                    }

                    if(medtype.length()!=0){
                        if(flag==false){
                            resultQuery+=" and ";
                        }
                        flag=false;

                        resultQuery+="medtype like '%"+medtype+"%'";
                    }

                    if(manufacturedby.length()!=0) {
                        if(flag==false){
                            resultQuery+=" and ";
                        }
                        flag=false;

                        resultQuery+="medfacturedby like '%"+manufacturedby+"%'";
                    }

                    if(price.length()!=0) {
                        if(flag==false){
                            resultQuery+=" and ";
                        }
                        flag=false;

                        resultQuery+="price <= "+price;
                    }

                    if(lowerAge.length()!=0){
                        if(flag==false){
                            resultQuery+=" and ";
                        }
                        flag=false;

                        resultQuery+="lowerage >= "+lowerAge;
                    }
                    if(upperAge.length()!=0){
                        if(flag==false){
                            resultQuery+=" and ";
                        }
                        flag=false;

                        resultQuery+="upperage >= "+upperAge;
                    }

                    if(uses.length()!=0){
                        if(flag==false){
                            resultQuery+=" and ";
                        }
                        flag=false;

                        String[] composition = uses.split(",");
                        int stringLength = composition.length;
                        int count=0;
                        for(String name : composition){
                            count++;
                            resultQuery+="uses like '%"+name+"%'";
                            if(count < stringLength) {
                                resultQuery+=" or ";
                            }
                        }
                    }

                   // resultQuery+=";";

                    System.out.println("Result Query : " + resultQuery);

                    resultSet = st.executeQuery(resultQuery);
                    System.out.println("After querying ");

                    while(resultSet.next()){
%>
                        <tr>
                            <td><%=resultSet.getInt("medid") %></td>
                            <td><%=resultSet.getString("medname") %></td>
                            <td><%=resultSet.getString("manufacturedby") %></td>
                            <td><%=resultSet.getString("uses") %></td>
                            <td><%=resultSet.getInt("price") %></td>
                            <td><%=resultSet.getString("medcomposition") %></td>
                            <td><%=resultSet.getString("medtype") %></td>
                        </tr>

<%
            }
        }
        catch (Exception e) {
            System.out.println(e);
            System.out.println("Cannot connect to the server/database or query error");
        }
%>

</body>
</html>