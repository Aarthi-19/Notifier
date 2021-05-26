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
        <title>JSP Page</title>
    </head>
    <style>
 .form-box{
width:360px;
height:500px;
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
     <form name="form1" method="post" action="Register" onsubmit="return validate();" id="register" class="input">
     <div class="form-box"> 
    <p id="login" class="text-center">Sign Up<p>
        <input class="form-control" type="text" name="username" placeholder="Username"><br>
        <input class="form-control" type="number" name="mobilenumber" placeholder="Mobilenumber"><br>
        <input class="form-control" type="email" name="email" placeholder="Email"><br>
        <input class="form-control" type="text" name="password" placeholder="Password"><br> 
        <input class="form-control" type="text" name="confirmpassword" placeholder="Confirmpassword"><br>
        <button class="btn btn-success btn-block" type="submit">Submit</button>
        <h4>Already a member?
        <a href="index.jsp">login</a></h4>
    </div>
     </form>   
    <script>
    function validate()
{
	 valid = true;
	 var Password=document.form1.password.value;
	 var pass=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
	 var Confirmpassword=document.form1.confirmpassword.value;
	 var confirmpass=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
	 var Username=document.form1.username.value;
	 var UN= /^[a-zA-Z][a-zA-Z\\s]+$/;
	 var Mobile=document.form1.mobilenumber.value;
	 var MN=/^([0-9]{10})$/;
		    if ( !Password.match(pass))
	    {
	        alert ("Password must be at least 8 characters long one uppercase with one lowercase and one numeric character");
	        valid = false;
	    }
		    else if ( !Confirmpassword.match(confirmpass))
		    {
		        alert ("Confirm Password must be at least 8 characters long one uppercase with one lowercase and one numeric character");
		        valid = false;
		    }
		    else if(!Username.match(UN))
	    	{
	    	alert("verify your Username.It must contain only alphabets");
	    	valid=false;
	    	}
		    else if(!Mobile.match(MN))
	    	{
	    	alert("verify your Mobile Number.It must contain  10 numbers");
	    	valid=false;
	    	}
		    if(!Password.match(Confirmpassword))
		 	{
		 	alert("Password and Confirm Password does not match");
		 	valid=false;
		 	}
	    
	   return valid;
}
</script> 
    </body>
</html>
