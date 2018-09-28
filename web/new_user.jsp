

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="db" class="mybean.Dbcon" />
<jsp:useBean id="db1" class="mybean.Dbcon" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
 <script src="js/jquery.autocomplete.js"></script> 
        
        <title>Happy Birth Day</title>
        <style>
             body{
        background-image: url(images/bg_gradient-noRepeat.jpg); 
    }
            
            table{
              
                border-radius: 10px;
                border-color: black;
                width: 930px;
                color: black;
                
            }
            </style>
          <script type="text/javascript">
          checked=false;
          function checkedAll (frm1) 
          { 
              var aa= document.getElementById('frm1');
              if (checked == false)
               {
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
 <script type="text/javascript">
    function getsearch(){
       
	  var srch=document.frms.nameorcontact.value; 
          //alert("comming"+srch);
           //alert(srch);
	    frms.method="post";
            frms.action="new_user.jsp?search="+srch;
            frms.submit();
            //alert(srch);
     
    }
   /* function EnableSubmit()
    {
       
    var checkboxes = $("input[type='checkbox']"),
    submitButt = $("input[type='submit']");

checkboxes.click(function() {
    submitButt.attr("disabled", !checkboxes.is(":checked"));
});
    }*/
 </script>
 <script>
  function chkbox()
{
var elem=document.forms['frm1'].elements['btn'];
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
    </script>
    
    <script>
 function suggestion(){
       
	alert("hello");
        var st=document.frms.nameorcontact.value;
        alert(st);
      
       document.frms['auto'].style.visibility='visible';
        
       
            //alert(srch);
     
    }
</script>
   
    </head>
    <body>
        <h1>New Users</h1><hr />
        <form name="frms" method="post" >
            <table>
         
                <tr style=" height: 50px"><th>
         <select name="srch" id="srch" style="height: 26px; width: 300px; border: 1px solid; border-color: sienna; background-color: antiquewhite; border-radius:5px; color: black" onchange="if (this.options[this.selectedIndex].value =='by_name')
             {document.frms['nameorcontact'].style.visibility='visible'}
             else {document.frms['nameorcontact'].style.visibility='hidden'};
             
                ">
             <option value="" selected="selected">Select...</option>
             
             <option value="by_name">By Name</option>
             <option value="by_name">By Contact</option>
             
         </select>
                     
  <input type="text" id="nameorcontact" name="nameorcontact" class="input_text" placeholder="Plase insert Name or Contact No"style="visibility:hidden; height: 26px; width: 300px; 
                       border:1px solid; border-color: sienna; background-color: antiquewhite; border-radius:5px; color: black"/>
 
                     
                      
              <script>
 jQuery(function(){
  $("#nameorcontact").autocomplete("extract.jsp");
 });
</script>          
                        
                      
         
         <!--<input type="text"  name="contact"  placeholder="Please insert Contact no" style="visibility:hidden;"/>-->
    <!--  <select name="srch" id="srch" >
      <option value="0">Select</option>
	 
         <option value="other">By Name</option>
         <option value="2">By Contact Number</option>
        
      </select>
                 <input type="text" name="other" id="other" style="display: none" />-->
                <input type="button" value="search" name="Search" onclick="getsearch()" style="height: 26px; width: 100px; border: 1px solid; border-color: sienna; background-color: antiquewhite; border-radius:5px; color: black" />
            
            <a href="new_user.jsp" target="iframe"><input type="button" value="Refresh" style="height: 26px; width: 100px; border: 1px solid; border-color: sienna; background-color: antiquewhite; border-radius:5px; color: black"</a></th>
            </tr>
            
            </table>
        </form>
        <br/>
        <form name="frm1" id="frm1" action="approve.jsp" method="post" onsubmit="return chkbox();">
        <table>
           
            
            <tr> <th style=" height: 50px; width: 100px; ">
            <form name="frms">
                    
                <input type='checkbox' name='checkall' onclick='checkedAll(frm1);'></form>
                    
                    SELECT</th>
                <th style=" height: 50px; width: 80px; ">S_N0</th>
                <th style=" height: 50px; width: 80px; ">NAME</th>
                <th style=" height: 50px; width: 150px; ">CONTACT NO</th>
                <th style=" height: 50px; width: 100px; "> ADDRESS</th>
                <th style=" height: 50px; width: 100px; ">E-MAIL ID</th>
                <th style=" height: 50px; width: 50px; ">DATE</th>
               
                
            </tr>
            <%
                String search=request.getParameter("search");
                //String cont=request.getParameter("contact");
             // out.println("coming.........."+search);
                     // out.println("coming.........."+cont);
              db.mkcon();
              
             
            if (search==null)                
              {
                 ResultSet rs=db.fetch("select * from new_user");
              while(rs.next())
              {
                  //String name=rs.getString(2);
                 String status=rs.getString(10);
                // String idc=rs.getString(1);
                 if(status.equals("Approve"))
                 {
                     
                   }
                 else{
                      
                     
            %>
            <tr><th><input type="checkbox" name="btn" value="<%=rs.getString(1)%>" id="btn"></th>
                <th ><%=rs.getString(1)%></th>
                <th><%=rs.getString(2)%></th>
                <th><%=rs.getString(3)%></th>
                <th><%=rs.getString(4)%></th>
                <th><%=rs.getString(5)%><input type="hidden" value="<%=rs.getString(5)%>" name="mail"></th>
                <th><%=rs.getString(7)%></th>
                
                
               </tr>
            <%}}}
            else{
              
                     
            
               ResultSet rs=db.fetch("select * from new_user where name='"+search+"' or contact_no='"+search+"'");
              while(rs.next())
              {
                 String status=rs.getString(10);
                // String idc=rs.getString(1);
                 if(status.equals("Approve"))
                 {
                     
                   }
                 else     
                 {
            
            %>
            
          <tr><th><input type="checkbox" name="btn" value="<%=rs.getString(1)%>" id="btn"></th>
                <th><%=rs.getString(1)%></th>
                <th><%=rs.getString(2)%></th>
                <th><%=rs.getString(3)%></th>
                <th><%=rs.getString(4)%></th>
                <th><%=rs.getString(5)%><input type="hidden" value="<%=rs.getString(5)%>" name="mail"></th>
                <th><%=rs.getString(7)%></th>
                
                
               </tr>
               <%}}}
                  %>
            
                        
          
                  
                 
                  <tr> <th colspan="7" style="height: 70px;">
                          <input type="submit" value="Approve" name="submit" style="height: 26px; width: 100px; border: 1px solid; border-color: sienna; background-color: antiquewhite; border-radius:5px; color: black"   />&nbsp;
                    <input type="submit" value="Reject" name="submit" style="height: 26px; width: 100px; border: 1px solid; border-color: sienna; background-color: antiquewhite; border-radius:5px; color: black" />&nbsp;
                    <a href="new_user.jsp" target="iframe"><input type="button" value="Cancel" name="cancel" style="height: 26px; width: 100px; border: 1px solid; border-color: sienna; background-color: antiquewhite; border-radius:5px; color: black"/></a>
                <a href="dashboard.jsp" target="iframe"><input type="button" value="Back to dashboard" style="height: 26px; width: 190px; border: 1px solid; border-color: sienna; background-color: antiquewhite; border-radius:5px; color: black"></a>
                      </th></tr>
        </table></form>
    </body>
</html>
