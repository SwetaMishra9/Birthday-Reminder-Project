<%@page import="java.sql.*" %>
<jsp:useBean id="db" class="mybean.Dbcon" />
<%
	String q=request.getParameter("q");
    db.mkcon();
    out.println(q);
    System.out.println("Database Connection = "+db);
    try{
       // ResultSet rs=db.fetch("select distinct(product) from medicineinfo where product LIKE '%"+q+"%'");
	    ResultSet rs=db.fetch("select name from new_user where name LIKE '%"+q+"%'");
        while(rs.next()){
            out.println(rs.getString(1));

        }//end of while loop
    }//end of try
    catch(Exception e){
        out.println(e);
        System.out.println(e);
    }//end of catch
%>