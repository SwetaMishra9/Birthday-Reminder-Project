<%-- 
    Document   : change_password
    Created on : Jan 8, 2015, 12:00:32 PM
    Author     : SPS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Happy Birth Day</title>
         <%@page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
<jsp:useBean id="db" class="mybean.Dbcon" />
<jsp:useBean id="db1" class="mybean.Dbcon" />
<jsp:useBean id="db2" class="mybean.Dbcon" />
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
    </head>
    <body>
        <h1>Change Password</h1>
        <%
        db.mkcon();
        db1.mkcon();
        db2.mkcon();
        String userid=(String)session.getAttribute("userid");
        String old_pass=request.getParameter("oldpass");
        String new_pass=request.getParameter("newpass");
        String cnfrm_pass=request.getParameter("confirmpass");
        
       ResultSet rs=db.fetch("select * from approved_member where userid='"+userid+"'");
       if(rs.next())
       {
           String password=rs.getString(9);
           //out.println("passsss"+password);
           String mail=rs.getString(5);
       
       //out.println("mail id  "+mail);}
         //  System.out.println("<br />db pass..."+password+"<br /> comming pass.........."+old_pass);
           
         if(password.equals(old_pass))
           {
               out.println("comming");
                 int upd=db1.dbupdate("update login set password='"+cnfrm_pass+"' where password='"+old_pass+"'");
                  if(upd>0)
                  {
                      out.println("comming");
                    int npd=db2.dbupdate("update approved_member set password='"+cnfrm_pass+"' where password='"+old_pass+"'");
                    if(npd>0)
                    {
                       final String username = "shikshasagar.query@gmail.com";
		final String mailpassword = "swetashiksha";
		
                	String smail=mail;
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
 
		try {
 
			Message message = new MimeMessage(s);
			message.setFrom(new InternetAddress("shikshasagar.query@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(smail));
				//InternetAddress.parse("swetasomya39@gmail.com"));
			message.setSubject("Notification from Birthday reminder application");
			message.setText("Dear, Your password for the User Id = "+userid+" of Birthday Reminder Application is changed" );
 
			Transport.send(message);
             
			//System.out.println("Mail has been send Successfully");
			//out.println("Mail has been send Successfully");
                        } catch (MessagingException e) {
			throw new RuntimeException(e);
	            }
                     
               response.sendRedirect("changepas.jsp?msg=Password changed");
                    }
                  }
           }
           else{
               response.sendRedirect("changepas.jsp?msg=Old password is Wrong");
           }
       }
      
        %>
        
    </body>
</html>
