<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %> 
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>   
<%@ page import="java.sql.Statement" %>   


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
String OldNotesName=(String)session.getAttribute("NotesName");
session.setAttribute("OldNotebookName",OldNotesName);
String NotesName=request.getParameter("notesname");
String Email=(String)session.getAttribute("email");
System.out.println("Email in edit"+Email);
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","Aarthi@123");
	
Statement st=conn.createStatement();
	int ins=st.executeUpdate("update notifiernotes set NotesName='"+NotesName+"' where EmailId='"+Email+"'");

	System.out.println(NotesName+" in edit notes");
	System.out.println(OldNotesName+" in edit notes");    
System.out.println("updated");
response.sendRedirect("Notesview.jsp");
%>

</body>
</html>
