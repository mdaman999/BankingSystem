<%@include file="DBCON.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>customer Login DBMS Page</title>
    </head>
    <body>
        <%            
        try {
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                String viewQ = "select * from account where username='" + username + "';";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(viewQ);

                String usernameDBMS = "";
                String passwordDBMS = "";
                while (rs.next()) {
                    usernameDBMS = rs.getString(1);
                    passwordDBMS = rs.getString(8);
                }
                session.setAttribute("username_passed", usernameDBMS);
                session.setAttribute("password_passed", passwordDBMS);
                
                if (username.equalsIgnoreCase(usernameDBMS) && password.equalsIgnoreCase(passwordDBMS)) {
                    response.sendRedirect("customerPannel.jsp");
                } else {
        %>
        <script>alert("Wrong username or password!");</script>
        <%
                    RequestDispatcher disp = request.getRequestDispatcher("customerLogin.jsp");
                    disp.include(request, response);
                }
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>
