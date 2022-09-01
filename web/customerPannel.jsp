<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>customer pannel Page</title>
        <link rel="stylesheet" href="css/pannel.scss">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    </head>
    <body>
        <%
            String username=(String)session.getAttribute("username_passed");
        %>
        <nav class="custN">
            <h1>EBank</h1>
            <h1><% out.println(username); %>&nbsp;&nbsp;<i class="fa-solid fa-user"></i></h1>
        </nav>

        <div class="left custL"></div>

        <div class="right custR">
            <div class="data custD">
                <a class="custA" href="myProfile.jsp">My Profile</a>
                <a class="custA" href="updateProfile.jsp">Update Profile</a>
                <a class="custA" href="myTransaction.jsp">My Transaction</a>
                <a class="custA" href="fundTransfer.jsp">Fund Transfer</a>
                <a class="custA" href="changePassword.jsp">Change Password</a>
            </div>
        </div>
    </body>
</html>
