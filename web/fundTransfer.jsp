<%@include  file="DBCON.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fund Transfer Page</title>
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
        <h1>Fund Transfer Page</h1>
        <form action="fundTransferDBMS.jsp" method="post">
            To Account: <select name="toaccDetails" required>
                <%            
                    String viewQ = "select * from account;";
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(viewQ);
                    
                    while(rs.next()){ 
                        if(!rs.getString(1).equalsIgnoreCase(username))
                        {
                %>
                <option><% out.println(rs.getString(1)); %>:<% out.println(rs.getString(2)); %>:<% out.println(rs.getString(6)); %></option>
                <%
                        }
                    }
                %>
            </select>
            
            <input type="text" name="ref" placeholder="Referance" required>
            <input type="text" name="amount" placeholder="Amount" required>
            <input type="submit" name="transfer" value="Transfer">
        </form>
    </body>
</html>
