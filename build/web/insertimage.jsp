<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %> 
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%> 
<%@ page import="org.apache.commons.fileupload.*"%> 
<%@ page import="java.util.*, java.io.*" %> 
<%@ page import="java.util.Iterator"%> 
<%@ page import="java.util.List"%> 
<%@ page import="java.io.File"%> 
<%@ page contentType="text/html;charset=UTF-8" %> 
<jsp:useBean id="db" class="mybean.Dbcon" />

<% 
    db.mkcon();
    out.println("sedfghjk");
try 
{ 
String ImageFile=""; 
String itemName = ""; 
boolean isMultipart = ServletFileUpload.isMultipartContent(request); 
if (!isMultipart) 
{ 
} 
else 
{ 
FileItemFactory factory = new DiskFileItemFactory(); 
ServletFileUpload upload = new ServletFileUpload(factory); 
List items = null; 
out.println("sedfghjk");
try 
{ 
items = upload.parseRequest(request); 
out.println("sedfghjk");
} 
catch (FileUploadException e) 
{ 
e.getMessage(); 
} 

Iterator itr = items.iterator(); 
while (itr.hasNext()) 
{ 
FileItem item = (FileItem) itr.next(); 
if (item.isFormField()) 
{ 
String name = item.getFieldName(); 
String value = item.getString(); 
if(name.equals("ImageFile")) 
{ 
ImageFile=value; 
} 

} 
else 
{ 
try 
{ 
itemName = item.getName(); 


} 
catch (Exception e) 
{ 
out.println("Error"+e.getMessage()); 
} 
} 
} 
try 
{ 
    db.dbupdate("update uploaded_logo set images_name='"+itemName+"' where iImageID='7'"); 
 //db.dbupdate("insert into uploaded_logo(images_name) values ('"+itemName+"')"); 

} 
catch(Exception el) 
{ 
out.println("Inserting error"+el.getMessage()); 
} 
} 
} 
catch (Exception e){ 
out.println(e.getMessage()); 
} 
%> 