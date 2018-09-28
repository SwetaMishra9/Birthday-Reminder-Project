<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>

<%@page import="java.io.*"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%
		//final String username = "mrazautl@gmail.com";
		//final String password = "Raza5610";
		
		
		
		String smail=request.getParameter("mail");
                out.println(""+smail);
                
                
		
		final String username = "shikshasagar.query@gmail.com";
		final String password = "swetashiksha";
		
		//String smail="mrazautl@gmail.com";
		//String mail="swetasoft.developer@gmail.com";
         // String mail="swetasomya39@gmail.com";
		
		String mail=smail;
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "25");
 
		Session s = Session.getInstance(props,new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
 
		try {
 
			Message message = new MimeMessage(s);
			message.setFrom(new InternetAddress("shikshasagar.query@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(mail));
				//InternetAddress.parse("swetasomya39@gmail.com"));
			message.setSubject("For inviting You");
			message.setText("Dear,customer your accout activated" );
 
			Transport.send(message);
             
			System.out.println("Mail has been send Successfully");
			out.println("Mail has been send Successfully");
			//out.println(""+name+"!!!!!!!!!"+con+ "!!!!!!!!!"+add+"!!!!!!!!!!"+smail+"!!!!!!!!!!"+msg);
			//response.sendRedirect("ackmail.jsp?ack="+smail);
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
	}
%>

</body>
</html>
