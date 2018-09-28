
<%@page import="java.util.Random"%>
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
<jsp:useBean id="db1" class="mybean.Dbcon" />
<jsp:useBean id="db2" class="mybean.Dbcon" />
    </head>
    <body>
      <%
      
      db.mkcon();
      String[] id=request.getParameterValues("btn");
     // String[] smail=request.getParameterValues("mail");
      String sbmt=request.getParameter("submit");
      int len=id.length;
      for(int i=0; i<len; i++)
      {
      
      out.println( "anddddddddddddddd id is ....."+id[i]);
      
    
                  
      
                    
      
      
      if(sbmt.equals("Approve"))
      {
      Random rand=new Random();
      int pick=rand.nextInt(100000)+1;
      int newpk=pick+1;
      String userid="HBD"+newpk;
      out.println("user id generated...."+userid);
      
      String password="HBD@"+newpk;
      out.println("password generated...."+password);
      
      ResultSet rs=db.fetch("select * from new_user where id='"+id[i]+"'");
      while(rs.next())
      {
          String smail=rs.getString(5);
         // String name=rs.getString(2);
          int upd=db1.dbupdate("update new_user set status='Approve', userid='"+userid+"', password='"+password+"' where id='"+id[i]+"'");
          if(upd>0)
          {
              int updidpass=db2.dbupdate("insert into login (user_name,password) value('"+userid+"','"+password+"')");
              if(updidpass>0)
              { 
                 
                   System.out.println("Status updated and id password generated and update also you id and password is"+userid+"...."+password);
                  out.println("Status updated and id password generated and update also you id and password is"+userid+"...."+password);
                 
          
                    /*final String username = "shikshasagar.query@gmail.com";
		final String mailpassword = "swetashiksha";*/

                final String username = "swetasoft.developer@gmail.com";
		final String mailpassword = "swetasoft9900521839";
                
                	String mail=smail;
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
			message.setSubject("For inviting You");
			message.setText("Dear,customer your accout activated, your User Id= "+userid+"and Password = "+password);
 
			Transport.send(message);
             
			System.out.println("Mail has been send Successfully");
			out.println("Mail has been send Successfully");
			//out.println(""+name+"!!!!!!!!!"+con+ "!!!!!!!!!"+add+"!!!!!!!!!!"+smail+"!!!!!!!!!!"+msg);
			//response.sendRedirect("ackmail.jsp?ack="+smail);
                        response.sendRedirect("mailsucces.jsp");
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
	            }
              }
      
                  
                
              }
                  
          }
      }
      
      
      else
        {
           // out.println("idsssssssss......"+sbmt);
          int upd=db.dbupdate("DELETE  from new_user where id='"+id[i]+"' ");
         if(upd>0)
         {
            // out.println("user rejected");
             response.sendRedirect("new_user.jsp");
         }
              }
  
      }
      
      
      %>
    </body>
</html>
