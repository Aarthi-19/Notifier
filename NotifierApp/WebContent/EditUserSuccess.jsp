<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Success</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- Font awesome -->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<style>
.container{
width:100%;
height:100%;
text-align:center;
}
.well{
background: linear-gradient(to top right, #33ccff 0%, #ff99cc 100%);
}
.jumbotron
{
margin-top:13%;
margin-left:20%;
margin-right:20%;
margin-bottom:10%;
background: linear-gradient(to bottom left, #33ccff 0%, #ff99cc 100%);

}
</style>
<div class="content">
<%@page import="java.sql.*,java.util.*,java.io.*"%>
<div class="container">
<div class="jumbotron">
<div class="well">
<form action="index.jsp">
<h2>You have updated your details successfully</h2>
<h2>Click here to login</h2>
<button type="submit" class="btn btn-primary">Login</button>
</form>
</div>
</div>
</div>
</body>
</html>