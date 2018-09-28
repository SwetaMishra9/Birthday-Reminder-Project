<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%

    
System.out.println("JSP PAGE FOR GET PHOTO");
Connection connection = null;
String connectionURL = "jdbc:mysql://localhost:3306/birth_day_db";
ResultSet rs = null;
PreparedStatement psmnt = null;  
                         
               try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "admin");
                        //HttpSession session=req.getSession(true);
                        //String id="1";//(String)session.getAttribute("nid");
                       //int idn=Integer.parseInt(id);
					   int idn=7;
                           //int a=13;
                                           //insert into uploaded_logo(images_name) values ('"+itemName+"')"
 psmnt= connection.prepareStatement("insert into uploaded_logo(images_name) values ('"+itemName+"')");
psmnt.setInt(1,idn);
rs=psmnt.executeQuery();

if(rs.next())
{
Blob photo=rs.getBlob("images_name");
byte[] imgData=photo.getBytes(1,(int)photo.length());
 response.setContentType("image/gif");
OutputStream o=response.getOutputStream();
o.write(imgData);
o.flush();
o.close();

}
}catch(Exception e)
{
System.out.println("ggg"+e);
}
%>