
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile Page</title>
        <link rel="stylesheet" href="css/custForm.scss">
    </head>
    <body>
        <% String username = (String) session.getAttribute("username_passed"); %>
        <nav>
            <h1>EBank</h1>
            <h1><% out.println(username);%>&nbsp;&nbsp;<i class="fa-solid fa-user"></i></h1>
        </nav>
        <h1 class="heading">Update Profile Page</h1>
        <form action="updateProfileDBMS.jsp" method="post">
            <select name="oldvalue">
                <option>select field</option>
                <option>Name</option>
                <option>Contact Number</option>
            </select>
            <input type="text" name="newvalue" placeholder="Enter new value">
            <select name="gender">
                <option>select Gender</option>
                <option>Male</option>
                <option>Female</option>
            </select>
            <select  name="ques">
                <option>Select Security Que</option>
                <option>First Car</option>
                <option>First Job</option>
                <option>First Bank</option>
                <option>First Company</option>
            </select>
            <input type="text" name="newans" placeholder="Enter new Security Answer">
            <input type="submit" name="update" value="Update">
        </form>
    </body>
</html>
