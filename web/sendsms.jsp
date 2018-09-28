

    /* String number=request.getParameter("contact");
     String msg=request.getParameter("msg");
     String id=request.getParameter("user");
     String pass=request.getParameter("pass");
     out.println(""+number+"........."+msg+"........."+id+".........."+pass);
     response.sendRedirect("http://www.160by2.com?username=+id+& password=+pass+ & button=1 &to=+number+ &msg=+msg");
     out.println("succesful");*/

<%@page import="java.io.*"%>
 
<%@page import="java.net.InetAddress.*"%> 
  
<%@page import="java.util.Properties.*%>
 
<%@page import ="javax.mail.*"%>
  
<%@page import="javax.mail.internet.*"%>
  
<%@page import="javax.activation.*"%>
  
  
<% 
public class SMTPSend {  
  
 public SMTPSend() {  
  
 }  
  
 public void msgsend() {  
  
  String username = "MySMSUsername";  
  
  String password = "MyPassword";  
  
  String smtphost = "MySMSHost.com";  
  
  String compression = "My SMS Compression Information";  
  
  String from = "mySMSUsername@MySMSHost.com";  
  
  String to = "PhoneNumberToText@sms.MySMSHost.com";  
  
  String body = "Hello SMS World!";  
  
  Transport myTransport = null;  
  
  
  
  
  try {  
  
   Properties props = System.getProperties();  
  
   props.put("mail.smtp.auth", "true");  
  
   Session mailSession = Session.getDefaultInstance(props, null);  
  
   Message msg = new MimeMessage(mailSession);  
  
   msg.setFrom(new InternetAddress(from));  
  
   InternetAddress[] address = {new InternetAddress(to)};  
  
   msg.setRecipients(Message.RecipientType.TO, address);  
  
   msg.setSubject(compression);  
  
   msg.setText(body);  
  
   msg.setSentDate(new Date());  
   /* 
Connect the SMS message to your SMS host address. Save changes to the message and send the information*/  
  
  
   myTransport = mailSession.getTransport("smtp");  
  
   myTransport.connect(smtphost, username, password); 
   
   msg.saveChanges();  
  
   myTransport.sendMessage(msg, msg.getAllRecipients());  
  
   myTransport.close();  
  
  } catch (Exception e) {  
  
   e.printStackTrace();  
  
  }  
 }  
  
 public static void main(String[] argv) {  
  
  SMTPSend smtpSend = new SMTPSend();  
  
  smtpSend.msgsend();  
  
 }  
%>