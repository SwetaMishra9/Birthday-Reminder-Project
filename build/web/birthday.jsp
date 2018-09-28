<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Happy Birth Day</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link type='text/css' href='css/osx.css' rel='stylesheet' media='screen' />
        <style>
            body{ 
               // background-image:url(images/templatmeo_body_top.jpg);
               // background-repeat: repeat-x;
                
                background-image:url(images/14554-happy-birthday-1680x1050-holiday-wallpaper.jpg);
                 background-repeat: no-repeat;
               
            }
 #login.background
{
  width:420px;
  height:400px;
  border-radius: 10px;
 margin-top: 1500px;
 border: 1px solid;
 border-color: white;
 color: #ffffff;

  
}
div.transbox
{
  
  background-color: blueviolet;
  
  color: #ffffff;
  opacity:0.5;
  filter:alpha(opacity=70);
  height: 250px; 
  width: 1290px; 
  float: none;
  margin: auto;
  boredr:1px solid;
  
}


        </style>
      <script>
function validateForm1() {
    var x = document.forms["frm1"]["name","mail","contact","type","dat","add"].value;
    if (x==null || x=="") {
        alert("All field should be filled out");
        return false;
    }
}


function validateForm() {
    var y = document.forms["frm"]["name","pass"].value;
    if (y==null || y=="") {
        alert("All field should be filled out");
        return false;
        
        
    }
}
function validateForm2() {
    var z = document.forms["frm2"]["mail"].value;
    if (z==null || z=="") {
        alert("Please enter your mail id");
        return false;
    }
}
        
</script>
<script>
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
      
<center >  
    
    <div  id="login" style="margin-top:220px;" >
          <div class="background">
                <div class="transbox">
                 
                   <center><div>
                 
                      <center>  
     <div style=" width: 300px; height: 220px; border-radius: 10px; border:1px solid; border-color:white;  margin-top:10px;" >       
        <form name="frm" action="login.jsp" method="post" onsubmit="return validateForm()">
        <table cellpadding="5" cellspacing="5">
            <tr><th colspan="2">Login</th></tr>
            <tr><th>User Name</th><th><input type="text" name="name" value=""  /></th></tr>
            <tr><th>Password</th><th><input type="password" name="pass" value=""/></th></tr>
            
            <tr><th colspan="2"><input type="submit" value="Login"  /></th></tr>
            <tr>
                <th colspan="2"><%if(request.getParameter("msg")!=null){ %><%= request.getParameter("msg")%><%} %></th>
           </tr>
           
           <!-- <tr><th colspan="2"><font style="color: #ffffff">New User</font></th></tr>-->
     
            
            
        </table>
           
        </form>
           
             
<div id='osx-modal'>
			
    <a href='#' class='osx'><font style=" color: white"><b>Forget Id and Password</b></a></a>
		</div>
           <br />
	    <div id='osx-modal1'>
			
                <a href='#' class='osx1'><font style=" color: white"><b>New User</b></a></a>
		</div>
	
		<!-- modal content -->
		<div id="osx-modal-content">
			<div id="osx-modal-title">Get your password through e-mail</div>
			<div class="close"><a href="#" class="simplemodal-close">x</a></div>
			<div id="osx-modal-data">
			 <center> <div>
            
            <p><center><b>Forget Id or Password</b></center></p>
            <form name="frm2" action="Forget_pass.jsp" method="post" onsubmit="return validateForm2()">
            <table>
                <tr><th style="height: 40px;">Your E-mail Id or Contact No :-</th>
                    <th><input type="email" name="mail" value="" placeholder="Inter your mail id" width="400px"/></th></tr>
                <th colspan="2"><%if(request.getParameter("msgs")!=null){ %><%= request.getParameter("msgs")%><%} %></th></tr>
            <tr><th colspan="2"><input type="submit" name="submit" value="Submit"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
            </table>
            </form>
        </div></center>	
		<p><button class="simplemodal-close">Close</button> <span>(or press ESC or click the overlay)</span></p>
			</div>
		</div>
	
	<div id="osx-modal-content1">
			<div id="osx-modal-title1">New User Registration</div>
			<div class="close"><a href="#" class="simplemodal-close">x</a></div>
			<div id="osx-modal-data1">
        <center><div style=" width: 320px; height: 360px;  margin-top: 10px; border-radius: 2px" class="box">
        <form name="frm1" action="newuser.jsp" method="post" onsubmit="return validateForm1()">
        <table cellpadding="5" cellspacing="5">
            <tr><th colspan="2">Login Form</th></tr>
            <tr><th>Name</th><th><input type="text" name="name" value="" placeholder="Name" /></th></tr>
            <tr><th>E-mail</th><th><input type="email" name="mail" value="" placeholder="E-mail" /></th></tr>
            <tr><th>Contact No</th><th><input type="text" name="contact" maxlength="10"value="" placeholder="xxxxxxxxxx" /></th></tr>
            <tr><th>Type</th><th><input type="text" value="User" name="type" readonly="readonly"/></th></tr>
            <tr><th>Date</th><th><input type="date" value="" name="dat"/></th></tr>
            <tr><th>Address</th><th><textarea name="add" rows="3" cols="20" placeholder="Your Addres"></textarea></th></tr>
            <tr><th colspan="2"><input type="submit" value="Submit" /></th></tr> </table>
        </form>
        </div></center>
				<p><button class="simplemodal-close">Close</button> <span>(or press ESC or click the overlay)</span></p>
			</div>
		</div>
        </div></center>
                       </div></center>
                </div>
                
            </div>
            
    </div>
    </center>  
  

    <script type='text/javascript' src='js/jquery1.js'></script>
<script type='text/javascript' src='js/jquery.simplemodal.js'></script>
<script type='text/javascript' src='js/osx.js'></script>
</body>
</html>
