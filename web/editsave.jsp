<%-- 
    Document   : editsave
    Created on : Feb 12, 2015, 3:46:17 PM
    Author     : SPS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <%@page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="db" class="mybean.Dbcon" />
    </head>
    <body>
         <%
      
         db.mkcon();
         String btn=request.getParameter("gobtn");
         out.println(""+btn);
         String id= request.getParameter("userid");
         String name=request.getParameter("name");
         String contact=request.getParameter("contact");
         String add=request.getParameter("add");
         String mail=request.getParameter("mail");
         //String ndate=request.getParameter("dat");
       // out.println(""+id+"'''''''''''''''''"+name+"''''''''''''''"+contact+"''''''''''"+add+"'''''''"+mail);
         if(btn.equals("save"))
         {
         int upd=db.dbupdate("update approved_member set name='"+name+"',contact_no='"+contact+"',address='"+add+"',mail='"+mail+"' where userid='"+id+"'");
         if(upd>0)
         {
             //out.println("Profile is upated");
             response.sendRedirect("view_user.jsp");
         }
         }
         else{
                  if(btn.equals("Delete"))
                 {
              int del=db.dbupdate("delete from approved_member where userid='"+id+"'");
         if(del>0)
         {
             //out.println("Profile is delete");
             response.sendRedirect("view_user.jsp");
         }
         }
         }  
      %>
    </body>
</html>
