<%-- 
    Document   : editprofile
    Created on : Jan 10, 2015, 3:16:55 PM
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
  
    var name=document.frm1.name.value;
    var con=document.frm1.contact.value;
    var add=document.frm1.Address.value;
    var mail=document.frm1.mail.value;
   
     // alert(""+name+"......"+con+"........"+add+"......."+mail);
    
      
      if(name==""||con==""||add==""||mail=="")
      {
        alert("Please don't live any field blank ");
        return false;
    }
    return true;
}
</script>
<script>
    function ValidateNumberOnly()
{
if ((event.keyCode < 48 || event.keyCode > 57)) 
{
       event.returnValue = false;
       alert("Please enter Integer number");
}
}

function LettersWithSpaceOnly (evt) 
{
    evt = (evt) ? evt : event;
    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
    ((evt.which) ? evt.which : 0));
    if (charCode > 32 && (charCode < 65 || charCode > 90) &&
        (charCode < 97 || charCode > 122)) {
            return false;
        }
    return true;
}
function deleteAllCookies() {
    var cookies = document.cookie.split(";");

    for (var i = 0; i < cookies.length; i++) {
    	var cookie = cookies[i];
    	var eqPos = cookie.indexOf("=");
    	var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
    	document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
    }
}
    </script>
    </head>
    <body onload="deleteAllCookies()">
         <%
        
        db.mkcon();
        String sweta=(String)session.getAttribute("userid");
       // out.println(sweta);
        ResultSet rs=db.fetch("select * from approved_member where userid='"+sweta+"'");
        if(rs.next())
        {
         %>
        
    <center>   <h1>Edit Profile</h1></center>
    <center> <form name="frm1" action="save.jsp" method="post" >
         <table cellpadding="3" cellspacing="3">
             <tr>
                 <th>Name:-</th><th><input type="text" name="name" value="<%=rs.getString(2)%>" onkeypress="return LettersWithSpaceOnly()"></th>
             </tr>
             <tr>
                 <th>Contact No:-</th><th >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;<input type="text" value="+91" readonly="readonly" style="width:25px;"/>
                     &nbsp;&nbsp;<input type="text" name="contact" value="<%=rs.getString(3)%>" maxlength="10" width="100px" onkeypress="return ValidateNumberOnly()"></th>
             </tr>
             <tr>
                 <th>Address:-</th><th><input type="text" name="Address" value="<%=rs.getString(4)%>"></th>
             </tr>
             <tr>
                 <th>E-mail Id-</th><th><input type="email" name="mail" value="<%=rs.getString(5)%>" ><%}%></th>
             </tr>
             <tr><center><th colspan="2"><input type="submit" value="Save" name="Save" onclick="return validateForm()" >&nbsp;<input type="reset" value="Reset">
                     &nbsp;<a href="dashboard.jsp" target="iframe"><input type="button" value="Back"></a>
                 </th></center></tr>
         </table>
        </form></center>
        
    </body>
</html>
