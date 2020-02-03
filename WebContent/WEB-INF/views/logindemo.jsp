<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		<%
					
		%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link href="resources/css/style.css" rel="stylesheet" >

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
                        <center><h2 style="color:  #0099cc">Login</h2></center>
                        <form name="request" method="GET" action="operations.jsp" >
                            <select name="login-select" required id="login-select">
                                <option value="" disabled selected hidden>Select Role</option>
                                <option value="project-manager">Project Manager</option>
                                <option value="lnd">SPOC</option>
                                <option value="executive">Executive</option>
                            </select><br>
                            <input type="text" required name="username" id="username" placeholder="Username" required><br>
                            <input type="password" required name="password" id="password" placeholder="Password" required><br>
                            <input type="submit" onclick="" value="Login"  class="btn btn-outline-primary" style="height: 40px;"><br>
                          
                            <br>
                        </form>
                         <center> <a href="pm_reg.jsp">Register here</a></center>
                    </div>
                </div>
                <div class="col-4">

                </div>
            </div>
        </div>
    </body>


<style>

</style>




		
		</body>
		</html>	