<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<div class="row">
  <div class="col-3 col-s-3 menu">
    <ul>
      <li id="dash" onclick="myDashboardFunction()">Dashboard</li>
      <!-- <li id="notification" onclick="myNoticeFunction()">Completed Trainings</li> -->
      <a href="Login.jsp" style="text-decoration: none;" onclick="return sureFun()"><li style="list-style: none;">Log Out </li> </a>
    </ul>
  </div>

  <div class="col-9 col-s-9">
    <h1>Training Request Portal</h1>
    <p>This portal will allows project managers to request the trainee to train the employees working on particular projects.</p>

    <div class="dashboardDiv" id="dash1" style="display: block; height: 550px;">
    	<%
    	for(String tech:(ArrayList<String>)request.getAttribute("message")){
    		System.out.println(tech);
    	%>
        <div class="card" style="width:250px; float: left ; margin-left : 20px; margin-top: 10px;">
			  <h3 class="card-header"><%=tech %></h3>
			  <div class="card-body">
			    <form action="ExExecutiveInfo" method = "post">
			    	<input type="text" name="techName" value="<%=tech %>" style="display: none;">
			    	<input type="submit" class="btn btn-outline-primary" value="View All Trainings">
			    </form>
			  </div>
			</div>
			<%
		} %>
    </div>
    <div class="dashboardDiv" id="notice1" style="display: none">
        <h2>Notification Elements</h2>
    </div>

  </div>
</div>

</body>
</html>