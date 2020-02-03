<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link href="resources/css/style.css" rel="stylesheet">
 <script type="text/javascript" src="style.js"></script>
 <!--link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" /-->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.5/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.min.js"></script>
        
        <link href="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/css/tether.min.css" rel="stylesheet"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.min.css" rel="stylesheet"/>
        
      <script src="bootstrap.min.js"></script>
      <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        

</head>
<body>
<div class="header">
  <h1>Atos | Syntel</h1>
</div>

<div class="row" style="">
  <div class="col-3 col-s-3 menu" style="">
    <ul>
      <a href="operations.jsp" style="text-decoration: none;" onclick="myDashboardFunction()"><li style="list-style: none;">Dashboard</li></a>
     <a href="pm_req.jsp" style="text-decoration: none;" onclick="myTrainingFunction()"> <li style="list-style: none;">Training Request</li></a>
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

  
  tr
  {
   height: 30px;

  }
  
</style>
<div class="col-9 col-s-9" style="" id="d1">
        
        <table style="padding-bottom: 3px; width: 80%">
                <tr>
                        <br>
                        <td class="spoc_req1">
                         <!--   <div class="input-group">
                                <a href ="pm_req.jsp"><button>Request</button>
                            </div>
                             --> 
                            
                          <form action="pm_req.jsp" method="post">
                        <div class="col-sm-9">
       					<div class="card" style="text-align: center;">
            				<h3 class="card-header">Request</h3>
               				<div class="card-body">
                 			<input type="submit" name="request" value="Explore" class="btn btn-primary">
               				</div>
        				</div>
    					 </div>
                          </form>
                             
                        </td>
                        <td>
                        <form action="PmInfo1" method="post">
                        <div class="col-sm-9">
       					<div class="card" style="text-align: center;">
            				<h3 class="card-header">View</h3>
               				<div class="card-body">
                 			<input type="submit" name="view" value="Explore" class="btn btn-primary">
               				</div>
        				</div>
    					 </div>
                          </form>
                         </td>
                    </tr>
                    
               
</table>
               
                        
</div>



<!-- <div class="footer fixed-bottom bg-primary" >
  <p>Resize the browser window to see how the content respond to the resizing.</p>
</div> -->
</body>
</html>