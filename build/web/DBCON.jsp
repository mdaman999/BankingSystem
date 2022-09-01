
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <body>
        <%!Connection con ;%>
        
        <%
        try{
        Class.forName("com.mysql.jdbc.Driver");
        String connectionURL="jdbc:mysql://localhost:3306/bank";
        String dbUser="root";
        String dbPassword="root";
        con=DriverManager.getConnection(connectionURL,dbUser,dbPassword);
//        out.println("Connection Succesfull ....");
        }
        catch(Exception e){
            out.println("Connection Failed ..."+e);
        }
        %>
    </body>
</html>
