
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
String Email=(String)session.getAttribute("email");
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","Aarthi@123");
	
//Statement st=conn.createStatement();
//String sql="select * from notifiernotes where email='"+Email+"'and BookName="+NotebookName+"'";	
ResultSet rs;
//rs=st.executeQuery(sql);
//rs.next();

	//int ins=st.executeUpdate("DELETE from notifiernoteswhere email='"+Email+"'and BookName="+NotebookName+"'" );
	PreparedStatement st = conn.prepareStatement("DELETE  from notifiernotes where Emailid=? and NotesName=?");
    st.setString(1, Email);
    st.setString(2, NotebookName);
    int i = st.executeUpdate();
	System.out.println("Email in deletenotes"+Email);
	System.out.println(NotebookName+"in delete notes");
	System.out.println("deleted");

response.sendRedirect("Notesview.jsp");
%>







</body>
</html>