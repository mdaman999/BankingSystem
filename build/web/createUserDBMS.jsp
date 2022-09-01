<%@page import="java.util.Random"%>
<%@include file="DBCON.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create user DBMS Page</title>
        <link rel="stylesheet" href="css/failedSuccess.scss">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    </head>
    <body>
        <%            
            String username = request.getParameter("username");
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String mob = request.getParameter("mob");
            String password = request.getParameter("password");
            String ques = request.getParameter("ques");
            String ans = request.getParameter("ans");
            int userBal=0;

            try {
                
                String createQ = "create table " + username + "(transid int(30) unique, username varchar(30), name varchar(30), accno int(30), ref varchar(30),status varchar(30),fromAcc varchar(30), toAcc varchar(30),amount int(30),mybal int(30),dot varchar(30), time varchar(30));";
                PreparedStatement pst = con.prepareStatement(createQ);
                pst.executeUpdate();
                
                int accno=(int)Math.floor(Math.random()*(9900000-4000000)+9900000);

                String insertQ = "insert into account values(?,?,?,?,?,?,?,?,?,?);";
                PreparedStatement pst2 = con.prepareStatement(insertQ);

                pst2.setString(1, username);
                pst2.setString(2, name);
                pst2.setString(3, gender);
                pst2.setString(4, dob);
                pst2.setString(5, mob);
                pst2.setInt(6, accno);
                pst2.setInt(7, userBal);
                pst2.setString(8, password);
                pst2.setString(9, ques);
                pst2.setString(10, ans);

                pst2.executeUpdate();

                
        %>
        <div class="data">
            <i id="right" class="fa-solid fa-circle-check"></i>
            <h4>Dear Admin, You have created a account Successfully.</h4>
            <p>User's Account Number is <b><% out.println(accno); %></b><br></p>
            <a class="backcTP" href="adminPannel.jsp">Back To Admin Pannel</a>
        </div>
        <%
        } catch (Exception e) {

        %>
        <div class="data">
            <i id="cross" class="fa-solid fa-xmark"></i>
            <h2>Account not created</h2>
            <p><b>Reason:</b> <% out.print(e); %></p>
        </div>
        <%
            }
        %>

    </body>
</html>
