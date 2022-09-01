<%@include file="DBCON.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile Page</title>
        <link rel="stylesheet" href="css/myProfile.scss">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    </head>
    <body>
        <% String username=(String)session.getAttribute("username_passed"); %>
        <nav>
            <h1>EBank</h1>
            <h1><% out.println(username); %>&nbsp;&nbsp;<i class="fa-solid fa-user"></i></h1>
        </nav>
        <h1 class="heading">My Profile</h1>
        
        <%
            String viewQ = "select * from account where username='"+username+"';";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(viewQ);
        %>
        <div class="data">
            <div class="icon"><i class="fa-solid fa-user profile">&nbsp;</i><a href="updateProfile.jsp" title="Edit Profile"><i class="fa-solid fa-pencil"></i></a></div>
        <% while(rs.next()){
        %>
        <h3>Username: <% out.println(rs.getString(1)+"<br><br>"); %></h3>
        <h3>Name: <% out.println(rs.getString(2)+"<br><br>"); %></h3>
        <h3>Gender: <% out.println(rs.getString(3)+"<br><br>"); %></h3>
        <h3>Date Of Birth: <% out.println(rs.getString(4)+"<br><br>"); %></h3>
        <h3>Contact Number: <% out.println(rs.getString(5)+"<br><br>"); %></h3>
        <h3>Account Number: <% out.println(rs.getInt(6)+"<br><br>"); %></h3>
        <h3>My Balance: <% out.println(rs.getInt(7)+"<br><br>"); %></h3>
        <h3>Password: <% out.println(rs.getString(8)+"<br><br>"); %></h3>
        <h3>Security Question: <% out.println(rs.getString(9)+"<br><br>"); %></h3>
        <h3>Security Answer: <% out.println(rs.getString(10)+"<br>"); %></h3>
        <%
            }
        %>
        </div>
    </body>
</html>
