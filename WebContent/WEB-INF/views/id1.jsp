<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link href="resources/css/style.css" rel="stylesheet" >
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
<div class="header">
  <h1>Atos | Syntel</h1>
</div>

        <div class="container">
            <div class="row">
                <div class="col-5">
                    
                </div>
                <div class="col-2 menu">
                    <ul>
                        
                    </ul>
                </div>
                <div class="col-5">

                </div>
            </div>
        </div>
<div class="row1">
  <div class="col-3 col-s-3 menu">
    <ul>
      <li> Dashboard </li>
      <li> Training Requests  </li>
      <li> Availablity </li>
      <li> Notifications </li>
      <a href="Login.jsp" style="text-decoration: none;" onclick="return sureFun()"><li style="list-style: none;">Log Out </li> </a>
    </ul>
  </div>
 
  
 <table style="padding-bottom: 3px; width: 80%">
  <tr>
      
<%
		ArrayList<String> al = (ArrayList<String>)request.getAttribute("data2");
  		System.out.println("data := "+al);
  		
  		for(String tech:al)
  		{
  			
  			System.out.println("This is the Distinct Courses"+al);
  		 
  		
 %>
 
  
    <td class="spoc_req1">                           
                        
 <div class="col-9 col-s-9" style="" id="d1">
        
       
                        <div class="col-sm-4">
       					<div class="card" style="text-align: center;">    
     <h3 class="card-header"><%=tech%></h3>
        <div class="card-body">
       
         <form action="Info" method="post">
        	<input type="text" name="tewchno" value="<%=tech%>" hidden>
          <input type="submit" value="Explore" class="btn btn-primary">
          </form>
          </td>
          
          </tr>
          </div>
        </div>
        
        </div>
        </table>
    </div>
    <%} %>
    </div>
</div>
 
 
 

<div class="footer fixed-bottom bg-primary" >
 
</div>

</body>
</html>