<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Successful!!!</title>
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
background-color:peach;
}
.jumbotron
{
margin-top:100px;
margin-right:50px;
margin-left:50px;
background-color:teal;
}
</style>
<div class="content">
<%@page import="java.sql.*,java.util.*,java.io.*"%>
<div class="container">
<div class="jumbotron">
<div class="well">
<form action="index.jsp">
<h3>You have already registered using this email</h3>
<h2>Please Click below to login</h2> 
<button type="submit" class="btn btn-primary">Login</button>
</form>
</div>
</div>
</div>
</body>
</html>