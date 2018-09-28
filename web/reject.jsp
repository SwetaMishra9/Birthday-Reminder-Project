<%-- 
    Document   : reject
    Created on : Jan 10, 2015, 11:58:49 AM
    Author     : SPS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Happy Birth Day</title>
<%@page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="db" class="mybean.Dbcon" />
    </head>
    <body>
       <%
         db.mkcon();
         String id=request.getParameter("name");
         out.println("id valueeeeee"+id);
         
         int upd=db.dbupdate("DELETE  from new_user where id='"+id+"' ");
         if(upd>0)
         {
             out.println("user rejected");
         }
       %>
    </body>
</html>
