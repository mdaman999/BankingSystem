<%@include file="DBCON.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View User Page</title>
        <link rel="stylesheet" href="css/view.scss">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    </head>
    <body>
        <nav>
            <h1>EBank</h1>
            <h1>Admin&nbsp;&nbsp;<i class="fa-solid fa-user-tie"></i></h1>
        </nav>
        
        <%            String viewQ = "select * from account;";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(viewQ);
        %>

        <h1 class="heading">All Accounts</h1>

        <form action="viewByUsername.jsp" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="submit" id="submit" value="Search" hidden="">
            <label for="submit">&nbsp;&nbsp;<i class="fa-solid fa-magnifying-glass"></i></label>
        </form>

        <table>
            <tr class="th">
                <td>Username</td>
                <td>Full Name</td>
                <td>Gender</td>
                <td>Date Of Birth</td>
                <td>Mobile No</td>
                <td>Account No</td>
                <td>My Balance</td>
                <td>Password</td>
                <td>Security Ques</td>
                <td>Security Ans</td>
            </tr>
            <%        
                try {
                    while (rs.next()) { %>
            <tr>
                <td><% out.println(rs.getString(1)); %></td> 
                <td><% out.println(rs.getString(2)); %></td> 
                <td><% out.println(rs.getString(3)); %></td> 
                <td><% out.println(rs.getString(4)); %></td> 
                <td><% out.println(rs.getString(5)); %></td> 
                <td><% out.println(rs.getInt(6)); %></td> 
                <td><% out.println(rs.getInt(7)); %></td>
                <td><% out.println(rs.getString(8)); %></td> 
                <td><% out.println(rs.getString(9)); %></td> 
                <td><% out.println(rs.getString(10)); %></td> 
                <%
                        }
                    } catch (Exception e) {
                        out.print(e);
                    }
                %> 
            </tr>
        </table>
    </body>
</html>
