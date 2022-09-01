<%@page import="java.util.Random"%>
<%@include file="DBCON.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deposit DBMS Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
        <link rel="stylesheet" href="css/failedSuccess.scss">
    </head>
    <body>
        <%
            try{
                    int transid=(int)Math.floor(Math.random()*(9900-4000)+9900);
                    int bankLastBal=0;

                    String toaccDetails=request.getParameter("toaccDetails");
                    String ref=request.getParameter("ref");
                    String amount=request.getParameter("amount");

                    String[] arr=toaccDetails.split(":");
                    String username=arr[0];
                    String name=arr[1];
                    String toacc=arr[2];
                    

                    String balQ="Select netbal from transaction;";
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery(balQ);
                    while(rs.next()){
                        bankLastBal=rs.getInt(1);
                    }
                    
                    String dateTime="";
                    String dateTimeQ="select now();";
                    Statement st2=con.createStatement();
                    ResultSet rs2=st2.executeQuery(dateTimeQ);
                    while(rs2.next()){
                        dateTime=rs2.getString(1);
                    }
                    
                    String[] arr2=dateTime.split(" ");
                    String dot=arr2[0];
                    String time=arr2[1];
                    
                    if(Integer.parseInt(amount)>0)
                    {
                    String insertQ1="insert into transaction values(?,?,?,?,?,?,?,?,?,?);";
                    PreparedStatement pst=con.prepareStatement(insertQ1);
                    pst.setInt(1, transid);
                    pst.setString(2, username);
                    pst.setString(3, name);
                    pst.setString(4,toacc);
                    pst.setString(5, "Admin");
                    pst.setString(6, "Deposit");
                    pst.setInt(7,Integer.parseInt(amount));
                    pst.setInt(8,bankLastBal+Integer.parseInt(amount));
                    pst.setString(9, dot);
                    pst.setString(10, time);

                    pst.executeUpdate();
                    
                    
                    
                    
                    int myLastBal=0;
                    String myBalQ = "Select mybal from "+username+";";
                    Statement st3 = con.createStatement();
                    ResultSet rs3 = st3.executeQuery(myBalQ);
                    while (rs3.next()) {
                        myLastBal = rs3.getInt(1);
                    }
                    
                    String insertQ2="insert into "+username+" values(?,?,?,?,?,?,?,?,?,?,?,?);";
                    PreparedStatement pst2=con.prepareStatement(insertQ2);
                    
                    pst2.setInt(1, transid);
                    pst2.setString(2, username);
                    pst2.setString(3, name);
                    pst2.setString(4, toacc);
                    pst2.setString(5, "Admin");
                    pst2.setString(6, "Deposit");
                    pst2.setString(7, "-");
                    pst2.setString(8, "-");
                    pst2.setInt(9,Integer.parseInt(amount));
                    pst2.setInt(10,myLastBal+Integer.parseInt(amount));
                    pst2.setString(11, dot);
                    pst2.setString(12, time);

                    pst2.executeUpdate();
                    
                    
                    String updatedmybalQ = "update account set userbal=" + (myLastBal+Integer.parseInt(amount)) + " where username='" + username + "';";
                    PreparedStatement pst3 = con.prepareStatement(updatedmybalQ);
                    pst3.executeUpdate();
                    
                     %>
                    <div class="data">
                        <i id="right" class="fa-solid fa-circle-check"></i>
                        <h3>Dear Admin, You have Deposit Successfully.</h3>
                        <p>Your Transaction ID: <% out.print(transid); %></p>
                        <h1 style="color: greenyellow">+<% out.println(amount); %></h1>
                        <a class="backcTP" href="adminPannel.jsp">Back To Admin Pannel</a>
                    </div>
                    <%
                    }
                    else{
                        %>
                        <div class="data">
                            <i id="cross" class="fa-solid fa-xmark"></i>
                            <h2>Amount Not deposit</h2>
                            <p><b>Reason:</b> <% out.print("Please, Enter amount more than Zero !"); %></p>
                        </div>
                        <%
                    }
        } catch (Exception e) {
        %>
        <div class="data">
            <i id="cross" class="fa-solid fa-xmark"></i>
            <h2>Amount Not deposit</h2>
            <p><b>Reason:</b> <% out.print(e); %></p>
        </div>
        <%
            }
        %>
    </body>
</html>
