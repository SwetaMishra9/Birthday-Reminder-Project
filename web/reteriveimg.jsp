 
<jsp:useBean id="db" class="mybean.Dbcon" />


<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<% 

  db.mkcon();
  ResultSet rs=db.fetch("select images_name from uploaded_logo where iImageID='7'");
  
  
  if(rs.next())
  {
     byte[] b=rs.getBytes(1);
     out.println(b);
  }
%> 