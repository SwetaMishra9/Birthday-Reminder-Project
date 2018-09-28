<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
      <link type='text/css' href='css/osx.css' rel='stylesheet' media='screen' />
        <style>
           .box{
-moz-box-shadow: 0 0 5px #888;
-webkit-box-shadow: 0 0 5px#888;
box-shadow: 0 0 5px black;
border-radius:25px;
}
         table{color: #ffffff; float: left;}
         
         .button { width: 150px; padding: 10px; background-color: #FF8C00; box-shadow: -8px 8px 10px 3px rgba(0,0,0,0.2); font-weight:bold; text-decoration:none; } #cover{ position:fixed; top:0; left:0; background:rgba(0,0,0,0.6); z-index:5; width:100%; height:100%; display:none; } #loginScreen { height:380px; width:340px; margin:0 auto; position:relative; z-index:10; display:none; background: url(login.png) no-repeat; border:5px solid #cccccc; border-radius:10px; } #loginScreen:target, #loginScreen:target + #cover{ display:block; opacity:2; } .cancel { display:block; position:absolute; top:3px; right:2px; background:rgb(245,245,245); color:black; height:30px; width:35px; font-size:30px; text-decoration:none; text-align:center; font-weight:bold; } - See more at: http://www.corelangs.com/css/box/fulloverlay.html#sthash.QpNDzQHl.dpuf
        </style>
        <script>
function validateForm() {
    var x = document.forms["frm"]["name","pass"].value;
    if (x==null || x=="") {
        alert("All field should be filled out");
        return false;
        
        
    }
}
</script>
        
    </head>
    <body>
     
        
    <center>  <div style=" width: 300px; height: 220px; border-radius: 10px; border:1px solid; border-color:white;  margin-top:10px;" >
        
        <form name="frm" action="login.jsp" method="post" onsubmit="return validateForm()">
        <table cellpadding="5" cellspacing="5">
            <tr><th colspan="2">Login</th></tr>
            <tr><th>User Name</th><th><input type="text" name="name" value="" placeholder="User Name" /></th></tr>
            <tr><th>Password</th><th><input type="password" name="pass" value="" placeholder="********" /></th></tr>
            
            <tr><th colspan="2"><input type="submit" value="Login"  /></th></tr>
            <tr>
                <th colspan="2"><%if(request.getParameter("msg")!=null){ %><%= request.getParameter("msg")%><%} %>
           </tr>
           <div id='osx-modal'>
			
			<input type='button' name='osx' value='Demo' class='osx demo'/> or <a href='#' class='osx'>Demo</a>
		</div>
           <!-- <tr><th colspan="2"><font style="color: #ffffff">New User</font></th></tr>-->
     <tr><th colspan="2"><a href="forgetidpas.jsp" target="ifrm">
                    <font color="white">Forget your Id and Password</font></a></th></tr>
            
            
            
        </table>
           
        </form>
        </div></center>
    <div id="osx-modal-content">
			<div id="osx-modal-title">OSX Style Modal Dialog</div>
			<div class="close"><a href="#" class="simplemodal-close">x</a></div>
			<div id="osx-modal-data">
				<h2>Hello! I'm SimpleModal!</h2>
				<p>SimpleModal is a lightweight jQuery Plugin which provides a powerful interface for modal dialog development. Think of it as a modal dialog framework.</p>
				<p>SimpleModal gives you the flexibility to build whatever you can envision, while shielding you from related cross-browser issues inherent with UI development..</p>
				<p>As you can see by this example, SimpleModal can be easily configured to behave like an OSX dialog. With a handful options, 2 custom callbacks and some styling, you have a visually appealing dialog that is ready to use!</p>
				<p><button class="simplemodal-close">Close</button> <span>(or press ESC or click the overlay)</span></p>
			</div>
		</div>
	
    <script type='text/javascript' src='js/jquery1.js'></script>
<script type='text/javascript' src='js/jquery.simplemodal.js'></script>
<script type='text/javascript' src='js/osx.js'></script>
    </body>
</html>
