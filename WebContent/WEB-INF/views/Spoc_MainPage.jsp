<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
     <%@page import="java.util.*"%>
     <%@page import="java.sql.*"%>
     
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="resources/css/style.css" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<link rel="stylesheet" type="text/css" href="resources/static/css/NewFile.css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/static/js/style.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

<div class="header">
  <h1>Atos | Syntel</h1>
</div>

<div class="row" >
  <div class="col-3 col-s-3 menu" >
    <ul>
     <!-- <a href="Dash"><li id="dash" onclick="myDashboardFunction()" style="text-decoration: none;">Dashboard</li></a>-->
      <a href="ApprovedInfo"><li id="notification" onclick="myNoticeFunction()" style="text-decoration: none;">Approved Requests</li></a>
      <!--<li id="vendor" onclick="myVendorFunction()">Request Vendor</li>
      <li id="notification" onclick="myNoticeFunction()">Notifications</li>-->
     <a href="Login.jsp" style="text-decoration: none;" onclick="return sureFun()"><li style="list-style: none;">Log Out </li> </a>
    </ul>
  </div>


<style type="text/css">
  .spoc_req{
  
  padding: 2px 20px;
  margin: 8px 0;
 
  border-radius: 4px;
 

  }
   .spoc_req{
  
  padding: 7px 20px;
  margin: 8px 0;
 
  border-radius: 4px;
 

  }
</style>

	<%
    	for(String tech:(ArrayList<String>)request.getAttribute("message")){
    		System.out.println(tech);
    	%>
        <div class="card" style="width:250px; float: left ; margin-left : 20px; margin-top: 10px;">
			  <h3 class="card-header"><%=tech %></h3>
			  <div class="card-body">
			    <form action="Spoc_ExInfo" method = "post">
			    	<input type="text" name="techName" value="<%=tech %>" style="display: none;">
			    	<input type="submit" class="btn btn-outline-primary" value="View All Requests">
			    </form>
			  </div>
			</div>
			<%
		} %>
</div>
<!-- <div class="footer fixed-bottom bg-primary" >
  <p>Resize the browser window to see how the content respond to the resizing.</p>
</div> -->

</body>
</html>