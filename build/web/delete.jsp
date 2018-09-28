<%-- 
    Document   : delete
    Created on : Jan 10, 2015, 2:31:08 PM
    Author     : SPS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Happy New Year</title>
<%@page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="db" class="mybean.Dbcon" />
    </head>
    <body>
        <%
        String id=request.getParameter("id");
        
        out.println("ids............."+id);
       %>
    </body>
</html>
