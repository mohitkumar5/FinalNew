<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
    <%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

 <link href="resources/css/style.css" rel="stylesheet" >
</head>
<body>

<div class="header">
  <h1>Atos | Syntel</h1>
</div>

<div class="row" >
  <div class="col-3 col-s-3 menu" >
   <ul>
      <a href="operations.jsp" style="text-decoration: none;" onclick="myDashboardFunction()"><li style="list-style: none;">Dashboard</li></a>
     <a href="pm_req.jsp" style="text-decoration: none;" onclick="myTrainingFunction()"> <li style="list-style: none;">Training Request</li></a>
      <!--<li id="vendor" onclick="myVendorFunction()">Request Vendor</li>-->
      <li id="notification" onclick="myNoticeFunction()">Notifications</li>
      <a href="login.jsp" style="text-decoration: none;" onclick="return sureFun()"><li style="list-style: none;">Log Out </li> </a>
    </ul>
  </div>
<form name="p" method="GET" action="p">
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
		ArrayList al = (ArrayList)request.getAttribute("data");
    	//ArrayList al = (ArrayList)request.getAttribute("data");
			System.out.println("data := "+al);
			//int[] a=new int[al.size()];	
			int count =(Integer) al.get(0);
			if(count > 0)
			{
    	
    %>
<div class="col-9 col-s-9" >
<h2>Request</h2>

    <table style="padding-bottom: 3px;">
     
        <tr>
        <br>
        
        <td class="spoc_req">
          Request ID
        </td>
        <td class="spoc_req1">
           <input type="text" name="reqid"  value="<%=al.get(12)%>"><br><br>
        </td>

      </tr>
       
      <tr>
        <br>
        <td class="spoc_req">
          Domain
        </td>
        <td class="spoc_req1">
           <input type="text" name="domain" value="<%=al.get(13)%>"><br><br>
        </td>

      </tr>

    <tr>
        <br>
        <td class="spoc_req">
         Suggested Trainer 
        </td>
        <td class="spoc_req1">
           <input type="text" name="train1" value="<%=al.get(14)%>"><br><br>
        </td>

      </tr>

      

    <tr>
        <td class="spoc_req">
         Training Start Date <br><br>  
        </td>
        <td class="spoc_req1">
           <input type="text" name="st1" value="<%=al.get(15)%>"><br><br>
        </td>
    </tr>

    <tr>

         <td class="spoc_req">
           Training End Date <br><br>  
        </td>
        <td class="spoc_req1">
           <input type="text" name="ed1" value="<%=al.get(16)%>"><br><br>
        </td>

    </tr>
    <tr>

         <td class="spoc_req">
           Requested Date <br><br>  
        </td>
        <td class="spoc_req1">
           <input type="text" name="ed1" value="<%=al.get(17)%>"><br><br>
        </td>

    </tr>
    
    <tr>
            <td class="spoc_req">
           No of Trainee  
        </td>
         <td class="spoc_req1">
           <input type="text" name="noft" value="<%=al.get(19)%>" ><br><br>
        </td>
      </tr>
    

    <tr>
            <td class="spoc_req">
         Training type  
        </td>
         <td class="spoc_req1">
           <input type="text" name="noft" value="<%=al.get(20)%>" ><br><br>
        </td>
      </tr>
      
   <tr>
     <td class="spoc_req">
        City
     </td>
      <td class="spoc_req1">
        <input type="text" name="city" value="<%=al.get(21)%>" ><br><br>
     </td>
   </tr>
  
</table>     
 <nav><div class="col-9 col-s-9" style="border-right: 300px; margin-left: 770px; margin-top: -665.5px;">

<h2>Spoc Response</h2> 
    
    <table style="padding-bottom: 3px;">
      <tr>
        <tr>
        <br>
        <td class="spoc_req">
          Request ID
        </td>
        <td class="spoc_req1">
           <input type="text" name="" value="<%=al.get(2)%>"><br><br>
        </td>

      </tr>
       
      <tr>
 		<td class="spoc_req">
          Domain
        </td>
         <td class="spoc_req1">
           <input type="text" name="" value="<%=al.get(3)%>" ><br><br>
        </td>
      </tr>


    <tr>
        <td class="spoc_req">
         Trainer ID<br><br>  
        </td>
         <td class="spoc_req1">
           <input type="text" name="" value="<%=al.get(4)%>"><br><br>
        </td>
    </tr>

    <tr>
        <br>
        <td class="spoc_req">
         Trainer Name 
        </td>
        <td class="spoc_req1">
           <input type="text" name="t_name" value="<%=al.get(5)%>"><br><br>
        </td>

      </tr>

      <tr>
        <td class="spoc_req">
           No of Trainee  
        </td>
         <td class="spoc_req1">
           <input type="text" name="" value="<%=al.get(6)%>"><br><br>
        </td>
      </tr>


    <tr>
        <td class="spoc_req">
         Training Start Date <br><br>  
        </td>
        <td class="spoc_req1">
           <input type="text" name="" value="<%=al.get(7)%>"><br><br>
        </td>
    </tr>

    <tr>

         <td class="spoc_req">
           Training End Date <br><br>  
        </td>
        <td class="spoc_req1">
           <input type="text" name="" value="<%=al.get(8)%>"><br><br>
        </td>

    </tr>

    <tr>
         <td class="spoc_req">
          Room<br><br>  
        </td>
        <td class="spoc_req1">
           <input type="text" name="t_type" value="<%=al.get(9)%>"><br><br>
        </td>
    </tr>

    <tr>
        <td class="spoc_req">
           City
        </td>
         <td class="spoc_req1">
           <input type="text" name="t_city" value="<%=al.get(10)%>"><br><br>
        </td>
        
        
        
<%
			}
			else
			{
				
		

%>
			<br><br><br><br><br><br><br><br><br><br><br><br>
			<tr>
         		<td><center><h1>Yet to get the Respose From SPOC..!</h1></center></td>
    		</tr>
		<%
			}
		
		%>


          
      </tr>
      
    <!--<tr>

         <td class="spoc_req">
          No of Days <br><br>  
        </td>
        <td class="spoc_req1">
           <input type="text" name="" ><br><br>
        </td>
    </tr>-->

    
    </table>
   
    
  	</div>
  </div>
  </nav><div class="col-9 col-s-9" style="border-right: 300px; margin-left: 770px; margin-top: -665.5px;">
 
</div>



<!-- <div class="footer fixed-bottom bg-primary" >
  <p>Resize the browser window to see how the content respond to the resizing.</p>
</div> -->




       
   </tr>
    
    <!--<tr>

         <td class="spoc_req">
          No of Days <br><br>  
        </td>
        <td class="spoc_req1">
           <input type="text" name="" ><br><br>
        </td>
    </tr>-->

    
    </table>
   <!--  <center><input type="submit" name="Response" value="Check Spoc Response" class="btn btn-primary"></center> -->
   

  </div>
  <center><input type="submit" class="btn btn-primary"></center>
 
 </form>
</body>
</html>