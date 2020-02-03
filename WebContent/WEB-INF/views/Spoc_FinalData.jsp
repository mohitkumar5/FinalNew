<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@page import="java.util.*"%>
     <%@page import="java.sql.*"%>
     
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" >

</head>
<body>

<div class="header">
  <h1>Atos | Syntel</h1>
</div>

<div class="row" style="border: 2px solid black;">
  <div class="col-3 col-s-3 menu" style="border: 2px solid black;">
    <ul>
      <li id="dash" onclick="myDashboardFunction()" style="cursor: c;">Dashboard</li>
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
</style>
<form method="post" action="approve">
<%
    	ArrayList<Map> al = (ArrayList<Map>)request.getAttribute("data");
			System.out.println("Attendance AL"+al);
			//int[] a=new int[al.size()];
			ArrayList a=new ArrayList();
			for(Map tech:al){
				System.out.println("Ak"+tech);
    	
    	%>

<div class="col-9 col-s-9" style="border: 2px solid black;">
    <center><table style="padding-bottom: 3px;">
      <tr>
        <tr>
        <br>
        <td class="spoc_req">
          Request ID
        </td>
        <td class="spoc_req1">
           <input type="text" name="man_id" value=<%= tech.get("ReqId") %> readonly="readonly"><br><br>
        </td>
		
      </tr>
 <td class="spoc_req">
          Vertical 
        </td>
         <td class="spoc_req1">
           <input type="text" name="man_ver" value=<%= tech.get("EmpId") %> readonly="readonly" ><br><br>
        </td>
       
      </tr>


      <tr>
        <br>
        <td class="spoc_req">
          Technology 
        </td>
        <td class="spoc_req1">
           <input type="text" name="man_tech" value=<%= tech.get("EmpId")%> readonly="readonly"><br><br>
        </td>
		
      </tr>

   <!--  <tr>
        <td class="spoc_req">
         Trainer ID<br><br>  
        </td>
         <td class="spoc_req1">
           <input type="text" name="tr_id" readonly="readonly"><br><br>
        </td>
        
    </tr> -->

    <tr>
        <br>
        <td class="spoc_req">
         Trainer Name 
        </td>
        <td class="spoc_req1">
           <input type="text" name="tr_name" value=<%= tech.get("Ename")%> readonly="readonly"><br><br>
        </td>
		
      </tr>

      <tr>
            <td class="spoc_req">
           No of Trainee  
        </td>
         <td class="spoc_req1">
           <input type="text" name="trainee_no" value=<%= tech.get("NoEmp")%> readonly="readonly"><br><br>
        </td>
      
      </tr>


    <tr>
        <td class="spoc_req">
         Training Start Date <br><br>  
        </td>
        <td class="spoc_req1">
           <input type="text" name="str_date" value=<%= tech.get("StDt")%> readonly="readonly"><br><br>
        </td>
    </tr>

    <tr>

         <td class="spoc_req">
           Training End Date <br><br>  
        </td>
        <td class="spoc_req1">
           <input type="text" name="end_date" value=<%= tech.get("EnDt")%> readonly="readonly"><br><br>
        </td>

    </tr>

    <tr>
         <td class="spoc_req">
          Training Type<br><br>  
        </td>
        <td class="spoc_req1">
           <input type="text" name="tr_room" value=<%= tech.get("Tr_type")%>><br><br>
        </td>
       
    </tr>

    <tr>
            <td class="spoc_req">
           City
        </td>
         <td class="spoc_req1">
           <input type="text" name="tr_city" value=<%= tech.get("city")%> readonly="readonly"><br><br>
        </td>
		

<tr>
        </td>
        <td class="spoc_req1">
           <input type="text" name="status" value=<%= tech.get("Status")%> style="display: none;">
        </td>
       
    </tr>

          
      </tr>
      

    <!--<tr>

         <td class="spoc_req">
          No of Days <br><br>  
        </td>
        <td class="spoc_req1">
           <input type="text" name="" ><br><br>
        </td>
    </tr>-->

    
    </table></center>
    

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