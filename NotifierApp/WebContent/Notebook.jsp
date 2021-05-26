<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
body {
  font-family: "Lato", sans-serif;
}
#remind
{
margin-left:200px;
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
 .form-box{
width:360px;
height:420px;
position:relative;
margin: 2% auto;
background:grey;
padding:50px;
overflow:hidden;
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
   <li> <a href="#"><span class="glyphicon glyphicon-bell"></span></a></li>
   <li> <a href="index.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a>
    </li>
   </ul>
    
 
  
    </nav>
<div id="mySidenav" class="sidenav">
  <a href="#" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="Notebookview.jsp">Notebooks</a>
  <a href="Notesview.jsp">Notes</a>
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
          <h4 class="modal-title">Add Notebook</h4>
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
<form class="navbar-form navbar-right" action="">
  <div class="input-group">
    <input type="text" class="form-control" placeholder="Search">
    <div class="input-group-btn">
      <button class="btn btn-default" type="submit">
        <i class="glyphicon glyphicon-search"></i>
      </button>
    </div>
  </div>
</form>      
<%
session.getAttribute("email");
%>
</body>
<script>

function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>

</html>
