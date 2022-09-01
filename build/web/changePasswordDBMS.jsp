<%@include file="DBCON.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>change password QA Page</title>
    </head>
    <body>
        <%               String username = (String) session.getAttribute("username_passed");
            String password = (String) session.getAttribute("password_passed");

            String oldpass = request.getParameter("oldpass");
            String newpass = request.getParameter("newpass");
            String cnpass = request.getParameter("cnpass");

            try {
                if (newpass.equals(cnpass)) {
                    if (password.equals(oldpass)) {
                        try {
                            String upPassQ = "update account set password='" + newpass + "' where username='" + username + "';";
                            PreparedStatement pst = con.prepareStatement(upPassQ);
                            pst.executeUpdate();
                            %>
                            <script>alert("Password change successfuly.");</script>
                            <%
                            RequestDispatcher disp=request.getRequestDispatcher("customerLogin.jsp");
                            disp.include(request, response);
                        } catch (Exception e) {
                            out.println("<br>Password not change.<br>" + e);
                        }
                    } else {
                        out.println("<br>Opps, Old password is incorrect.");
                    }
                } else {
                    out.print("<br>Opps, New password & confirm password are not matched!");
                }
            } catch (Exception ee) {
                out.print(ee);
            }
        %>
    </body>
</html>
