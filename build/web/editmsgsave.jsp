<%-- 
    Document   : editmsgsave
    Created on : Mar 5, 2015, 5:29:27 PM
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

    </head>
    <body>
        <%
    db.mkcon();
 //  String id=request.getParameter("msgid");
   String userid=(String)session.getAttribute("userid");
    String msg=request.getParameter("message");
  out.println(msg);
  out.println(userid);
  //int len=id.length;
   // out.println(len);
    //for(int i=0; i<len; i++)
  //  {
       // out.println(id[i]);
        int upd=db.dbupdate("update approved_member set msg_box='"+msg+"' where userid='"+userid+"'");
        if(upd>0)
        {
            out.println("Msg inserted");
        }
           
    
    %>
       
    </body>
</html>
