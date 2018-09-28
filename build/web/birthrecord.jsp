

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Happy Birth Day</title>
        <%@page import="java.sql.*,java.io.*"%>
       <%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
<jsp:useBean id="db" class="mybean.Dbcon" />
<jsp:useBean id="db1" class="mybean.Dbcon" />
<script type="text/javascript" src="js/datetimepicker_css.js"></script>
 <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
 <script src="js/jquery.autocomplete.js"></script> 

<style>
    body{
        background-image: url(images/bg_gradient-noRepeat.jpg); 
    }
   #recorddata
   {
       width: 880px;
   }
    </style>
    <script>
    function chkradio()
{
var elem=document.forms['frm'].elements['radio'];
len=elem.length-1;
chkvalue='';
for(i=0; i<=len; i++)
{
if(elem[i].checked)chkvalue=elem[i].value;	
}
if(chkvalue=='')
{
alert('Please select user');
return false;
}

}
 
/* function WishDay(){
    var currentdate = new Date(); 
var datetime = "" + currentdate.getDate() + "-"
                + (currentdate.getMonth()+1)  + "-" 
                + currentdate.getFullYear(); 
    alert(""  +datetime);
       
	  var wshingdate=document.getElementById("wishingday").value; 
          alert("comming"+wshingdate);
      
       //document.frm.radio.disabled=true;
if(datetime!=wshingdate)
{
    alert("comming");
document.getElementById("radio").disabled=true;
return true;
}
else
{alert("matched");
   document.getElementById("radio").disabled=false;
   return true;
}
        }*/
</script>
<!-- Script by hscripts.com -->  
     
    }
    </script>
    </head>
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
   String cdate=days+"-"+mo+"-"+year;
   
   
    %>
    <script>
        function WishDay()
        
        {
var cdate = new Date();
var month = cdate.getMonth() + 1;
var day = cdate.getDate();
var year = cdate.getFullYear();
if(month<10)
   {
    month="0"+month;
   }
   
    if(day<10)
   {
    day="0"+day;
   }
var currentdate= day+" - "+month+" - "+year;

//alert("currentdate   "+currentdate);
     
    var wdate= document.frm.elements['wishingday'];
    var  len = wdate.length;
    //alert(len);
    for(var i=0; i<len; i++)
    {
       
        var wishdate=wdate[i].value;
        //alert(wishdate);
        if(currentdate==wishdate)
      {
    //alert("cdate and wish date comming");
    
    var radio=document.frm.elements['radio'];
    //document.getElementById("radio").disabled=false;
    var rad=radio.length;
    //alert(rad);
    for(var j=0; j<rad; j++)
    {
        if(i==j)
        {
        radio[j].disabled=false;
        //alert([j]);
    }
    else{
        
    }
    }
    
    
    
     }
     else{
    //alert("cdate and wish date not comming");
     }
        
        
    }        
    }
       
        
        </script>
        
         <script type="text/javascript">
          checked=false;
          function checkedAll (frm) 
          
          { 
              alert("yes comming");
              var aa= document.getElementById('frm');
              if (checked == false )
               { alert();
                   if(document.frm.elements['radio'].disabled=false)
                 
                
                     
                  checked = true
               }
                else
                 {
                    checked = false
                  }
                  for (var i =0; i < aa.elements.length; i++)
                  { 
                     
                      aa.elements[i].checked = checked;
                  }
              }
</script>  
    <body onload="WishDay()">
    <center> <h1><u>Birth Day</u></h1></center>
    
    
    <form name="frms" method="post" action="birthrecord.jsp" >
        
        <center> <table>
         
                <tr style=" height: 50px"><th>
         <select name="srch" id="srch" style="height: 23px; width: 200px; 
                border:1px solid; border-color: darkkhaki; background-color:beige; border-radius:2px; color: black" 
                onchange="if (this.options[this.selectedIndex].value =='by_name')
             {document.frms['nameorcontact'].style.visibility='visible'}
             else {document.frms['nameorcontact'].style.visibility='hidden'};
             
             ">
              <option value="" selected="selected">Select...</option>
             
             <option value="by_name">By Name</option>
             <option value="by_name">By Contact</option>
                     
         </select>
        <input type="text" id="nameorcontact" name="nameorcontact" class="input_text" placeholder="Plase insert Name or Contact No"style="visibility:hidden; 
               height: 20px; width: 180px; 
                       border:1px solid; border-color: darkkhaki; background-color:beige; border-radius:2px; color: black"/>
 
                     
                      
              <script>
 jQuery(function(){
  $("#nameorcontact").autocomplete("bdayextract.jsp");
 });
