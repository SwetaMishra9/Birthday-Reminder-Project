<%-- 
    Document   : edit
    Created on : Jan 10, 2015, 2:18:24 PM
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

<style>
    th{
        height: 20px;
    }
    </style>
 <script>
        function ConfirmDelete()
{
  var x = confirm("Are you sure you want to delete?");
  if (x)
      return true;
  else
    return false;
}
</script>
    </head>
    <body>
    <center> <h1>User Profile</h1></center>
       
        <%
        String id=request.getParameter("id");
       // out.println("id.............."+id);
        
        ResultSet rs=db.fetch("select * from approved_member where id='"+id+"'");
        if(rs.next())
        {
          
        %>
        <form name="editfrm" method="post" action="editsave.jsp" >
        <center> <table cellpadding="3" cellspacing="3">
                <tr><th>Name:-</th><th><input type="text" value="<%=rs.getString(2)%>" name="name" readonly="readonly" /></th></tr>
            <tr><th>Contact No-</th><th><input type="text" value="<%=rs.getString(3)%>" name="contact" readonly="readonly" maxlength="10" /></th></tr>
            <tr><th>Address:-</th><th><input type="text" value="<%=rs.getString(4)%>" name="add" readonly="readonly"/></th></tr>
            <tr><th>E-mail:-</th><th><input type="email" value="<%=rs.getString(5)%>" name="mail" readonly="readonly"/></th></tr>
            <tr><th>Date:-</th><th><input type="text" value="<%=rs.getString(7)%>" name="dat" readonly="readonly"/></th></tr>
            <tr><th>User Id:-</th><th><input type="text" value="<%=rs.getString(8)%>" name="userid" readonly="readonly" /></th></tr>
            <tr><th>Password:-</th><th><input type="text" value="<%=rs.getString(9)%>" name="userpas" readonly="readonly"/></th></tr>
            <tr><th colspan="2"><input type="submit" value="Delete" name="gobtn" id="delete" Onclick="return ConfirmDelete()" />&nbsp;
                    
            <a href="view_user.jsp" target="iframe"> <input type="button" value="Back" name="Back"/></a></th></tr>
            </table></center>
        </form>
        <%}%>
    </body>
</html>
