<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
     <%@page import="java.util.*"%>
     <%@page import="java.sql.*"%>
     
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" >
 
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
      <a href="Dash"><li id="dash" onclick="myDashboardFunction()" style="text-decoration: none;">Dashboard</li></a>
      <a href="ApprovedInfo"><li id="notification" onclick="myNoticeFunction()" style="text-decoration: none;">Approved Requests</li></a>
      <!--<li id="vendor" onclick="myVendorFunction()">Request Vendor</li>
      <li id="notification" onclick="myNoticeFunction()">Notifications</li>-->
     <a href="Login.jsp" style="text-decoration: none;" onclick="return sureFun()"><li style="list-style: none;">Log Out </li> </a>
    </ul>
  </div>


<style type="text/css">
  
  table{
 border-collapse: separate;
 border-spacing: 0 10px;
 }
</style>

<div class="col-2 col-s-2" >

</div>

<div class="col-7 col-s-7" >
<form method="post" action="Spoc_approve">
<%
    	ArrayList<Map> al = (ArrayList<Map>)request.getAttribute("data");
			System.out.println("Attendance AL"+al);
			//int[] a=new int[al.size()];
			ArrayList a=new ArrayList();
			for(Map tech:al){
				System.out.println("Ak"+tech);
    	
    	%>
  <table>
      <tr>
		<th></th>
		<th><h2>Request</h2></th>
		</tr>
          <tr>
              <th> Request ID</th>
              <th><input type="text" name="man_id" value=<%= tech.get("ReqId")%> readonly></th>
          </tr>
          <tr>
              <th> Vertical</th>
              <th><input type="text" name="man_ver" value=<%= tech.get("EmpId")%> readonly></th>
          </tr>
          <tr>
              <th> Technology </th>
              <th><input type="text" name="man_tech" value=<%= tech.get("EmpId")%> readonly></th>
          </tr>
          <tr>
              <th> Trainer Name </th>
              <th><input type="text" name="tr_name" value=<%= tech.get("Ename")%> readonly></th>
          </tr>
          <tr>
              <th> No of Trainee</th>
              <th><input type="text" name="trainee_no" value=<%= tech.get("NoEmp")%> readonly></th>
          </tr>
          <tr>
              <th> Training Start Date</th>
              <th><input type="text" name="str_date" value=<%= tech.get("StDt")%> readonly></th>
          </tr>
          <tr>
              <th> Training End Date</th>
              <th><input type="text" name="end_date" value=<%= tech.get("EnDt")%> readonly></th>
          </tr>
          <tr>
              <th> Training Type</th>
              <th><input type="text" name="tr_room" value=<%= tech.get("Tr_type")%> readonly></th>
          </tr>
          <tr>
              <th> City</th>
              <th><input type="text" name="tr_city" value=<%= tech.get("city")%> readonly></th>
          </tr>
          <tr>
              <th> Status</th>
              <th><input type="text" name="status" value=<%= tech.get("Status")%> readonly></th>
          </tr>
          <tr>
    		<th><center><button class="btn btn-info">Approve</button></th>
     <th><a><button class="btn btn-dark" formaction="Spoc_change">Change</button></center></a></th>
     </tr>
	</table>
  </div>
  </form>
 <%
 }%>
</div>
<!-- <div class="footer fixed-bottom bg-primary" >
  <p>Resize the browser window to see how the content respond to the resizing.</p>
</div> -->

</body>
</html>