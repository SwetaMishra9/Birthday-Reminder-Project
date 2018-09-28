<!--?php
	$q=$_GET['q'];
	$my_data=mysql_real_escape_string($q);
	$mysqli=mysqli_connect('localhost','root','','autofield') or die("Database Error");
	$sql="SELECT name FROM tag WHERE name LIKE '%$my_data%' ORDER BY name";
	$result = mysqli_query($mysqli,$sql) or die(mysqli_error());
	
	if($result)
	{
		while($row=mysqli_fetch_array($result))
		{
			echo $row['name']."\n";
		}
	}
?>-->

<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<%
String str=request.getParameter("nameorcontact");

try {
String connectionURL = "jdbc:mysql://localhost:3306/csc";
//String connectionURL = "jdbc:mysql://192.168.10.13:3306/csc";
Connection con;
Class.forName("com.mysql.jdbc.Driver");
// Get a Connection to the database
con = DriverManager.getConnection(connectionURL, "root", "admin"); 
//Add the data into the database
String sql = "SELECT district_name FROM district WHERE district_name LIKE '"+str+"%' LIMIT 10";
Statement stm = con.createStatement();
stm.executeQuery(sql);
ResultSet rs= stm.getResultSet();
while (rs.next ()){
out.println("<li onclick='fill("+rs.getString("district_name")+");'>"+rs.getString("district_name")+"</li>");
}}catch(Exception e){
out.println("Exception is ;"+e);
System.out.println("Exception is ;"+e);
}
%>