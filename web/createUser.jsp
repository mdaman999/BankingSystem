<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New User Page</title>
        <link rel="stylesheet" href="css/form.scss">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    </head>
    <body>
        <nav>
            <h1>EBank</h1>
            <h1>Admin&nbsp;&nbsp;<i class="fa-solid fa-user-tie"></i></h1>
        </nav>
        <h1 class="heading">New User Registration Form</h1>
        <form action="createUserDBMS.jsp" method="post">
            <input type="text" name="username" placeholder="Create username" required>
            <input type="text" name="name" placeholder="Enter Full Name" required>
            <select name="gender" required>
                <option>Male</option>
                <option>Female</option>
            </select>
            <input type="date" name="dob" required>
            <input type="text" name="mob" placeholder="Phone Number" required>
            <input type="password" name="password" placeholder="Create Password" required>
            <select name="ques" required>
                <option>First Car</option>
                <option>First Job</option>
                <option>First Company</option>
                <option>First Bank</option>
            </select>
            <input type="text" name="ans" placeholder="Security Answer" required>
            <input type="submit" name="register" value="register">
        </form>
    </body>
</html>
