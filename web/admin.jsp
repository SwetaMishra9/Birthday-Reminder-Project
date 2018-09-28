<%@page import="org.apache.commons.fileupload.FileItem"%>
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

<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*"%>


        <style>
            body{
                margin: 0px;
                padding: 0px;
                color: white;
               // background-color: darkkhaki;
                //background-image: templatmeo_body_top.jpg;
                //background-repeat: repeat-x;
                
               // background-image: url(images/1001.jpg);
                
                
            }
            #header{
                height: 80px;
                float: none;
                margin: auto;
                width: auto;
                // background-image: url(images/templatmeo_body_top.jpg);
                //background-repeat: repeat-x;
                 background-position: center;
                 
                background-image: url(images/white_grey_gradient_background_1-1fd.jpg);
                
          
             /*  opacity:2.5;
  filter:alpha(opacity=70);*/
                
               
                
            }
            #left{
                margin-top: 10px;
                height: 600px;
                float: left;
                width: 160px;
                margin-left: 2px;
                margin-right: 2px;
                border: 1px solid;
                border-radius:5px;
                 background-image: url(images/white_grey_gradient_background_1-1fd.jpg);
                   background-position: bottom;
               /* background-image: url(images/templatemo_events_blank.jpg);*/
               
             
                
            }
              #right{
                  margin-top: 10px;
                   background-image: url(images/white_grey_gradient_background_1-1fd.jpg);
                   background-position: bottom;
                height: 600px;
                float: right;
                width: 175px;
                margin-right: 2px;
                
                
                 
               
                border-radius: 2px;
            }
             #center{
                 margin-top: 10px;
                 background-image: url(images/templatmeo_body_top.jpg);
                 background-repeat: repeat-x;
                 
                
                 border-radius: 5px;
               
                height: 600px;
                float: left;
                width: 936px;
                border: 1px solid;
                border-color: white;      
                
                color: white;              
                
            }
            #sidemenu{
                 background-color: #aaa;
                opacity:0.9;
  filter:alpha(opacity=70);
               height: 40px;
               width: 150px;
               margin-top: 50px; 
               margin-left: 4px ;
               text-align: center;
               line-height: 40px;
                color: white;
                text-decoration: none;
                outline: none;
            }
            li{
                height: 20px;
                width: 60px;
                
                text-align: center;
                margin-top: 5px;
            }
            
        </style>
    </head>
    <body>
     
        <div id="header" style="height: 100px;">
            <table style="background-image: cross-fade">
                <tr>
                 
       <th style="width:160px; height:80px;"><img src="images/NI combine logo 1.png" height="80px" width="250px" style=" margin-top: 0px" /></th>
        <th style="width:930px;"><font style="color:white;"><h1>Birth Day Reminder</h1></font></th>
            
         
       
            <th style="width:170px;"><iframe src="TestPhoto.jsp" height="110px" width="120px" frameborder="0"  ></iframe>
           
          </th>
          
            
          
            </tr>
            </table>
            
                    
        </div>
        <div id="left" style="border:1px solid; margin-top: 10px">
            
            <a href="viewprofile.jsp" target="iframe" style=" outline: none"> 
               <div id="sidemenu">
                   <font color="black">My Profile</font> 
               </div>
           </a>
            
            <a href="user_acc_pannel.jsp" target="iframe">
                <div id="sidemenu">                
                    <font color="black">User account Pannel </font>
                </div> 
            </a>
            
          <a href="changepas.jsp" target="iframe">   
              <div id="sidemenu">
                  <font color="black"> Change Password </font>
              </div> 
          </a>
        </div>  
            
        <div id="center">
            <iframe name="iframe" src="dashboard.jsp" height="600px" width="936px" frameborder="0" >
            
            </iframe>          
            
        </div>
        
        <div id="right">
          
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
        

          <table >
         
            <center>
                <style>
                   #intro
                   {
                       
                       
                       width: 170px;
                       
                   }
                   #tdr{
                       
                       width: 100px;
                       
                   }
                   #tdl{
                       
                       
                       height: 40px;
                   }
                </style>
               
               
                
                <table id="intro">
                    <tr> <th style=" height: 50px"><font style=" font-size: 22px"><center>Welcome</center></font><hr /></th><tr>
                    
             <tr>
         <!--<td id="tdl">Welcome:</td>-->
                 
         <th id="tdr" >
             <font style="color:white; font-size: 20px"><%=rs.getString(2)%></font><br /> [ <%=rs.getString(6)%> ]
         </th>
           </tr>
             
         
            <%}%>
            <tr> 
                <th id="tdl"><%=cdate%></th>
            </tr>
            <tr>
                
                <th style="height: 10px"><%=ctime%></th>
            <tr>    
           
       
        
                
                </table>
           
            <div style="   width: 170px; height: 45px; margin-top: 10px">
            <center>
     <a href="logout.jsp" target="_self"><font style=" font-size: 18px; color:white; ">
         <input type="button" value="Log Out" style="height: 26px; width: 100px; border: 1px solid; 
                border-color: sienna; background-color: antiquewhite; border-radius:5px; color: black; margin-bottom: 5px"/>
         </font></a>
            </center>
          <hr />     
            </div>
        
        
       
       
        
        <center> <font style=" font-size: 18px; color: white">Upcoming Reminder</center></font><hr /> 
        <%
        Calendar now = Calendar.getInstance();   // Gets the current date and time
int nyear = now.get(Calendar.YEAR);
//out.println("minth"+mo+"date"+days);
              ResultSet rs1=db1.fetch("select * from birth_day_rec where month='"+mo+"' and ndate='"+days+"' ");
              while(rs1.next())
              {
                  //out.println("comming");
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
