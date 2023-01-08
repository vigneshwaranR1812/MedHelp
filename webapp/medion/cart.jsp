<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%page import="javax.servlet.http.HttpServletRequest"%>
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
        }
        catch (Exception e) {
            System.out.println(e);
            System.out.println("nakku2");

        }
        ResultSet resultSet = null;

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
</head>
<body>
<table border="1">
<tr>
<td>Cart Id</td>
<td>Medicine Name</td>
<td>Medicine Type Id</td>
<td>Medicine Composition</td>
<td>Manufactured By</td>
<td>Price</td>
<td>Uses</td>
</tr>
<%
    try{
                int userid = (Integer) session.getAttribute("userid");
                String sql = "select medname,medtype,medcomposition,manufacturedby,price,uses,carid from cart,medicine,userDetails where cart.medid=medicine.medid and cart.userid=userDetails.userid and userDetails.userid="+userid;
                resultSet = st.executeQuery(sql);
                while(resultSet.next()){
%>
    <tr>
    <td><%=resultSet.getInt("carid") %></td>
    <td><%=resultSet.getString("medname") %></td>
    <td><%=resultSet.getString("medtype") %></td>
    <td><%=resultSet.getString("medcomposition") %></td>
    <td><%=resultSet.getString("manufacturedby") %></td>
    <td><%=resultSet.getInt("price") %></td>
    <td><%=resultSet.getString("uses") %></td>
    </tr>
<%
             }
           }
           catch(Exception e){
             System.out.println(e);
             System.out.println("nakku2-2");
           }
%>
</body>
</html>