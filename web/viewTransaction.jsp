<%@include file="DBCON.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Transaction Page</title>
        <link rel="stylesheet" href="css/view.scss">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    </head>
    <body>
        <nav>
            <h1>EBank</h1>
            <h1>Admin&nbsp;&nbsp;<i class="fa-solid fa-user-tie"></i></h1>
        </nav>
        <%            
            String viewQ = "select * from transaction;";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(viewQ);
        %>
        
        <h1 class="heading">All Transaction With Bank</h1>
        
        <form action="viewByTransID.jsp" method="post">
            <input type="text" name="transid" placeholder="Transaction ID" required>
            <input type="submit" id="submit" value="Search" hidden="">
            <label for="submit">&nbsp;&nbsp;<i class="fa-solid fa-magnifying-glass"></i></label>
        </form>

        <table>
            <tr class="th">
                <td>Transaction ID</td>
                <td>Username</td>
                <td>Full Name</td>
                <td>Account No</td>
                <td>Reference</td>
                <td>Status</td>
                <td>Amount</td>
                <td>Net Balance</td>
                <td>Date of Transaction</td>
                <td>Time</td>
            </tr>
            <%
                while (rs.next()) { %>
            <tr>
                <td><% out.println(rs.getInt(1)); %></td> 
                <td><% out.println(rs.getString(2)); %></td>
                <td><% out.println(rs.getString(3)); %></td> 
                <td><% out.println(rs.getInt(4)); %></td> 
                <td><% out.println(rs.getString(5)); %></td> 
                <td><% out.println(rs.getString(6)); %></td> 
                <td><% out.println(rs.getInt(7)); %></td> 
                <td><% out.println(rs.getInt(8)); %></td> 
                <td><% out.println(rs.getString(9)); %></td> 
                <td><% out.println(rs.getString(10)); %></td>
                <%
                    }
                %> 
            </tr>
        </table>
    </body>
</html>
