<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
    <%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="resources/static/css/NewFile.css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/static/js/style.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="header">
  <h1>Atos | Syntel</h1>
</div>

<div class="row">
  <div class="col-3 col-s-3 menu">
    <ul>
      <!-- <li id="dash" onclick="myDashboardFunction()">Dashboard</li> -->
      
      <a href="Login.jsp" style="text-decoration: none;" onclick="return sureFun()"><li style="list-style: none;">Log Out </li> </a>
    </ul>
  </div>

  <div class="col-9 col-s-9">
  <div>
  	
  	&nbsp &nbsp &nbsp<button class="btn btn-info">New Test</button>

  	</div>
 
	<%
    	ArrayList<Integer> al = (ArrayList<Integer>)request.getAttribute("data");
			System.out.println("Attendance AL"+al);
			ArrayList a=new ArrayList();
	   %>

    
	
	
	<% for(int tech:al){
		System.out.println("abhi"+tech);
	%>
	<div class="card" style="width:200px; float: left ; margin-left : 20px; margin-top: 10px;">
			<h3 class="card-header"><%=tech%></h3>
			  	<table>
			  		<tr>
			  		<td>
				  		<form action="ExSeeAssessmentDetails" method="post">
					    	<input type="text" name="TestId" value="<%=tech%>" style="display: none;">
					    	<input type="submit" class="btn btn-primary" value="Details"><br><br>
				    	</form>
			  		</td>
			  		</tr>
			  	</table>
			  </div>
	<%
	} %>
	</div>
  </div>
</div>
<script type="text/javascript">

</script>
</body>
</html>