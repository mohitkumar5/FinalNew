<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
    <%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

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
      <!--<li id="dash" onclick="myDashboardFunction()">Dashboard</li>  -->
      
      <a href="Login.jsp" style="text-decoration: none;" onclick="return sureFun()"><li style="list-style: none;">Log Out </li> </a>
    </ul>
  </div>

  <div class="col-9 col-s-9">
	<%
    	ArrayList<Map> al = (ArrayList<Map>)request.getAttribute("data");
		ArrayList<Map> details=(ArrayList<Map>)request.getAttribute("data1");
		
    	for(Map tech:al){
    		System.out.println("details"+tech.get("TestId"));
    		
    %>
     <div class="card" style="width:270px; float: left ; margin-left : 20px; margin-top: 10px;">
			  <h3 class="card-header">Report : <%=tech.get("TestId") %></h3>
			  <div class="card-body">
			  	<p class="card-text">Request Id : <%=tech.get("ReqId") %></p>
			  	<p class="card-text">Test Date : <%=tech.get("TestDate") %></p>
			  	<p class="card-text">Present Count : <%=tech.get("PresentCount") %></p>
			  	<p class="card-text">Absent Count : <%=tech.get("AbsentCount") %></p>
			 </div>
	</div>
    <%
    	}
    	%>
 
    	<div style="width: 500px; height:250px; overflow: auto; scrolling="no">
    	<center><h3>Results</h3></center>
    	<table class="table table-hover">
			<tr style="text-align:center">
				<th class="thead-dark">Employee ID</th>
				<th class="thead-dark">Grade</th>
			</tr>
			<% 
				for(Map tech:details){	
    		%>
    			<tr style="height:10px;">
					<td style="text-align:center"><h6><%= tech.get("EmpId")%></h6></td>
					<td style="text-align:center"><h6><%= tech.get("Grade")%></h6></td>
				</tr>
    		
    		<%
    		}%>
    	</table>
    	</div>
 </div>
</body>
</html>