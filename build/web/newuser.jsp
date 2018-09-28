


<!DOCTYPE html>
<%@page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="db" class="mybean.Dbcon" />
       

<%

db.mkcon();

try{
    String name=request.getParameter("name");
    String mail=request.getParameter("mail");
    String contact=request.getParameter("contact");
    String type=request.getParameter("type");
    String ndate=request.getParameter("dat");
    String address=request.getParameter("add");
    
    
  System.out.println("<br /> name......"+name+"<br />mail....."+mail);
    
    int upd=db.dbupdate("insert into new_user (name,contact_no,address,mail,type,date) values('"+name+"','"+contact+"','"+address+"','"+mail+"','"+type+"','"+ndate+"')");
    
   if(upd>0)
   {
      out.println("Data is inserted");
       response.sendRedirect("birthday.jsp");
       //out.println("Data is insertedy");
   }
}
catch(Exception e)
{
    System.out.println(e);
}

%>