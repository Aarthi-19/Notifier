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
<title>NoteBook View</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
.edit
{
margin-left:840px;
position:relative;
passing:10px;
}
.notification {
  background-color:black;
  color: white;
  text-decoration: none;
  padding: 10px 20px;
  position: relative;
  display: inline-block;
  border-radius: 2px;
}

.notification:hover {
  background: red;
}

.notification .badge {
  position: absolute;
  top: -0px;
  right: -10px;
  padding: 5px 10px;
  border-radius: 50%;
  background: red;
  color: white;
}
</style>
<body>
<nav class="navbar navbar-inverse ">
  <div class="container-fluid">

</div>
 <div class="topnav">
    <span class="navbar-brand" style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
   </div>
   <ul class="nav navbar-nav navbar-right">
   <li><a href="" class="navbar-right " data-toggle="modal" data-target="#myModal">Add Note Book</a></li>
   <li> <a href="#" class="notification">
   <span class="glyphicon glyphicon-bell"></span>
   <span class="badge">3</span>
   </a></li>
   <li> <a href="index.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a>
    </li>
   </ul>
    
 
  
    </nav>
<div id="mySidenav" class="sidenav">
  <a href="#" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="Notebookview.jsp">Notebooks</a>
 <a href="NotificationProcess.jsp" method="post">Notes</a>
  <a href="Edituser.jsp">Edit User</a>
    </div>
      <ul class="nav navbar-nav navbar-right">
    <div class="container">
  <!-- Trigger the modal with a button -->

  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
        <form action="add" method="post">
          <input class ="form-control" type="text" placeholder="Enter Notebook name" name="notebook"><br>
          <button class="btn btn-primary">Submit</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
      </ul>
    </div>

<h1>Notebooks</h1>
<%
String email=(String)session.getAttribute("email");
System.out.println("Email is "+email);
session.setAttribute("email", email);
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","Aarthi@123");
String sql="select * from notebook where email='"+email+"'";
ResultSet rs;
Statement st=conn.createStatement();
rs=st.executeQuery(sql);
while(rs.next())
{
System.out.println(rs.getRow());
for(int i=2;i<=12;i++)
{
System.out.println(rs.getString(i));
if(rs.getString(i)!=null)
{
	String NotebookName=rs.getString(i);
	String tableName=(String)session.getAttribute("tableName");
	session.setAttribute("NotebookName", NotebookName);
	session.setAttribute("tableName",tableName);%>
<div class="container">
  <div class="jumbotron">
  <form name="" action="addNotes">
  <a href="" onclick="validate()" class="glyphicon glyphicon-plus" "name="NotebookName" id="demo" class="navbar-right " data-toggle="modal" data-target="#addnotes"></a>&nbsp;&nbsp;&nbsp;<a><%=rs.getString(i) %></a>
  <a href="" class="edit" class="glyphicon glyphicon-edit" class="navbar-right "data-toggle="modal" data-target="#editNotes">Edit</a>&nbsp;&nbsp;&nbsp;
  <a href='DeleteNotebook.jsp?NotebookName=<%=rs.getString(i) %>' name="Deleteitem" >Delete</a> 
 
  </form>
    </div>
</div>

<%
}
}
}

%>
<!-- ADD NOTES -->
<div class="modal fade" id="addnotes" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
        <h4>Add your notes</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <form action="addNotes" method="post">
          <input class ="form-control" type="text" placeholder="Enter Note name" name="notename"><br>
           <input class ="form-control" type="date" placeholder="Enter Start Date" name="startdate"><br>
           <input class ="form-control" type="date" placeholder="Enter End Date" name="enddate"><br>
          <input class ="form-control" type="date" placeholder="Enter Remainder Date" name="remainderdate"><br>
          <input class ="form-control" type="text" placeholder="Enter the Status" name="status"><br>
          <input class ="form-control" type="text" placeholder="Tag" name="tag"><br>
          <input class ="form-control" type="text" placeholder="Description" name="description"><br>
          
          <button class="btn btn-primary">Submit</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <!-- EDIT -->
<div class="modal fade" id="editNotes" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
        <h4>Edit your Notebook</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <form action="EditNotebook.jsp" method="post">
          <input class ="form-control" type="text" placeholder="Enter Note name" name="notename"><br>
          <button class="btn btn-primary">Submit</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>


<%
session.getAttribute("email");
%>
</body>
<script>

function openNav() {
  document.getElementById("mySidenav").style.width ="250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
function validate()
{
var x=document.getElementById("demo").innerHTML;
console.log(x+"is");
}
</script>

</html>
