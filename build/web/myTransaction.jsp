<%@include file="DBCON.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My All Transaction Page</title>
        <link rel="stylesheet" href="css/view.scss">
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
        <h1 class="heading">My All Transaction Page</h1>
        <%
            String viewQ = "select * from "+username+";";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(viewQ);
            
//            int myBal=0;
//            String myBalViewQ = "select mybal from "+username+";";
//            Statement st2 = con.createStatement();
//            ResultSet rs2 = st2.executeQuery(myBalViewQ);
//            while(rs2.next()){
//                 myBal=rs2.getInt(1);
//            }
            
        %>
        
        <table class="custT">
            <tr class="th">
                <td>Transaction ID</td>
                <td>Username</td>
                <td>Full Name</td>
                <td>Account No</td>
                <td>Reference</td>
                <td>Status</td>
                <td>From</td>
                <td>To</td>
                <td>Amount</td>
                <td>My Balance</td>
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
                <td><% out.println(rs.getString(7)); %></td> 
                <td><% out.println(rs.getString(8)); %></td> 
                <td><% out.println(rs.getInt(9)); %></td> 
                <td><% out.println(rs.getInt(10)); %></td>
                <td><% out.println(rs.getString(11)); %></td> 
                <td><% out.println(rs.getString(12)); %></td> 
                <%
                    }
                %> 
            </tr>
        </table>
    </body>
</html>
