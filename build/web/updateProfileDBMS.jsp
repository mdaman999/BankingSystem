<%@include file="DBCON.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile DBMS Page</title>
        <link rel="stylesheet" href="css/failedSuccess.scss">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    </head>
    <body>
        <%            String username = (String) session.getAttribute("username_passed");

            String oldvalue = request.getParameter("oldvalue");
            String newvalue = request.getParameter("newvalue");
            String gender = request.getParameter("gender");
            String ques = request.getParameter("ques");
            String newans = request.getParameter("newans");

            try {
                if (oldvalue.equalsIgnoreCase("select field") && newvalue.equalsIgnoreCase("") && gender.equalsIgnoreCase("select Gender") && ques.equalsIgnoreCase("Select Security Que") && newans.equalsIgnoreCase("")) {
        %>
        <div class="data">
            <i id="cross" class="fa-solid fa-xmark"></i>
            <h2><% out.print("Data Not Updated"); %></h2> 
            <p><% out.print("Reasion:Please field the data first!"); %></p> 
        </div>  
        <%
            }
            if (!oldvalue.equalsIgnoreCase("select field") && !newvalue.equalsIgnoreCase("")) {
                String dataQ = "";
                if (oldvalue.equalsIgnoreCase("Contact Number")) {
                    dataQ = "update account set mob='" + newvalue + "' where username='" + username + "';";
                } else {
                    dataQ = "update account set " + oldvalue + "='" + newvalue + "' where username='" + username + "';";
                }
                PreparedStatement pst1 = con.prepareStatement(dataQ);
                pst1.executeUpdate();
        %>
        <div class="data">
            <i id="right" class="fa-solid fa-circle-check"></i>
            <h2><% out.print("Data Updated!"); %></h2> 
        </div> 
        <%
            }

            if (!gender.equalsIgnoreCase("select Gender")) {
                String genderQ = "update account set gender='" + gender + "' where username='" + username + "';";
                PreparedStatement pst2 = con.prepareStatement(genderQ);
                pst2.executeUpdate();
        %>
        <div class="data">
            <i id="right" class="fa-solid fa-circle-check"></i>
            <h2><% out.print("Data Updated!"); %></h2> 
        </div> 
        <%
            }
            if (!ques.equalsIgnoreCase("Select Security Que") && !newans.equalsIgnoreCase("")) {
                String securityQ = "update account set ques='" + ques + "', ans='" + newans + "' where username='" + username + "';";
                PreparedStatement pst3 = con.prepareStatement(securityQ);
                pst3.executeUpdate();
        %>
        <div class="data">
            <i id="right" class="fa-solid fa-circle-check"></i>
            <h2><% out.print("Data Updated!"); %></h2> 
        </div> 
        <%
            }
            if ((oldvalue.equalsIgnoreCase("select field") && !newvalue.equalsIgnoreCase("")) || (!oldvalue.equalsIgnoreCase("select field") && newvalue.equalsIgnoreCase(""))) {
        %>
        <div class="data">
            <i id="cross" class="fa-solid fa-xmark"></i>
            <h2><% out.print("Data Not Updated"); %></h2> 
            <p><% out.print("Reasion: You entered Improper data"); %></p> 
        </div> 
        <%
            }
            if ((ques.equalsIgnoreCase("Select Security Que") && !newans.equalsIgnoreCase("")) || (!ques.equalsIgnoreCase("Select Security Que") && newans.equalsIgnoreCase(""))) {
        %>
        <div class="data">
            <i id="cross" class="fa-solid fa-xmark"></i>
            <h2><% out.print("Data Not Updated"); %></h2> 
            <p><% out.print("Reasion: You entered Improper data"); %></p> 
        </div> 
        <%
            }
        } catch (Exception e) {
        %>
        <div class="data">
            <i id="cross" class="fa-solid fa-xmark"></i>
            <h2><% out.print("Data Not Updated"); %></h2> 
            <p><% out.print("Reasion: "+e); %></p>
        </div> 
        <%
            }
        %>
    </body>
</html>
