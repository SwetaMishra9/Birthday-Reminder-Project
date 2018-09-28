<!--Script by hscripts.com-->
<!-- Free javascripts @ https://www.hscripts.com -->
<html>
    
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="db" class="mybean.Dbcon" />
<script type="text/javascript">
checked=false;
function checkedAll (frm1)
{
    var aa= document.getElementById('frm1');
    if (checked == false)
      {
        checked = true
       }
       else
      {
         checked = false;
       }
       for (var i =0; i < aa.elements.length; i++)
       { 
           aa.elements[i].checked = checked;
       }
}
</script>
<script type="text/javascript">
    function getsearch()
    {
	   var search=document.frmsearch.search.value;
	  
	   if(search=="0")
           {
	      alert("value o");
		  return false;
	   }
	   else{
               alert(search);
	      frmsearch.method="post";
	      frmsearch.action="testing.jsp?search="+search;
	      frmsearch.submit();
              alert(search);
	   }
	}
 </script>

    </head>
    <body>
          <input type='checkbox' name='checkall' onclick='checkedAll(frm1);'>
       <form id ="frm1">
         
<input type="checkbox" name="chk1">
<input type="checkbox" name="chk2">
</form>
        
    <center> <form name="frmsearch"  method="post" >
        <table>
            <tr> <th>  
                      <select name="search" id="search">
                        <option value="0">Select</option>
                         <option value="1">By Contact</option>
                         <option value="2">By Name</option>
                    </select>
                  </th>
                  <th><input type="button" value="Search" onclick="getsearch()" /></th>
            </tr>
        </table>
        <%
        String comming=request.getParameter("search");
   out.println("valueeeeeeee..........."+comming);
        %>
        </form>
    
        <form name="frm3" method="post">
            <select name="select">
                <option value="0">select</option>
                <option value="1">NAME</option>
                <option value="2">CONTACT</option>
            </select>
            <input type="text" name="name" />
                   
            <input type="text" value="search">
    </form>
    
    
    </center>    
    
      <select name="one" onchange="if (this.options[this.selectedIndex].value =='other'){document.myform['other'].style.visibility='visible'}else {document.myform['other'].style.visibility='hidden'};">
             <option value="" selected="selected">Select...</option>
             <option value="1">1</option>
             <option value="2">3</option>
             <option value="3">3</option>
             <option value="4">4</option>
             <option value="5">5</option>
             <option value="6">6</option>
             <option value="7">7</option>
             <option value="other">Other</option>
          </select>
         <input type="textbox" name="other" style="visibility:hidden;"/>

    </body>
</html>




<%-- 
    Document   : birth
    Created on : Jan 8, 2015, 3:33:08 PM
    Author     : SPS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HAPPY BIRTH DAY</title>
        <%@page import="java.io.*"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
<jsp:useBean id="db" class="mybean.Dbcon" />
    </head>
    <body>
        
     <%
		//final String username = "mrazautl@gmail.com";
		//final String password = "Raza5610";
		
		String[] btn=request.getParameterValues("radio");  
                
                int select=btn.length;
                for(int i=0; i<select; i++)
                {
                    out.println("comminggggggggggggggg"+btn[i]);
                
           ResultSet rs=db.fetch("select * from birth_day_rec where id='"+btn[i]+"'");
           while(rs.next())
            {
                String mail=rs.getString(4);
                String name=rs.getString(2);
                
                out.println("......."+mail+"............."+name);
                
                final String username = "shikshasagar.query@gmail.com";
		final String mailpassword = "swetashiksha";
                
                String smail=mail;
                
                out.println(name);
                
                Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "25");
 
		Session s = Session.getInstance(props,new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, mailpassword);
			}
		  });
                out.println(name);
                	/*try {
 
			Message message = new MimeMessage(s);
			message.setFrom(new InternetAddress("shikshasagar.query@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(mail));
				//InternetAddress.parse("swetasomya39@gmail.com"));
			message.setSubject("For Wshing You");
			message.setText("Dear,Hello Wish You a very very Happy Birth Day"+name);
 
			Transport.send(message);
             
			System.out.println("Mail has been send Successfully");
			out.println("Mail has been send Successfully");
			out.println(""+smail);
			//response.sendRedirect("ackmail.jsp?ack="+smail);
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
	            }*/
     
     
    
     }	
		
           }	
%>
  
            
    
    </body>
</html>
