<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Change Page</title>
        <link rel="stylesheet" href="css/custForm.scss">
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
        <h1 class="heading">Password Change Portal</h1>
        <form action="changePasswordDBMS.jsp" method="post">
            <input type="text" name="oldpass" placeholder="Old Password" required>
                <input type="password" name="newpass" placeholder="New Password" required>
                <input type="password" name="cnpass" placeholder="Confirm Password" required>
                <input type="submit" name="change" value="Change Password">
        </form>
    </body>
</html>
