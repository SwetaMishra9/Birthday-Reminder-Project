<%-- 
    Document   : dashboard
    Created on : Feb 18, 2015, 3:21:50 PM
    Author     : SPS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #db{
               height: 80px; 
               width: 200px; 
               
               
               float: left; 
               margin-left: 70px; 
               margin-top: 40px; 
               border-radius: 5px;
                background-color: whitesmoke;
                opacity:0.5;
  filter:alpha(opacity=70);
  color: black;
  text-align: center;
  line-height: 80px;
            }
        </style>
    </head>
    <body>
    <center><h1>DASH BOARD</h1></center>
    
    <a href="birthrecord.jsp" target="iframe"><div id="db"> Birth Day Record</div></a>
    
    <a href="view_user.jsp" target="iframe"><div id="db"> View User</div></a>
    
    <a href="new_user.jsp" target="iframe"><div id="db"> Pending User</div></a>
    
    <a href="report.jsp" target="iframe"><div id="db">Reports</div></a>
    
    <a href="construct.jsp" target="iframe" ><div id="db">comming</div></a>
    
    <a href="construction.jsp" target="iframe" ><div id="db">comming data</div></a>
         
    <a href="deshboardseting.jsp" target="iframe"><div id="db">Dash Board setting</div></a>
    
    <a href="editprofile.jsp" target="iframe"><div id="db">Accounts Setting</div></a>
    
    <div id="db">About Software</div>
    </body>
</html>
