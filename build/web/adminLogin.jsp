<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login Page</title>
        <link rel="stylesheet" href="css/login.scss">
    </head>
    <body>
        <div class="pic"></div>
        <div class="data">
            <h1><span style="color: #00bfff">Admin</span> Login Page</h1>
            <form action="adminLoginDBMS.jsp" method="post">
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="submit" name="login" value="login" style="background-color: #00bfff">
            </form>
        </div>
    </body>
</html>
