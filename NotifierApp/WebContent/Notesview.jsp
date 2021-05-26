
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %> 
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>   
<%@ page import="java.sql.Statement" %>   
 <%@page import="java.sql.*,java.util.*,GetterSetter.FullNotesgetset,java.io.*"%>
 <%@page import="java.sql.*,java.util.*,GetterSetter.Notificationgetset,java.io.*"%>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notes</title>
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
</style>
<body>
<nav class="navbar navbar-inverse ">
  <div class="container-fluid">

</div>
 <div class="topnav">
    <span class="navbar-brand" style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
   </div>
   <ul class="nav navbar-nav navbar-right">
   <li> <a href="#" class="navbar-right "data-toggle="modal" data-target="#NotificationDetails"><span class="glyphicon glyphicon-bell"></span></a></li>
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
<!-- SEARCH -->
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

<!-- TO VIEW THE NOTES -->
<h1>Notes</h1>
<%@page import="java.sql.*,java.util.*,GetterSetter.Notesviewgetset,java.io.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root", "Aarthi@123");
String Email=(String)session.getAttribute("email");
String sql="select * from notifiernotes";
ResultSet rs;
Statement st=conn.createStatement();
rs=st.executeQuery(sql);
Notesviewgetset notes=new Notesviewgetset();
notes.setEmail(Email);
while(rs.next())
{
	ArrayList<Notesviewgetset> list=new ArrayList<Notesviewgetset>();

	if(rs.getString(1).equals(Email))
	{
		notes.setNotesName(rs.getString(3));
		session.setAttribute("NotesName", rs.getString(3));
		list.add(notes);
		System.out.println(rs.getString(3)+"hi");
	}
	for(Notesviewgetset e:list)
	{
%>
<div class="container">
  <div class="jumbotron">
  <form name="" action="addNotes">
  <a href="" class="glyphicon glyphicon-plus" "name="NotebookName" id="demo" class="navbar-right "data-toggle="modal" data-target="#fullNotes" ></a>&nbsp;&nbsp;&nbsp;<a><%=e.getNotesName() %></a>
  <a href="" class="edit" class="glyphicon glyphicon-edit" class="navbar-right "data-toggle="modal" data-target="#editNote">Edit</a>&nbsp;&nbsp;&nbsp;
  <a href="DeleteNotes.jsp?NotebookName=<%=e.getNotesName()%>" name="Deleteitem" >Delete</a> 
 
  </form>
    </div>
</div>
<% 
	}
}
%>
</div>
</div>
<br>



  <!-- EDIT -->
<div class="modal fade" id="editNote" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
        <h4>Edit your Notes</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <form action="EditNotes.jsp" method="post">
          <input class ="form-control" type="text" placeholder="Enter Note name" name="notesname"><br>
          <button class="btn btn-primary">Submit</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <!-- NOTIFICATION DETAILS -->
  <ul class="nav navbar-nav navbar-right">
              <div class="container">
  <!-- Trigger the modal with a button -->

  <div class="modal fade" id="NotificationDetails" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Reminder</h4>
        </div>
        <div class="modal-body">
        <form action="add" method="post">
  
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
      </ul>

  
  <!-- TO VIEW FULL DETAILS OF NOTES -->
  <div class="modal fade" id="fullNotes" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
        <h4>Note</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <form action="" method="post">
        
          <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","Aarthi@123");
          	
          String Emailid=(String)session.getAttribute("email");
          String NotesName=(String)session.getAttribute("NotesName");
          System.out.println(Emailid+"Fulldetails");
          System.out.println(NotesName+"Fulldetails");
  		 String sqlQuery="select * from notifiernotes where Emailid='"+Emailid+"' and NotesName='"+NotesName+"'";	    		
          Statement stmt=conn1.createStatement();
          ResultSet res;
          res=stmt.executeQuery(sqlQuery);
          res.next();        	  
          FullNotesgetset obj=new FullNotesgetset();
          try{
          if(res.getRow()!=0)
          {
          obj.setBookName(res.getString(2));
          obj.setNotesName(res.getString(3));
          obj.setStartDate(res.getString(4));
          obj.setEnddate(res.getString(5));
          obj.setRemainderDate(res.getString(6));
          obj.setStatus(res.getString(7));
          obj.setTag(res.getString(8));
          obj.setDescription(res.getString(9));          
          ArrayList<FullNotesgetset> list=new ArrayList<FullNotesgetset>();
          list.add(obj);
          for(FullNotesgetset output:list)
          {
          %>
          </form>
          <div class="container">
  <table style="width:38%">
  <tr>
    <th>Name</th>
    <th><%=output.getNotesName()%></th> 
  </tr>
  <tr>
    <th>StartDate</th>
    <th><%=output.getStartDate()%></th> 
  </tr>
   <tr>
    <th>EndDate</th>
    <th><%=output.getEnddate()%></th> 
  </tr>
  <tr>
    <th>RemainderDate</th>
    <th><%=output.getRemainderDate()%></th> 
  </tr>
  <tr>
    <th>Status</th>
    <th><%=output.getStatus()%></th> 
  </tr>
  <tr>
    <th>Tag</th>
    <th><%=output.getTag()%></th> 
  </tr>
  <tr>
    <th>Description</th>
    <th><%=output.getDescription()%></th> 
  </tr>
  </table>
  
</div>
<%
          }
          }
          }
          catch(Exception e)
          {
        	  e.printStackTrace();
          }
%>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>


</body>
<script>

function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
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
