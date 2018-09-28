<%-- 
    Document   : forgetid
    Created on : Feb 10, 2015, 5:05:25 PM
    Author     : SPS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="db" class="mybean.Dbcon" />
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
          db.mkcon();
          String mailid=request.getParameter("mail");
          out.println("mail Id = "+mailid);
          ResultSet rs=db.fetch("select * from approved_member where mail='"+mailid+"'");
          while(rs.next())
          {
              String utype=rs.getString(6);
              
              out.println("user type is" +utype);
                final String username = "shikshasagar.query@gmail.com";
		final String mailpassword = "swetashiksha";
		
                	String mail=mailid;
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
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(mail));
				//InternetAddress.parse("swetasomya39@gmail.com"));
			message.setSubject("BirtDay reminder regarding your password");
			message.setText("Dear,customer for getting your password go to this link <br />"
                                + "http://localhost:8080/Birth_Day_Project/forget.jsp" );
 
			Transport.send(message);
             
			System.out.println("Mail has been send Successfully");
			out.println("Mail has been send Successfully");
			//out.println(""+name+"!!!!!!!!!"+con+ "!!!!!!!!!"+add+"!!!!!!!!!!"+smail+"!!!!!!!!!!"+msg);
			response.sendRedirect("birthday.jsp?msgs=Please check your email, link has been sent in your mail id");
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
	       
                }
          
          }
      %>
    </body>
</html>
