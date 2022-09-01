<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBank</title>
        <link rel="stylesheet" href="css/welcome.scss">
    </head>
    <body>
        <div class="pic"></div>

        <div class="data">
            <h1>Welcome to EBank</h1>
            <form action="adminLogin.jsp" method="post">
                <input type="submit" name="admin" value="ADMIN">
            </form>
            <form action="customerLogin.jsp" method="post">
                <input type="submit" name="customer" value="CUSTOMER">
            </form>
        </div>
    </body>
</html>
