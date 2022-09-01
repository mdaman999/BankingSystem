<%@include  file="DBCON.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fund Transfer DBMS Page</title>
        <link rel="stylesheet" href="css/failedSuccess.scss">
    </head>
    <body>
        <%
            try{
                    String username=(String)session.getAttribute("username_passed");
                    int transid=(int)Math.floor(Math.random()*(9900-4000)+9900);
                    int myLastBal=0,myacc=0,toLastBal=0;

                    String toaccDetails=request.getParameter("toaccDetails");
                    String ref=request.getParameter("ref");
                    String amount=request.getParameter("amount");

                    String[] arr=toaccDetails.split(":");
                    String tousername=arr[0];
                    String toname=arr[1];
                    String toacc=arr[2];
                    
                    String balQ="Select mybal from "+username+";";
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery(balQ);
                    while(rs.next()){
                        myLastBal=rs.getInt(1);
                    }
                    
                    String name="";
                    String nameQ="Select name from "+username+";";
                    Statement st4=con.createStatement();
                    ResultSet rs4=st4.executeQuery(nameQ);
                    while(rs4.next()){
                        name=rs4.getString(1);
                    }
                    
                    String accQ="Select accno from "+username+" where username='"+username+"';";
                    Statement st2=con.createStatement();
                    ResultSet rs2=st2.executeQuery(accQ);
                    while(rs2.next()){
                        myacc=rs2.getInt(1);
                    }
                    
                    String dateTime="";
                    String dateTimeQ="select now();";
                    Statement st3=con.createStatement();
                    ResultSet rs3=st3.executeQuery(dateTimeQ);
                    while(rs3.next()){
                        dateTime=rs3.getString(1);
                    }
                    
                    String[] arr2=dateTime.split(" ");
                    String dot=arr2[0];
                    String time=arr2[1];
                    
                    String tobalQ="Select mybal from "+tousername+" where username='"+tousername+"';";
                    Statement st6=con.createStatement();
                    ResultSet rs6=st6.executeQuery(tobalQ);
                    while(rs6.next()){
                        toLastBal=rs6.getInt(1);
                    }

                    if(myLastBal>Integer.parseInt(amount))
                    {
                    
                    String insertQ1="insert into "+username+" values(?,?,?,?,?,?,?,?,?,?,?,?);";
                    PreparedStatement pst=con.prepareStatement(insertQ1);
                    pst.setInt(1, transid);
                    pst.setString(2, username);
                    pst.setString(3, name);
                    pst.setInt(4,myacc);
                    pst.setString(5, "myself");
                    pst.setString(6, "Transfer");
                    pst.setInt(7,myacc);
                    pst.setString(8,toacc);
                    pst.setString(9, amount);
                    pst.setInt(10, myLastBal-Integer.parseInt(amount));
                    pst.setString(11, dot);
                    pst.setString(12, time);
                    pst.executeUpdate();
                    
                    
                    String insertQ2="insert into "+tousername+" values(?,?,?,?,?,?,?,?,?,?,?,?);";
                    PreparedStatement pst2=con.prepareStatement(insertQ2);
                    pst2.setInt(1, transid);
                    pst2.setString(2, tousername);
                    pst2.setString(3, toname);
                    pst2.setString(4,toacc);
                    pst2.setString(5, "myself");
                    pst2.setString(6, "Transfer");
                    pst2.setInt(7,myacc);
                    pst2.setString(8,toacc);
                    pst2.setString(9, amount);
                    pst2.setInt(10, toLastBal+Integer.parseInt(amount));
                    pst2.setString(11, dot);
                    pst2.setString(12, time);
                    pst2.executeUpdate();
                    
                    String updatedmybalQ = "update account set userbal=" + (myLastBal-Integer.parseInt(amount)) + " where username='" + username + "';";
                    PreparedStatement pst3 = con.prepareStatement(updatedmybalQ);
                    pst3.executeUpdate();
                    
                    String updatedtobalQ = "update account set userbal=" + (toLastBal+Integer.parseInt(amount)) + " where username='" + tousername + "';";
                    PreparedStatement pst4 = con.prepareStatement(updatedtobalQ);
                    pst4.executeUpdate();
                    
                     %>
                    <div class="data">
                        <i id="right" class="fa-solid fa-circle-check"></i>
                        <h3>Dear Admin, You have Transfer Successfully.</h3>
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
                            <h2>Amount Not Transfer</h2>
                            <p><b>Reason:</b> <% out.print("Sorry, Insufficient balance!"); %></p>
                        </div>
                        <%
                    }
        } 
        catch (Exception e) {
        %>
        <div class="data">
            <i id="cross" class="fa-solid fa-xmark"></i>
            <h2>Amount Not Transfer</h2>
            <p><b>Reason:</b> <% out.print(e); %></p>
        </div>
        <%
            }
        %>
    </body>
</html>
