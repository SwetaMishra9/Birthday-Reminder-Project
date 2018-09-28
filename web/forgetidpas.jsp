<%-- 
    Document   : forgetidpas
    Created on : Feb 10, 2015, 2:04:19 PM
    Author     : SPS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            div{
                color: #ffffff;
                width:650px;
                height: 200px;
              
            }
        </style>
          <script>
function validateForm() {
    var x = document.forms["frm"]["mail"].value;
    if (x==null || x=="") {
        alert("Please enter your mail id");
        return false;
    }
}
</script>
    </head>
    <body>
    <center> <div>
            
            <p><center><b><font color="white">Forget Id or Password</font></b></center></p>
            <form name="frm" action="Forget_pass.jsp" method="post" onsubmit="return validateForm()">
            <table>
                <tr><th style="height: 40px;">Your E-mail Id or Contact No :-</th>
                    <th><input type="email" name="mail" value="" placeholder="Inter your mail id" width="400px"/></th></tr>
                <th colspan="2"><%if(request.getParameter("msg")!=null){ %><%= request.getParameter("msg")%><%} %></th></tr>
            <tr><th colspan="2"><input type="submit" name="submit" value="Submit"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="firstlogin.jsp" target="ifrm"><font color="white"><input type="button" value="Back" width="190px"/></font></a></th></tr>
            </table>
            </form>
        </div></center>
    </body>
</html>
