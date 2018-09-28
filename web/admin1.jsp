<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Happy birth day</title>
        
         <%@page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Calendar"%>
<jsp:useBean id="db" class="mybean.Dbcon" />
<jsp:useBean id="db1" class="mybean.Dbcon" />

        <style>
            body{
                margin: 0px;
                padding: 0px;
                color: white;
                
                background-image: url(images/1001.jpg);
                
                
            }
            #header{
                height: 100px;
                float: none;
                margin: auto;
                width: auto;
               
              /* background-image: url(images/happy-birthday.jpg);*/
                background-position: initial ;
                color:white;
                text-align: center;
                line-height:60px;
                font-size: 90px;
                font:caption;
               
                
            }
            #left{
                height: 580px;
                float: left;
                width: 200px;
               /* border: 1px solid;*/
                
            }
              #right{
                height: 830px;
                float: right;
                width: 130px;
                margin-right: 5px;
                 
                  background-color: bisque;
                opacity:0.5;
  filter:alpha(opacity=70);
  border-radius: 25px;
                
            }
             #center{
                 border-radius: 20px;
                background-color: beige;
                opacity:0.5;
  filter:alpha(opacity=70);
                height: 830px;
                float: left;
                width: 940px;
                border: 1px solid;
                
                color: white;
               
                
            }
            #sidemenu{
                 background-color: beige;
                opacity:0.9;
  filter:alpha(opacity=70);
               height: 40px;
               width: 190px; 
               border-radius: 8px; 
               border: 1px solid;
               margin-top: 50px; 
               margin-left: 4px ;
               text-align: center;
               line-height: 40px;
                color: white;
               
               
            }
            li{
                height: 20px;
                width: 60px;
                
                text-align: center;
                margin-top: 5px;
            }
            
        </style>
    </head>
    <body
      <%


java.util.Calendar currentDate=new java.util.GregorianCalendar();
   int month=0;
   int day=0;
  month=currentDate.get(currentDate.MONTH)+1;
    day=currentDate.get(currentDate.DAY_OF_MONTH);
   int year=currentDate.get(currentDate.YEAR);
   String mo=Integer.toString(month);
   String days=Integer.toString(day);
   String d=Integer.toString(day);
   String yearss=Integer.toString(year);
   if(month<10)
   {
    mo="0"+mo;
   }
   
    if(day<10)
   {
    days="0"+days;
   }
   
    int hour = currentDate.get(currentDate.HOUR);
    int minute = currentDate.get(currentDate.MINUTE);
    int second = currentDate.get(currentDate.SECOND);
     String hours=Integer.toString(hour);
   String min=Integer.toString(minute);
 String sec=Integer.toString(second);
if(hour<10)
{
hours="0"+hours;
}
if(minute<10)
{
 min="0"+min;
}
if(second<10)
{
sec="0"+sec;
}
String cdate=days+"-"+mo+"-"+year;
String ctime=hours+":"+min+":"+sec;


%>  
        
            <%
        db.mkcon();
        String comming=(String)session.getAttribute("userid");
        ResultSet rs=db.fetch("select * from approved_member where userid='"+comming+"'");
        if(rs.next())
        {
            
        %>
        <div id="header">
            <table>
                <tr>
                    <th style="width:300px;"><img src="images/birthday-cake-popcorn copy.png" height="130px" width="130px" /></th>
        <th style="width:770px;"><font style="color: white;"><h1>Birth Day Reminder</h1></font></th>
          
            
            <th style="height:100px; width: 250px ">
            <center><table>
            <tr><td><font style="color:white; font-size: 15px">Welcome <%=rs.getString(2)%> [ <%=rs.getString(6)%> ]</font></td></tr>
            <%}%>
            <tr> <th><font style=" font-size: 12px; color:white ">Date:-<%=cdate%></font></th></tr>
            <tr><th><font style=" font-size: 12px; color:white ">Time:-<%=ctime%></font></th></tr>
            <tr><th>               
                    <a href="logout.jsp" target="_self"><font style=" font-size: 18px; color:white ">Log Out</font></a></th></tr>
            
            
                </table></center>
            </th>
          
            </tr>
            </table>
                    <hr />
        </div>
        <div id="left">
            <div id="sidemenu">
                <a href="viewprofile.jsp" target="iframe">View Profile </a></div>
            <div id="sidemenu">
                <a href="changepas.jsp" target="iframe">  Change Password</a> </div> 
             <div id="sidemenu">
                
                <a href="view_user.jsp" target="iframe"> View Users</a> </div> 
            <div id="sidemenu">
                <a href="birthrecord.jsp" target="iframe">  Birth Day Record </a></div> 
            <div id="sidemenu">
                
                <a href="new_user.jsp" target="iframe"> New Users</a> </div> 
            
        
            
        </div>
        <div id="center">
            <iframe name="iframe" src="viewprofile.jsp" height="830px" width="940px" frameborder="no" >
            
            </iframe>          
            
        </div>
        
        <div id="right">
            <p><center><font color="black">Today<br>Birth Day</center></font></p><hr />
        <%
        Calendar now = Calendar.getInstance();   // Gets the current date and time
int nyear = now.get(Calendar.YEAR);
out.println("minth"+mo+"date"+days);
              ResultSet rs1=db1.fetch("select * from birth_day_rec where month='"+mo+"' and ndate='"+days+"' ");
              while(rs1.next())
              {
                  out.println("comming");
                /*  String status=rs1.getString(10);
                  if(status.equals("new"))
                  {*/
            %>
        <ul>
            
            <a href="birthrecord.jsp?id=<%=rs1.getString(1)%>" target="iframe" > <li><font color="black"><%=rs1.getString(2)%></font></li></a>
                   
            
        </ul><%}%>
        </div>
    </body>
</html>
