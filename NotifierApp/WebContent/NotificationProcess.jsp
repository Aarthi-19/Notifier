<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*,java.util.*,GetterSetter.Notificationgetset,java.io.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notes</title>
</head>
<body>
<%
String Email=(String)session.getAttribute("email");

Notificationgetset obj=new Notificationgetset();
obj.setEmail(Email);

    Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","Aarthi@123");
   	
	String sql="select * from notifiernotes where EmailId='"+Email+"'";	    		
	Statement st=conn.createStatement();
	ResultSet rs=st.executeQuery(sql);
	rs.next();
    ArrayList<Notificationgetset> list=new ArrayList<Notificationgetset>();
	while(rs.next())
	{
		obj.setNotesName(rs.getString(3));
		obj.setStartDate(rs.getString(4));
		obj.setEndDate(rs.getString(5));
		obj.setRemainderDate(rs.getString(6));
		obj.setStatus(rs.getString(7));
		list.add(obj);
	}
	
	    request.setAttribute("List", list);
		RequestDispatcher rd=request.getRequestDispatcher("Notesview.jsp");
		rd.forward(request, response);
%>
</body>
</html>