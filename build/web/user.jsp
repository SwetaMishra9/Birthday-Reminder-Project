<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Happy birth day</title>
        
         <%@page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
<jsp:useBean id="db" class="mybean.Dbcon" />

        <style>
            body{
                margin: 0px;
                padding: 0px;
            }
            #header{
                height: 100px;
                float: none;
                margin: auto;
                width: auto;
                background-image: url(images/30420-birthday-candles1.jpg);
                background-repeat: no-repeat;
                background-position: initial ;
                color: #ffffff;
                text-align: center;
                line-height:60px;
                font-size: 90px;
                font:caption;
                
            }
            #left{
                height: 580px;
                float: left;
                width: 200px;
                border: 1px solid;
                
            }
              #right{
                height: 580px;
                float: right;
                width: 130px;
                border: 1px solid;
                
            }
             #center{
                height: 580px;
                float: left;
                width: 790px;
                //border: 1px solid;
                margin-left: 2px
               
                
            }
            #sidemenu{
               height: 40px;
               width: 190px; 
               border-radius: 25px; 
               border: 1px solid; 
               margin-top: 50px; 
               margin-left: 4px ;
               text-align: center;
               line-height: 40px;
            }
            li{
                height: 20px;
                width: 60px;
                
                text-align: center;
                margin-top: 5px;
            }
            
        </style>
    </head>
    <body
        
        
            <%
        db.mkcon();
        String comming=(String)session.getAttribute("userid");
        ResultSet rs=db.fetch("select * from new_user where userid='"+comming+"'");
        if(rs.next())
        {
        %>
        <div id="header">
            <center><table>
                    <tr><th><center><font style="color: darkolivegreen"><h1>Welcome <%=rs.getString(2)%></h1></font></center></th></tr><%}%></table><hr />
            </center>
        </div>
        <div id="left">
            <div id="sidemenu">
                <a href="viewprofile.jsp" target="iframe">View Profile </a></div>
            <div id="sidemenu">
                <a href="changepas.jsp" target="iframe">  Change Password</a> </div> 
            <div id="sidemenu">
                <a href="birthrecord.jsp" target="iframe">  Birth Day Record </a></div> 
           
            
        
            <div id="sidemenu">
                
                <a href="logout.jsp" target="_self">Log Out</a> </div> 
            
        </div>
        <div id="center">
            <iframe name="iframe" src="viewprofile.jsp" height="580px" width="790px" frameborder="no">
            </iframe>          
            
        </div>
        
       
    </body>
</html>
