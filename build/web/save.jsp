<%-- 
    Document   : save
    Created on : Jan 10, 2015, 3:24:42 PM
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
         String userid=(String)session.getAttribute("userid");
         String name=request.getParameter("name");
         String contact=request.getParameter("contact");
         String add=request.getParameter("Address");
         String mail=request.getParameter("mail");
         out.println(""+userid+"'''''''''''''''''"+name+"''''''''''''''"+contact+"''''''''''"+add+"'''''''"+mail);
         
         int upd=db.dbupdate("update approved_member set name='"+name+"',contact_no='"+contact+"',address='"+add+"',mail='"+mail+"' where userid='"+userid+"'");
         if(upd>0)
         {
             out.println("Profile is upated");
             response.sendRedirect("viewprofile.jsp");
         }
      %>
    </body>
</html>
