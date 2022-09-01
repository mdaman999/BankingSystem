<%@include file="DBCON.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>change password QA Page</title>
    </head>
    <body>
        <%            String username = request.getParameter("username");
            String ques = request.getParameter("ques");
            String ans = request.getParameter("ans");
            String newpass = request.getParameter("newpass");
            String cnpass = request.getParameter("cnpass");

            if (newpass.equalsIgnoreCase(cnpass)) {
                if (!ques.equalsIgnoreCase("Select Security Ques")) {
                    try {
                        String oldques = "", oldans = "";
                        String quesViewQ = "select ques from account where username='" + username + "';";
                        String ansViewQ = "select ans from account where username='" + username + "';";

                        Statement st1 = con.createStatement();
                        ResultSet rs1 = st1.executeQuery(quesViewQ);
                        while (rs1.next()) {
                            oldques += rs1.getString(1);
                        }

                        Statement st2 = con.createStatement();
                        ResultSet rs2 = st2.executeQuery(ansViewQ);
                        while (rs2.next()) {
                            oldans += rs2.getString(1);
                        }

                        out.print(oldques);
                        out.print(oldans);
                        if(!oldques.equalsIgnoreCase("") || !oldans.equalsIgnoreCase("")){
                            if(oldques.equalsIgnoreCase(ques) && oldans.equalsIgnoreCase(ans))
                            {
                                String upPassQ = "update account set password='" + newpass + "' where username='" + username + "';";
                                PreparedStatement pst = con.prepareStatement(upPassQ);
                                pst.executeUpdate();
                                %>
                                <script>alert("Password change successfuly.");</script>
                                <%
                                RequestDispatcher disp=request.getRequestDispatcher("customerLogin.jsp");
                                disp.include(request, response);
                            }
                            else{
                                out.print("Security Question or answer not matched!");
                            }
                        }
                        else{
                            out.print("You Entered wrong username!");
                        }
                    } catch (Exception e) {
                        out.print(e);
                    }
                } else {
                    out.print("Please select Security question.");
                }
            } else {
                out.print("New Password and Confirm password are not matched!");
            }
        %>

    </body>
</html>