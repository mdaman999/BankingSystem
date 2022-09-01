<%@page import="java.util.Random"%>
<%@include file="DBCON.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Withdraw DBMS Page</title>
        <link rel="stylesheet" href="css/failedSuccess.scss">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    </head>
    <body>
        <%            
            try {    
                int transid=(int)Math.floor(Math.random()*(9900-4000)+9900);
                int bankLastBal = 0  , myLastBal=0;
;

                String fromaccDetails = request.getParameter("fromaccDetails");
                String ref = request.getParameter("ref");
                String amount = request.getParameter("amount");

                String[] arr = fromaccDetails.split(":");
                String username = arr[0];
                String name = arr[1];
                String fromacc = arr[2];
                
                String dateTime = "";

                String balQ="Select netbal from transaction;";
                String dateTimeQ = "select now();";

                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(balQ);
                while (rs.next()) {
                    bankLastBal = rs.getInt(1);
                }

                Statement st2 = con.createStatement();
                ResultSet rs2 = st2.executeQuery(dateTimeQ);
                while (rs2.next()) {
                    dateTime = rs2.getString(1);
                }

                String[] arr2 = dateTime.split(" ");
                String dot = arr2[0];
                String time = arr2[1];

               
                
                
                
                
                String myBalQ = "Select mybal from "+username+";";
                Statement st3 = con.createStatement();
                ResultSet rs3 = st3.executeQuery(myBalQ);
                while (rs3.next()) {
                    myLastBal = rs3.getInt(1);
                }
                
                
                if(myLastBal>Integer.parseInt(amount)){
                    
                    String insertQ = "insert into transaction values(?,?,?,?,?,?,?,?,?,?);";
                    PreparedStatement pst = con.prepareStatement(insertQ);

                    pst.setInt(1, transid);
                    pst.setString(2, username);
                    pst.setString(3, name);
                    pst.setString(4, fromacc);
                    pst.setString(5, "Admin");
                    pst.setString(6, "Withdraw");
                    pst.setInt(7, Integer.parseInt(amount));
                    pst.setInt(8, bankLastBal - Integer.parseInt(amount));
                    pst.setString(9, dot);
                    pst.setString(10, time);

                    pst.executeUpdate();
                    
                    
                    
                    
                    
                    String insertQ2="insert into "+username+" values(?,?,?,?,?,?,?,?,?,?,?,?);";
                    PreparedStatement pst2=con.prepareStatement(insertQ2);
                    
                    pst2.setInt(1, transid);
                    pst2.setString(2, username);
                    pst2.setString(3, name);
                    pst2.setString(4, fromacc);
                    pst2.setString(5, "Admin");
                    pst2.setString(6, "Withdraw");
                    pst2.setString(7, "-");
                    pst2.setString(8, "-");
                    pst2.setInt(9,Integer.parseInt(amount));
                    pst2.setInt(10,myLastBal-Integer.parseInt(amount));
                    pst2.setString(11, dot);
                    pst2.setString(12, time);

                    pst2.executeUpdate();
                    
                    
                    String updatedmybalQ = "update account set userbal=" + (myLastBal-Integer.parseInt(amount)) + " where username='" + username + "';";
                    PreparedStatement pst3 = con.prepareStatement(updatedmybalQ);
                    pst3.executeUpdate();
                    
                    %>
                    <div class="data">
                        <i id="right" class="fa-solid fa-circle-check"></i>
                        <h3>Dear Admin, You have Withdraw Successfully.</h3>
                        <p>Your Transaction ID: <% out.print(transid); %></p>
                        <h1 style="color: red">-<% out.println(amount); %></h1>
                        <a class="backcTP" href="adminPannel.jsp">Back To Admin Pannel</a>
                    </div>
                    <%
                }
                else{
                    %>
                    <div class="data">
                        <i id="cross" class="fa-solid fa-xmark"></i>
                        <h2>Amount Not Withdraw</h2>
                        <p><% out.print("Insufficient Balance!"); %></p>
                    </div>
                    <%
                } 
        } 
        catch (Exception e) {
        %>
        <div class="data">
            <i id="cross" class="fa-solid fa-xmark"></i>
            <h2>Amount Not Withdraw</h2>
            <p><b>Reason:</b> <% out.print(e); %></p>
        </div>
        <%
            }
        %>
    </body>
</html>
