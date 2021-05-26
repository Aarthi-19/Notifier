<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <!-- Font awesome -->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notifier</title>
    </head>
    <style>
 .form-box{
width:360px;
height:330px;
position:relative;
margin: 2% auto;
background:honeydew;
padding:50px;
overflow:hidden;
}
#remind
{
margin-top:140px;
}
#login
{
position:relative;
font-size:20px;
}
      </style>
    <body>
    <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    <a href="#" class="navbar-brand">Notifier</a>
    </div>
        </div>
        </nav>
    <form action="Login1" method="post" >
    <h2 id="remind" class="text-center">RemindMe</h2>
    <div class="form-box">
    <p id="login" class="text-center">Login<p>
        <input class="form-control" name="email" type="email" placeholder="email"><br><br>
        <input class="form-control" name="password" type="text" placeholder="password"><br> 
        <button class="btn btn-success btn-block">Login</button>
        <h4>Not a member?
        <a href="Signup.jsp">sign up</a></h4>
    </div>
        </form>
        
    </body>
   
   <script>
   
   
   
   
   </script>
</html>
