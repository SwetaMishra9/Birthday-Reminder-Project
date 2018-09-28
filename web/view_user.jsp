<%-- 
    Document   : view_user
    Created on : Jan 10, 2015, 1:59:22 PM
    Author     : SPS
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Happy Birth Day</title>
<%@page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="db" class="mybean.Dbcon" />

    <style>
        table{
            width: 920px;
        }
        th{
            height: 10px;
         
        }
        </style>
        <script>
        function ConfirmDelete()
{
  var x = confirm("Are you sure you want to delete?");
  if (x)
      return true;
  else
    return false;
}
</script>

 
        
    </head>
    <body>
    <center>  <p><h1><u>View User</u></h1></p></center>

<form name="frms" method="post" action="view_user.jsp">
            <table>
         
                <tr><th style=" height: 50px; ">
                 <select  name="srch" id="srch" style=" width: 250px; height: 25px; border-radius: 5px; border:2px solid; border-color: darkgoldenrod" onchange="if (this.options[this.selectedIndex].value =='by_name')
             {document.frms['nameorcontact'].style.visibility='visible'}
             else {document.frms['nameorcontact'].style.visibility='hidden'};
             
                ">
             <option value="" selected="selected">Select search by......</option>
             
             <option value="by_name">By Name</option>
             <option value="by_name">By Contact</option>
             
         </select>
         <input type="text"  name="nameorcontact" placeholder="Plase insert Name or Contact No"style="visibility:hidden; width: 250px; height: 20px; border-radius: 5px; border:2px solid; border-color: darkgoldenrod"/>
         
         <input type="submit" value="Search" name="search" style="height: 26px; width: 100px; border: 1px solid; border-color: sienna; background-color: darkgoldenrod; border-radius:5px; color: white" onclick="getsearch()" />
            
           <a href="view_user.jsp" target="iframe"><input type="button" value="Refresh" style="height: 26px; width: 100px; border: 1px solid; border-color: sienna; background-color: darkgoldenrod; border-radius:5px; color: white"/></a>
                     <a href="dashboard.jsp" target="iframe"><input type="button" value="Back to dashboard" style="height: 26px; width: 170px; border: 1px solid; border-color: sienna; background-color: darkgoldenrod; border-radius:5px; color: white"></a>
                    </th>
           
                </tr>
            </table>
        </form>
          <br />  
<center><table cellpadding="3" cellsapcing="3">
            
        <tr>
            <th style=" height: 30px; width: 80px; ">ID</th>
              <th style=" height: 30px; width: 100px; ">NAME</th>
              <th style=" height: 30px; width: 120px; ">CONTACT</th>
              <th style=" height: 30px; width: 140px; ">ADDRESS</th>
              <th style=" height: 30px; width: 170px;">E-MAIL</th>
              
              
            </tr>
            <%
              db.mkcon();
              int i=0;
              String search=request.getParameter("nameorcontact");
             // out.println("................."+search);
              if(search==null)
              {
              ResultSet rs=db.fetch("select * from approved_member");
              while(rs.next())
              { 
                  i++;
                  String type=rs.getString(6);
               //  out.println(type);
                  if(type.equals("user"))
                      
                  {               
                
            %>
            
            <tr>
                <th><%=i%></th>
                <th><a href="edit.jsp?id=<%=rs.getString(1)%>" target="iframe" ><font color="black"><%=rs.getString(2)%></font></a></th>
                <th><a href="edit.jsp?id=<%=rs.getString(1)%>" target="iframe" ><font color="black"><%=rs.getString(3)%></font></a></th>
                <th> <a href="edit.jsp?id=<%=rs.getString(1)%>" target="iframe" ><font color="black"><%=rs.getString(4)%></font></a></th>
                <th> <a href="edit.jsp?id=<%=rs.getString(1)%>" target="iframe" ><font color="black"><%=rs.getString(5)%></font></a></th>
                <th><a href="edit.jsp?id=<%=rs.getString(1)%>" target="iframe" ><input type="button" value="Edit" name="btton1" style="height: 26px; width: 80px; border: 1px solid; border-color: sienna; background-color: darkkhaki; border-radius:5px; color: white"/></a></th>
                <th><a href="userdelete.jsp?id=<%=rs.getString(1)%>" target="iframe" ><input type="button" value="Delete" name="btton" style="height: 26px; width: 80px; border: 1px solid; border-color: sienna; background-color: darkkhaki; border-radius:5px; color: white"  /></a></th>
            </tr>
            
            <%   }
               }
             }
              else
              {
              ResultSet rs=db.fetch("select * from approved_member where name='"+search+"' or contact_no='"+search+"'");
              while(rs.next())
              { 
                  i++;
                  String type=rs.getString(6);
               //  out.println(type);
                  if(type.equals("user"))
                      
                  {       
             
            %>
          <tr>
                <th><%=i%></th>
                <th><a href="edit.jsp?id=<%=rs.getString(1)%>" target="iframe" ><font color="black"><%=rs.getString(2)%></font></a></th>
                <th><a href="edit.jsp?id=<%=rs.getString(1)%>" target="iframe" ><font color="black"><%=rs.getString(3)%></font></a></th>
                <th> <a href="edit.jsp?id=<%=rs.getString(1)%>" target="iframe" ><font color="black"><%=rs.getString(4)%></font></a></th>
                <th> <a href="edit.jsp?id=<%=rs.getString(1)%>" target="iframe" ><font color="black"><%=rs.getString(5)%></font></a></th>
                <th><a href="edit.jsp?id=<%=rs.getString(1)%>" target="iframe" ><input type="button" value="Edit" name="btton1"/></a></th>
                <th><a href="userdelete.jsp?id=<%=rs.getString(1)%>" target="iframe" ><input type="button" value="Delete" name="btton"  /></a></th>
            </tr>  <%}
            
              }}
              
              
            
            %>
          
           
    </table></center>
       
    </body>
</html>
