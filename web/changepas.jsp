
<html>
    <head>
        <title>Happy Birth Day</title>
        <%@page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
<jsp:useBean id="db" class="mybean.Dbcon" />
<style>
    body{
        
    }
    </style>
<script>
function passwordValidate(){
	//alert("Password");
	if(document.getElementById("npass").value=="" || document.getElementById("cpass").value=="" || document.getElementById("opass").value==""){
		alert("You Can't Leave Blank Any Field");
		return false;
	}
	if(document.getElementById("npass").value!=document.getElementById("cpass").value){
		alert("New Password and Confirm Password should be same! Re-enter confirm-password!");
		document.getElementById("cpass").value="";
		return false;
	}
	/*if(document.getElementById("cpwd").value!=document.getElementById("opass").value){
		alert("Old Password Is Not Correct");
		document.getElementById("opass").value="";
		return false;
	}*/
        if(document.getElementById("npass").value==document.getElementById("opass").value){
		alert("New password and Old password should not be same !");
                document.getElementById("npass").value="";
		document.getElementById("cpass").value="";
		return false;
	}
	return true;
}

</script>

    </head>
    <body>
    <center><h1>Change Password</h1></center>
          
    <center>  <form name="frm" action="change_password.jsp" method="post" onsubmit="return passwordValidate()">
        <table>
            <tr><th style=" height: 35px; width: 150px">Old Password:-</th><th style=" height: 30px;"><input type="password" name="oldpass" id="opass"  style="height: 26px; width: 250px; border: 1px solid; border-color: sienna; background-color: antiquewhite; border-radius:5px; color: black"/></th></tr>
            <tr><th style=" height: 35px; width: 150px;">New Password:-</th><th style=" height: 30px;"><input type="password" name="newpass" id="npass"  style="height: 26px; width: 250px; border: 1px solid; border-color: sienna; background-color: antiquewhite; border-radius:5px; color: black"/></th></tr>
            <tr><th style=" height: 35px; width: 150px">confirm Password:-</th><th style=" height: 30px;"><input type="password" name="confirmpass" id="cpass"  style="height: 26px; width: 250px; border: 1px solid; border-color: sienna; background-color: antiquewhite; border-radius:5px; color: black"/></th></tr>
            <tr><th colspan="2" style="height: 50px;"><input type="submit" value="Submit" style="height: 26px; width: 80px; border: 1px solid; border-color: sienna; background-color: darkkhaki; border-radius:5px; color: white" >&nbsp;&nbsp;
                    <input type="reset" value="Clear" style="height: 26px; width: 80px; border: 1px solid; border-color: sienna; background-color: darkkhaki; border-radius:5px; color: white"/>
                    &nbsp;&nbsp;<a href="dashboard.jsp" target="iframe"><input type="button" value="Back to dashboard" style="height: 26px; width: 150px; border: 1px solid; border-color: sienna; background-color: darkkhaki; border-radius:5px; color: white"></a>
                </th></tr>
            <tr><th colspan="2"><%if(request.getParameter("msg")!=null){ %><%= request.getParameter("msg")%><%} %></th></tr>
        </table>
        </form></center>
    </body>
</html>
