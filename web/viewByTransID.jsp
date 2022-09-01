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
        try{
            int transid =Integer.parseInt(request.getParameter("transid"));

            String name="";
            String nameQ = "select name from transaction where transid=" + transid + ";";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(nameQ);
            while(rs.next()){
                name+=rs.getString(1);
            }
            
            
            String viewQ = "select * from transaction where transid="+transid+";";
            Statement st2 = con.createStatement();
            ResultSet rs2 = st2.executeQuery(viewQ);
        %>

        <h1 class="heading"><span style="color: #82cafa"><% out.print(name); %></span>: all Transaction</h1>

        <form action="viewByUsernameTrans.jsp" method="post">
            <input type="text" name="username" placeholder="Transaction ID" required>
            <input type="submit" id="submit" value="Search" hidden="">
            <label for="submit">&nbsp;&nbsp;<i class="fa-solid fa-magnifying-glass"></i></label>
        </form>

        <table class="trans">
            <tr class="th">
                <td>Transaction ID</td>
                <td>Username</td>
                <td>Full Name</td>
                <td>Account No</td>
                <td>Reference</td>
                <td>Status</td>
                <td>Amount</td>
                <td>Date of Transaction</td>
                <td>Time</td>
            </tr>
            <%
                while (rs2.next()) { %>
             <tr>
                <td><% out.println(rs2.getInt(1)); %></td> 
                <td><% out.println(rs2.getString(2)); %></td>
                <td><% out.println(rs2.getString(3)); %></td> 
                <td><% out.println(rs2.getInt(4)); %></td> 
                <td><% out.println(rs2.getString(5)); %></td> 
                <td><% out.println(rs2.getString(6)); %></td> 
                <td><% out.println(rs2.getInt(7)); %></td> 
                <td><% out.println(rs2.getString(9)); %></td> 
                <td><% out.println(rs2.getString(10)); %></td>
                <%
                    }
        }catch(Exception e){
            out.println(e);
        }
                %> 
            </tr>
        </table>
    </body>
</html>
