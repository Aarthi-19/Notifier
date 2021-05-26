
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %> 
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>   
<%@ page import="java.sql.Statement" %>   
<%@ page import="java.sql.PreparedStatement" %>   


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<style>
</style>
<body>

<%
String NotebookName=request.getParameter("NotebookName");
System.out.println(NotebookName);
String Email=(String)session.getAttribute("email");
System.out.println("Email in delete"+Email);
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","Aarthi@123");
	
Statement st=conn.createStatement();
String sql="select * from notebook where email='"+Email+"'";	
ResultSet rs;
rs=st.executeQuery(sql);
rs.next();
if(rs.getRow()!=0)
{
for(int i=2;i<=12;i++)
{
	String tableName="Notebook"+i;
	if(NotebookName.equals(rs.getString(i)))
	{
	int ins=st.executeUpdate("update notebook set "+tableName+"=NULL where email='"+Email+"'");
	break;
	}
}
}
PreparedStatement ps = conn.prepareStatement("DELETE  from notifiernotes where Emailid=? and BookName=?");
ps.setString(1, Email);
ps.setString(2, NotebookName);
int i = ps.executeUpdate();
response.sendRedirect("Notebookview.jsp");
%>







</body>
</html>