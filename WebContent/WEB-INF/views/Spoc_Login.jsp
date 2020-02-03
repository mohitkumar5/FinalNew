<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="resources/static/css/NewFile.css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/static/js/style.js"></script>
<title>Insert title here</title>
</head>
<body>
     <div class="header">
         <h1>Atos | Syntel</h1>
     </div>
   
     <div class="container">
         <div class="row">
             <div class="col-4">
                 
             </div>
             <div class="col-4">
                 <div class="login-wrapper">
                     <br>
                     <center><h2 style="color: #0099cc">Login</h2></center>
                     <form action="Spoc_CheckLogin" method="post">
                         <select name="login-select" required id="login-select">
                             <option value="" disabled selected hidden>Select Role</option>
                             <option value="Project Manager">Project Manager</option>
                             <option value="LnD">L & D Team</option>
                             <option value="Executive">Executive</option>
                         </select><br>
                         <input type="text" required name="username" id="username" placeholder="Username"><br>
                         <input type="password" required name="password" id="password" placeholder="Password"><br>
                         <input type="submit" value="Login" onclick="myFunc()" class="btn btn-outline-primary" style="height: 40px;"><br>
                         <br>
                     </form>
                 </div>
             </div>
             <div class="col-4">

             </div>
         </div>
     </div>
 </body>
</html>