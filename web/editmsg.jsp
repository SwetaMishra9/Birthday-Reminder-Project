<%-- 
    Document   : editmsg
    Created on : Mar 5, 2015, 4:32:27 PM
    Author     : SPS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="db" class="mybean.Dbcon" />
<style>
    body{
        background-image: url(images/bg_gradient-noRepeat.jpg); 
    }
    </style>
    </head>
    <body>
         <%
    db.mkcon();
   String[] id=request.getParameterValues("id");
  
  int len=id.length;
   // out.println(len);
    for(int i=0; i<len; i++)
    {
       // out.println(id[i]);
        
        String msgid=id[i];
                
   %>
       
        <style>
            table{          
                
                margin-top: 50px;
            }
        </style>
    <center><form  name="mesge" action="editmsgsave.jsp" method="post">
            <table>
                
                <tr>
                    <th>Your message :-</th>
                    <th><textarea name="message" cols="45" rows="5" placeholder="Insert your message"></textarea></th>
                <input type="hidden" name="msgid" value="<%=msgid%>" />
                </tr>
                <tr><th colspan="2"><input type="submit" value="save" /> &nbsp;&nbsp;&nbsp;<input type="reset" value="clear"> 
                        &nbsp;&nbsp;&nbsp;<a href="birthrecord.jsp"><input type="button" name="butn" value="Back" /></a></th></tr>
            </table> 
                
                <table>
                    <tr><th>Your Edited Message</th></tr>
                    <%
                db.mkcon();
                
                    String userid=(String)session.getAttribute("userid");
                    ResultSet res=db.fetch("select * from approved_member where userid='"+userid+"'");
                    while(res.next())
                    {
                %>
                    <tr><th><font color=" black"><%=res.getString(11)%>    </font></th></tr><%}%>
                    
                </table>
            
    <%}%>        
            
            
        </form></center>
    
    
    </body>
</html>
