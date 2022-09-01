<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login DBMS Page</title>
    </head>
    <body>
        <h1>Admin Login DBMS Page</h1><br>
        <%
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            
            if(username.equalsIgnoreCase("admin") && password.equalsIgnoreCase("admin")){
                response.sendRedirect("adminPannel.jsp");
            }
            else{
                response.sendRedirect("adminLogin.jsp");
         %>
         <script> alert("Wrong Username or password!");</script>
         <%
            }
        %>
    </body>
</html>
