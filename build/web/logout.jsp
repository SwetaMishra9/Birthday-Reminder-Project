<%-- 
    Document   : logout
    Created on : Jan 8, 2015, 12:57:16 PM
    Author     : SPS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Happy Birth Day</title>
    </head>
    <%
         session.invalidate();
         response.sendRedirect("birthday.jsp");
       %>
       
<body>
    
    </body>
</html>
