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
 
	<%
    	ArrayList<Map> al = (ArrayList<Map>)request.getAttribute("data");
			System.out.println("Attendance AL"+al);
			//int[] a=new int[al.size()];
			ArrayList a=new ArrayList();
    	
    	%>
    
	<div style="width: 500px; height:250px; overflow: auto; scrolling="no">	

		<form action="ExInsertAttendance" method="post">
		<table class="table table-hover">
			<tr>
				<th class="thead-dark">Employee ID</th>
				<th class="thead-dark">Present</th>
				<th class="thead-dark">Absent</th>
			</tr>
			<% 
				for(Map tech:al){
					System.out.println("Ak"+tech);
					a.add(tech.get("EmpId"));
    		%>
				<tr style="height:10px;">
					<td><%= tech.get("EmpId")%></h5></td>
					<td>
						<input type="radio" name=<%= tech.get("EmpId") %> value="1" checked>&nbsp;&nbsp;Present 
					</td>
					<td>
						<input type="radio"  name=<%=tech.get("EmpId") %> value="0"/>&nbsp;&nbsp;Absent
					 
					</td>
					
				</tr>
			<%
			}
			
			session.setAttribute("AttData", a);
    		%>
		</table>
		<input type="submit" class="btn btn-outline-primary" onclick="getRadio()" value="Submit" style="float: right; margin-bottom: 20px; margin-right: 10px;">
		</form>
	</div>
  </div>
</div>
<script type="text/javascript">

</script>
</body>
</html>