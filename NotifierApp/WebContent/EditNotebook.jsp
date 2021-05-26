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
<title>Insert title her</title>
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
String OldNotebookName=(String)session.getAttribute("NotebookName");
session.setAttribute("OldNotebookName",OldNotebookName);
String NotebookName=request.getParameter("notename");
System.out.println(NotebookName+"achooo");
System.out.println(OldNotebookName+"old");
String Email=(String)session.getAttribute("email");
System.out.println("Email in edit"+Email);
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
	System.out.println(tableName+"issssss");
	if(OldNotebookName.equals(rs.getString(i)))
	{
	int ins=st.executeUpdate("update notebook set "+tableName+"='"+NotebookName+"' where email='"+Email+"'");

    break;
	}
}
}
PreparedStatement ps = conn.prepareStatement("update notifiernotes set BookName='"+NotebookName+"' where EmailId='"+Email+"'");
int i = ps.executeUpdate();
response.sendRedirect("Notebookview.jsp");
%>

</body>
</html>
