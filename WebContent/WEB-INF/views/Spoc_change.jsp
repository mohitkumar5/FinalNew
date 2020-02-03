<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.*"%>
     <%@page import="java.sql.*"%>
     
     
     
     <!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="resources/css/text.css" rel="stylesheet" >

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

<div class="row" ">
  <div class="col-3 col-s-3 menu" ">
    <ul>
     <!--  <li id="dash" onclick="myDashboardFunction()">Dashboard</li>-->
      <li id="tr" onclick="myTrainingFunction()" >Training Request</li>
      <!--<li id="vendor" onclick="myVendorFunction()">Request Vendor</li>-->
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

<div class="col-4 col-s-4">

	<table table table-hover>
	<form action="" method="post">
	<%
	 	ArrayList<Map> al = (ArrayList<Map>)request.getAttribute("data");
		System.out.println("Attendance AL"+al);
		//int[] a=new int[al.size()];
		ArrayList a=new ArrayList();
		for(Map tech:al){
			System.out.println("Ak"+tech);
    	
    %>
    			<tr>
    				<th></th>
    				<th><h2>Request</h2></th>
    			</tr>
               <tr>
                   <th> Request ID</th>
                   <th><input type="text" name="" value=<%= tech.get("ReqId")%> readonly></th>
               </tr>
               <tr>
                   <th> Vertical</th>
                   <th><input type="text" name="" value=<%= tech.get("EmpId")%> readonly></th>
               </tr>
               <tr>
                   <th> Technology </th>
                   <th><input type="text" name="" value=<%= tech.get("EmpId")%> readonly></th>
               </tr>
               <tr>
                   <th> Trainer Name </th>
                   <th><input type="text" name="" value=<%= tech.get("Ename")%> readonly></th>
               </tr>
               <tr>
                   <th> No of Trainee</th>
                   <th><input type="text" name="" value=<%= tech.get("NoEmp")%> readonly></th>
               </tr>
               <tr>
                   <th> Training Start Date</th>
                   <th><input type="text" name="" value=<%= tech.get("StDt")%> readonly></th>
               </tr>
               <tr>
                   <th> Training End Date</th>
                   <th><input type="text" name="" value=<%= tech.get("EnDt")%> readonly></th>
               </tr>
               <tr>
                   <th> Training Type</th>
                   <th><input type="text" name="" value=<%= tech.get("Tr_type")%> readonly></th>
               </tr>
               <tr>
                   <th> City</th>
                   <th><input type="text" name="" value=<%= tech.get("city")%> readonly></th>
               </tr>

        </table>
</div>
 </form>
	  <%
	  	}
	  %>
 <style>
 table{
 border-collapse: separate;
 border-spacing: 0 10px;
 }
 </style>
<div class="col-5 col-s-5">
<form action="" method="post">
<table >
	
	    <%
	    	ArrayList<Map> al1 = (ArrayList<Map>)request.getAttribute("data");
			System.out.println("Attendance AL"+al);
			//int[] a=new int[al.size()];
			ArrayList a1=new ArrayList();
			for(Map tech:al1){
				System.out.println("Ak"+tech);
	    	
	    %>
	    		<tr>
    				<th></th>
    				<th><h2>Response</h2></th>
    			</tr>
               <tr>
                   <th> Request ID</th>
                   <th><input type="text" name="id" value=<%= tech.get("ReqId")%> readonly></th>
               </tr>
               <tr>
                   <th> Vertical</th>
                   <th><input type="text" name="vertical" value=<%= tech.get("EmpId")%> readonly></th>
               </tr>
               <tr>
                   <th> Technology</th>
                   <th><input type="text" name="tech" value=<%= tech.get("EmpId")%> readonly></th>
               </tr>
               <tr>
                   <th> Trainer ID</th>
                   <th><input type="text" name="trainID" ></th>
               </tr>
               <tr>
                   <th> Trainer Name</th>
                   <th><input type="text" name="trainName" ></th>
               </tr>
               <tr>
                   <th> No of Trainee</th>
                   <th><input type="text" name="no_tr" value=<%=tech.get("NoEmp") %> readonly="readonly"></th>
               </tr>
               <tr>
                   <th> Training Start Date</th>
                   <th><input type="date" name="str_date" value=<%=tech.get("StDt") %>></th>
               </tr>
               <tr>
                   <th> Training End Date</th>
                   <th><input type="date" name="end_date" value=<%=tech.get("EnDt") %>></th>
               </tr>
               <tr>
                   <th> Training Type</th>
                   <th><input type="text" name="tr_room" value=<%= tech.get("Tr_type")%>></th>
               </tr>
               <tr>
                   <th> City</th>
                   <th><input type="text" name="city" value=<%= tech.get("city")%>></th>
               </tr>
               <tr>
               		<th></th>
               		<th><button class="btn btn-info" formaction="FinalApprove">Approve</button></th>
               </tr>
       </table>

    
	
</form>
</div>
  <%} %>  
	
 </div>
</body>
</html>