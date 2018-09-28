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

 <script>
function validateForm() {
  
    var name=document.editfrm.name.value;
    var con=document.editfrm.contact.value;
    var add=document.editfrm.add.value;
    var mail=document.editfrm.mail.value;
    var dat=document.editfrm.dat.value;
   
   //alert(""+name+"......"+con+"........"+add+"......."+mail+",,,,,,,,,"+dat);
    
      
      if(name==""||con==""||add==""||mail==""||dat=="")
      {
        alert("Please don't live any field blank ");
        return false;
    }
    return true;
}
</script>

    </head>
    <body>
    <center> <h1>Edit Profile</h1></center>
       
        <%
        String id=request.getParameter("id");
       // out.println("id.............."+id);
        
        ResultSet rs=db.fetch("select * from approved_member where id='"+id+"'");
        if(rs.next())
        {
          
        %>
        <form name="editfrm" method="post" action="editsave.jsp" onsubmit="return validateForm()">
        <center> <table cellpadding="3" cellspacing="3">
            <tr><th>Name:-</th><th><input type="text" value="<%=rs.getString(2)%>" name="name" /></th></tr>
            <tr><th>Contact No-</th><th><input type="text" value="<%=rs.getString(3)%>" name="contact" maxlength="10" /></th></tr>
            <tr><th>Address:-</th><th><input type="text" value="<%=rs.getString(4)%>" name="add" /></th></tr>
            <tr><th>E-mail:-</th><th><input type="email" value="<%=rs.getString(5)%>" name="mail" /></th></tr>
            <tr><th>Date:-</th><th><input type="text" value="<%=rs.getString(7)%>" name="dat" /></th></tr>
            <tr><th>User Id:-</th><th><input type="text" value="<%=rs.getString(8)%>" name="userid" readonly="readonly" /></th></tr>
            <tr><th>Password:-</th><th><input type="text" value="<%=rs.getString(9)%>" name="userpas" readonly="readonly"/></th></tr>
            <tr><th colspan="2"><input type="submit" value="save" name="gobtn"/>&nbsp;
                    <input type="Reset" value="Reset" name="reset"/>&nbsp;
            <a href="view_user.jsp" target="iframe"> <input type="button" value="Back" name="Back"/></a></th></tr>
            </table></center>
        </form>
        <%}%>
    </body>
</html>
