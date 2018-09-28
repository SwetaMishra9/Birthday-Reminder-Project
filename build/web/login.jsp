<!DOCTYPE html>
<%@page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="db" class="mybean.Dbcon" />
       

<%

db.mkcon();

try{
    String username=request.getParameter("name");
    String password=request.getParameter("pass");
    
    out.println(""+username);
    out.println(""+password);
    
  out.println("User name......"+username+  "password......."+password);
    
    ResultSet rs=db.fetch("select * from login where user_name='"+username+"' and password='"+password+"'");
    
    if(rs.next())
    { 
       String utype=rs.getString(4);
        
      
        out.println(""+utype);
       
        session.setAttribute("userid", username);
        session.setAttribute("userpassword", password);
        if(utype.equals("admin"))
        {
            out.println("successful");
           // response.sendRedirect("adminlogin.html");
            response.sendRedirect("admin.jsp");
        }
        
        else{
            
                out.println("fyafet");
            response.sendRedirect("userlogin.html");
            }
        
    }
    else{
        response.sendRedirect("birthday.jsp?msg=Wrong Username or Password");
    }
    
    }  

catch(Exception e)
{
    System.out.println("Exception e..............."+e);
}



%>