</script> 
         
                        
         <input type="submit" value="search" name="Search"  style="height: 23px; width: 100px; 
                border:1px solid; border-color: darkkhaki; background-color:beige; border-radius:2px; color: black" />
                    </th></tr>
        </table>
        </center>
    </form>
    
    
    
    
    
    
       <%

            db.mkcon();
            String search=request.getParameter("nameorcontact");
            //out.println(search);
            String id=request.getParameter("id");
            
            
               if(id!=null)
              {
                ResultSet rs3=db.fetch("select * from birth_day_rec where id='"+id+"'");
                while(rs3.next())
               {
                
            
                %>
                <form name="frm1">
            <table> 
                
                 <tr>
                
                <th style=" height: 50px; width: 100px;">S_No</th>
                <th style=" height: 50px; width: 100px;">NAME</th>
                <th style=" height: 50px; width: 100px;">D.O.B</th>
                <th style=" height: 50px; width: 100px;">MESSAGE BOX</th>
               <!-- <th>select</th>
                <th>Send SMS</th>
                <th>Send Mail</th>-->
                <th style=" height: 50px; width: 100px;">REMINDER DATE</th>
                <th style=" height: 50px; width: 100px;">
                  
                    
                    SELECT
                
                
                
                </th>
            </tr>
            
             <tr style=" height: 50px;"> 
           
                <th style="width: 40px"><%=rs3.getString(1)%></th>
             <input type="text" name="id" value="<%=rs3.getString(1)%>"/>
                <th style="width: 50px"><%=rs3.getString(2)%></th>
                <th style="width: 100px"><%=rs3.getString(3)%></th>
             <a href="editmsg.jsp" target="iframe"><th style="width: 400px">DEAR &nbsp;<%=rs3.getString(2)%>&nbsp;WISH U H B D on &nbsp;<%=rs3.getString(3)%></th></a>          
                
                 <th style="width: 80px"><%=rs3.getString(6)%> - <%=rs3.getString(5)%> - <%=year %> 
 <input type="hidden" value="<%=rs3.getString(6)%> - <%=rs3.getString(5)%> - <%=year %>" name="wishingday" id="wishingday"></th>
                <th style="width: 80px"><input type="checkbox" value="<%=rs3.getString(1)%>" name="radio" id="radio"/></th>
               
                   </th>
                 </tr>
            </table>
                </form>
            <%}}
            else{
                
               %>
    
    
    
    <center>   <form name="datebind" method="post" action="birthrecord.jsp"  >
            <table>
               <tr style="height:50px; text-align: center">
                <th style="width:70px; height: 26px">FROM</th>
                <th style="width:50px" >
                    <a href="javascript:NewCssCal('frmdate','yyyyMMdd','dropdown',true)">
                        <input type="text" name="frmdate" id="frmdate" style=" text-align: center; 
                               height: 20px; width: 150px; 
                border:1px solid; border-color: darkkhaki; background-color:beige; border-radius:5px; color: black " ></a></th>
                        <th style="width:50px; height: 26px">TO</th>
                        <th><a href="javascript:NewCssCal('todate','yyyyMMdd','dropdown',true)">
        <input type="text" name="todate" id="todate" style=" text-align: center;height: 23px; width: 150px; 
                border:1px solid; border-color: darkkhaki; background-color:beige; border-radius:5px; color: black" ></a></th>
        
        <th style=" width: 120px">
            <input type="submit" value="Get" style="height: 25px; width: 100px; 
                border:1px solid; border-color: darkkhaki; background-color:beige; border-radius:5px; color: black "  />
                </th>
        
                
                
                <th style=" width: 120px"> 
                <a href="birthrecord.jsp" target="iframe"><input type="button" value="Refresh" style="height: 25px; width: 100px; 
                border:1px solid; border-color: darkkhaki; background-color:beige; border-radius:5px; color: black"/></a></th>
               </tr> 
        </table>    
        
        </form></center>
    
    <center>
        <form name="frm" id="frm"  onsubmit="return chkradio()" action="birth.jsp" method="post" >
            <table id="recorddata">
                <tr><th colspan="6"><%if(request.getParameter("msg")!=null){%><%=request.getParameter("msg")%><%}%></th></tr>
           
            <tr>
                
                <th style=" height: 50px; width: 100px;">S_No</th>
                <th style=" height: 50px; width: 100px;">NAME</th>
                <th style=" height: 50px; width: 100px;">D.O.B</th>
                <th style=" height: 50px; width: 100px;">MESSAGE BOX</th>
               <!-- <th>select</th>
                <th>Send SMS</th>
                <th>Send Mail</th>-->
                <th style=" height: 50px; width: 100px;">REMINDER DATE</th>
                <th style=" height: 50px; width: 100px;">
                    
                     <!--<form name="frms">
                    
                <input type='checkbox' name='checkall' onclick='checkedAll(frm);'></form>-->
                    SELECT</th>
            </tr>
            
           
         <%
            
           String from=request.getParameter("frmdate");
            
            String to=request.getParameter("todate");
            //out.println("........."+from+"............."+to);
            String ack=request.getParameter("ack");
         // int i=0;
            if(from==null || to==null)
            {
            ResultSet rs=db.fetch("select * from birth_day_rec");
            while(rs.next())
            { //i++;
                
            %>
            <tr> 
             
          
                <th style="width: 40px"><%=rs.getString(1)%> </th>
                
                <th style="width: 50px"><%=rs.getString(2)%></th>
                <th style="width: 100px"><%=rs.getString(3)%></th>
                
                  <th style="width: 400px">
            <table>
                <tr><th>  <a href="editmsg.jsp?id=<%=rs.getString(1)%>" target="iframe">
                         
                          <font color="black"> DEAR &nbsp;<%=rs.getString(2)%>&nbsp;WISH U H B D on &nbsp;<%=rs.getString(3)%>  
                          </font></a></th></tr>
                
                
            </table>
                  </th>
                       
      <th style="width: 80px"><%=rs.getString(6)%> - <%=rs.getString(5)%> - <%=year %> 
 <input type="hidden" value="<%=rs.getString(6)%> - <%=rs.getString(5)%> - <%=year %>" name="wishingday" id="wishingday"></th>
                <th style="width: 80px"><input type="checkbox" value="<%=rs.getString(1)%>" name="radio" id="radio" disabled="disabled"/></th>
               <!-- <th><input type="radio" value="....DEAR %=rs.getString(2)%> WISH U H B D on %=rs.getString(3)%>" name="radio" />-->
                   </th>
                 </tr>
                
                <%}}
                else
            {
                ResultSet rs=db.fetch("select * from birth_day_rec where ndatu BETWEEN '"+from+"' and '"+to+"'");
            while(rs.next())
            { // i++;
              %> 
              
              
               <tr> 
           
                <th style="width: 40px"><%=rs.getString(1)%></th>
                <input type="text" name="id" value="<%=rs.getString(1)%>"/>
                <th style="width: 50px"><%=rs.getString(2)%></th>
                <th style="width: 100px"><%=rs.getString(3)%></th>
             
                   <th style="width: 400px">
                       <a href="editmsg.jsp" target="iframe"><font color="black">
                           DEAR &nbsp;<%=rs.getString(2)%>&nbsp;WISH U H B D on &nbsp;<%=rs.getString(3)%></font></a>
                           
                   </th> 
                   
               </a>         
                
                <th style="width: 80px"><%=rs.getString(6)%> - <%=rs.getString(5)%> - <%=year %> 
 <input type="hidden" value="<%=rs.getString(6)%> - <%=rs.getString(5)%> - <%=year %>" name="wishingday" id="wishingday"></th>
                <th style="width: 80px"><input type="checkbox" value="<%=rs.getString(1)%>" name="radio" id="radio" disabled="disabled"/></th>
               <!-- <th><input type="radio" value="....DEAR %=rs.getString(2)%> WISH U H B D on %=rs.getString(3)%>" name="radio" />-->
                   </th>
                 </tr>
              
           <% }
            } } 
           
            %>  
                
                
                
           
        
            <center> <tr><th colspan="6" style="height: 70px">
        <input type="submit" value="Send SMS" style=" height: 28px; width: 130px; 
                border:1px solid; border-color: darkkhaki; background-color:beige; border-radius:5px; color: black" >&nbsp;
       <input type="submit" value="Send Mail" style=" height: 28px; width: 130px; 
                border:1px solid; border-color: darkkhaki; background-color:beige; border-radius:5px; color: black" />&nbsp;
     <a href="birthrecord.jsp" target="iframe"><input type="button" value="Cancel" style=" height: 28px; width: 130px; 
                border:1px solid; border-color: darkkhaki; background-color:beige; border-radius:5px; color: black" /></a>
     <a href="dashboard.jsp" target="iframe"><input type="button" value="Back to dashboard" style=" height: 28px; width: 130px; 
                border:1px solid; border-color: darkkhaki; background-color:beige; border-radius:5px; color: black"></a>
                    </th></tr>    
            </center>   
       
            
        </table></form></center>
    </body>
</html>
