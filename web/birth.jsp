<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Happy Birth Day</title>
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
<jsp:useBean id="db" class="mybean.Dbcon" />

    </head>
    <body>
        
        <%
           db.mkcon();
           
           String[] id=request.getParameterValues("radio");
           int userid=id.length;
           for(int i=0; i<userid; i++)
           {
               out.println("id............."+id[i]);
                 
               ResultSet rs=db.fetch("select * from birth_day_rec where id='"+id[i]+"'");
               while(rs.next())
               {
                  String name=rs.getString(2);
                  String mail=rs.getString(4);
                  
                 // out.println("name..."+name+"mail........"+mail);
                  
                  
                  final String username = "shikshasagar.query@gmail.com";
		  final String password = "swetashiksha";
                
                  String smail=mail;
                 // String sname=name;
                
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
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(smail));
				//InternetAddress.parse("swetasomya39@gmail.com"));
			message.setSubject("From Birth day Reminder for wishing you");
			message.setText("Dear,"+name+"Wish you a very very HAPPY BIRTH DAY" );
 
			Transport.send(message);
             
			//System.out.println("Mail has been send Successfully");
			out.println("Mail has been send Successfully");
			//out.println(""+name);
			
                     
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
	              }
 
                  
                  
                
               }
             
           }
        response.sendRedirect("swet.html");
        
        
        %>
        
    </body>
</html>