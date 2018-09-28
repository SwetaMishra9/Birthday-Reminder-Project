<%-- 
    Document   : profile
    Created on : Jan 4, 2015, 1:32:41 AM
    Author     : SPS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <%@page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="db" class="mybean.Dbcon" />
    </head>
    <body>
        <%
          String id=request.getParameter("id");
             // out.println("comming user...............is....."+id);
          db.mkcon();
         ResultSet rs=db.fetch("select * from new_user where id='"+id+"'");
          if(rs.next())
          {
             String name=rs.getString(2);
             //out.println("....................."+name);
          
        %>
    <center> <h1>Profile</h1></center>
        <center><form name="frm" action="pendingapprove.jsp" method="post">
             <table cellpadding="3" cellspacing="3">
            <input type="hidden"value="<%=id%>" name="btn" />
            <tr><th>Name:-</th><th><%=rs.getString(2)%></th></tr>
            <tr><th>Contact No:-</th><th><%=rs.getString(3)%></th></tr>
            <tr><th>Address-</th><th><%=rs.getString(4)%></th></tr>
            <tr><th>E-mail Id-</th><th><%=rs.getString(5)%></th></tr>
            <tr><th>Date:-</th><th><%=rs.getString(7)%></th></tr>
            <tr><th colspan="2"><input type="submit" value="Approve" name="submit" />&nbsp;&nbsp;<input type="submit" value="Reject" name="submit" /></th></tr>
            
            <%}%>
             </table></form></center>
    </body> 
</html>
