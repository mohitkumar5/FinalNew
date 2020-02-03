<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		<%
					
		%>
		    <%@page import="java.util.ArrayList"%>
    <%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link href="resources/css/style.css" rel="stylesheet" >
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.5/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/css/tether.min.css" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.min.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src="style.js"></script>
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
      <script src="bootstrap.min.js"></script>
      <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <script src="homestyle.js" type="text/javascript"></script>


        <script src="homestyle.js" type="text/javascript">
        
        
         
          function submitButtonStyle(_this) {
            $("button").click(function(){
                  if(clicked){
                      $(this).css('background-color', 'red');
                      clicked  = false;
                  } else {
                      $(this).css('background-color', 'green');
                      clicked  = true;
                  }   
              });
}
          
            $(document).ready(function() {
                var dateInput = $('input[name="start"]'); // Our date input has the name "date"
               
                dateInput.datepicker({
                 container: container,
                  todayHighlight: true,
                  autoclose: true,
                  startDate: truncateDate(new Date()) // <-- THIS WORKS
                });
              
                $('#date').datepicker('setStartDate', truncateDate(new Date())); // <-- SO DOES THIS
              });
              
              function truncateDate(date) {
                return new Date(date.getFullYear(), date.getMonth(), date.getDate());
              }
            </script>
</head>
<body>

<div class="header">
  <h1>Atos | Syntel</h1>
</div>

<div class="row" style="">
  <div class="col-3 col-s-3 menu" style="">
    <ul>
      <li id="dash" onclick="myDashboardFunction()">Dashboard</li>
      <li id="tr" onclick="myTrainingFunction()" >Training Request</li>
      <!--<li id="vendor" onclick="myVendorFunction()">Request Vendor</li>-->
      <li id="notification" onclick="myNoticeFunction()">Notifications</li>
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

  #d1
  {
   width: 50%;
   height: 650px;

  }
  #table1
  {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  }

 #table1 th {
  padding-top: 16px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
  text-align: center;
  text-decoration-color: black;
}
#table1 tr:hover {
  background-color:DodgerBlue;
  }
</style>


<div class="col-9 col-s-9" style="" id="d1">
<h2>Request Table</h2>

	<table style="padding-bottom: 3px;  align="center" border="1"  ="table1">
		<thead>
      		<tr>
        		<th scope="col">Request Id</th>
        		<th scope="col">Technology</th>
        		<th scope="col">Start Date</th>
        		<th scope="col">End Date</th>
        		<th scope="col">Requested Date</th>
        		<th scope="col">Suggested Trainer</th>
        		<th scope="col">No Of Employee</th>
        		<th scope="col">Training Type</th>
       			<th scope="col">City</th>
        		<th scope="col">Delete</th>
      		</tr>
    	</thead>
    	<tbody>
    	
 		<%
    			ArrayList<Map> al = (ArrayList<Map>)request.getAttribute("data");
    			for(Map tech:al){
    				System.out.println("abhi"+tech);
    	%>
 
	  		<tr>
	  			<td>
		  			<form action="PmInfo" method="post">
			    		<input type="text" name="reqid" value="<%=tech.get("reqid") %>" style="display: none;">
			    		<input type="submit" value="<%=tech.get("reqid") %>" class="btn btn-primary">
			   		</form>
	  			</td>
	  			<td><%=tech.get("domain") %></td>
	  			<td><%=tech.get("stdt") %></td>
	  			<td><%=tech.get("endt") %></td>
	  			<td><%=tech.get("reqdt") %></td>
	  			<td><%=tech.get("sg_trainer") %></td>
	  			<td><%=tech.get("noemp") %></td>
	  			<td><%=tech.get("training") %></td>
	  			<td><%=tech.get("city") %></td>
	  			<td><form action="PmInfo" method="post">
			    	<input type="submit" value="Delete" class="btn btn-primary">
			   	</form></td>
	  		</tr>
    	
    	<%
		} %>
 		</tbody>
  </table>
  </div>
  

  </div>
</div>
</nav>

<!-- <div class="footer fixed-bottom bg-primary" >
  <p>Resize the browser window to see how the content respond to the resizing.</p>
</div> -->

</body>
</html>