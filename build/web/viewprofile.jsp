

<html>
    <head>
        <title>Happy Birth Day</title>
        <%@page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
<jsp:useBean id="db" class="mybean.Dbcon" />

<style>
    
    table{
        
       
        width: 500px;
        text-align: center;
        color: black;
        
    }
</style>
      
    </head>
    <body>
    <center>  <h1>VIEW PROFILE</h1></center>
        <%
        
        db.mkcon();
        String sweta=(String)session.getAttribute("userid");
       // out.println(sweta);
        ResultSet rs=db.fetch("select * from approved_member where userid='"+sweta+"'");
        if(rs.next())
        {
         %>
    <center> <form name="frm" action="editprofile.jsp" method="post">
         <table cellpadding="3" cellspacing="3">
             <tr>
                 <th>Name:-</th><th><%=rs.getString(2)%></th>
             </tr>
             <tr>
                 <th>Contact No:-</th><th><%=rs.getString(3)%></th>
             </tr>
             <tr>
                 <th>Address:-</th><th><%=rs.getString(4)%></th>
             </tr>
             <tr>
                 <th>E-mail Id-</th><th><%=rs.getString(5)%></th>
             </tr>
             <tr><th colspan="2"><input type="submit" value="Edit" name="submit">&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="dashboard.jsp" target="iframe"><input type="button" value="Back to dashboard" ></a></th></tr>
         </table>
        </form></center>
       <% }
        %>
        
        
        
    </body>
</html>
