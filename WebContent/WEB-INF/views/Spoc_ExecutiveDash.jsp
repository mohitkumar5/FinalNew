<%@page import="com.m1.Spoc_ExecutiveInfo"%>
<%@page import="java.util.*"%>

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
      <a href="Dash"><li id="dash" onclick="myDashboardFunction()" style="text-decoration: none;">Dashboard</li></a>
      <a href="ApprovedInfo"><li id="notification" onclick="myNoticeFunction()" style="text-decoration: none;">Approved Requests</li></a>
      <a href="Login.jsp" style="text-decoration: none;" onclick="return sureFun()"><li style="list-style: none;">Log Out </li> </a>
    </ul>
  </div>

  <div class="col-9 col-s-9">
    <h1>Training Request Portal</h1>
    <p>This portal will allows project managers to request the trainee to train the employees working on particular projects.</p>

    <div class="dashboardDiv" id="dash1" style="display:block; height: 550px;">
    	
    	<%
		ArrayList<Map> al = (ArrayList<Map>)request.getAttribute("data");
		for(Map tech:al){
			System.out.println("abhi"+tech);
    	%>
        <div class="card" style="width:250px; float: left ; margin-left : 20px; margin-top: 10px;">
			  <h3 class="card-header"><%=tech.get("ReqId")%></h3>
			  <div class="card-body">
			  	<p class="card-text">Domain : <%=tech.get("Domain")%></p>
			  	<p class="card-text">Trainer : <%=tech.get("Trainer")%></p>
			  	<p class="card-text">Status : Ongoing</p>
			    <form action="Spoc_Info" method="post">
			    	<input type="text" name="techId" value="<%=tech.get("ReqId")%>" style="display: none;">
			    	<input type="text" name="domain" value="<%=tech.get("Domain")%>" style="display: none;">
			    	<input type="text5" name="trainer" value="<%=tech.get("Trainer")%>" style="display: none;"> 	
			    	<input type="text" name="status" value="<%=tech.get("Status")%>" style="display: none;"> 
			    	<input type="submit" class="btn btn-primary" value="Get Complete Data"><br><br>
			    </form>
			    
			  </div>
		</div>
			<%
				}
			%>
    </div>
    <div class="CompletedDiv" id="notice1" style="display: none">
    </div>
   

 </div>
</div>

</body>
</html>