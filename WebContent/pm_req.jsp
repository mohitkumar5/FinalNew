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
        
         <script type="text/javascript">
   
          $(document).ready(function() {
            var dateInput = $('input[name="date"]'); 
          dateInput.datepicker({
          todayHighlight: true,
          autoclose: true,
          startDate: truncateDate(new Date()) // <-- THIS WORKS
        });
        $('#start').datepicker('setStartDate', truncateDate(new Date()));
         $('#end').datepicker('setStartDate', truncateDate(new Date()));
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

  button
  {



  }
</style>
<div class="col-9 col-s-9" style="" id="d1">
<h2>Request</h2>
<form name="request" method="GET" action="reqcheck">
    <table style="padding-bottom: 3px;">
      
        <tr>
        <br>
        <td class="spoc_req">
          Domain: 
        </td>
        <td class="spoc_req1">
          <div class="input-group">
              <div class="rs-select2 js-select-simple select--no-search">
                 
                      <select name="domain" id="domain ">
                      <option disabled="disabled" selected="selected">Technology</option>
                      <option value=".NET">.NET</option>
                      <option value="Java">Java</option>
                      <option value="Machine Learning">Machine Learning</option>
                      <option value="Data Analytics">Data Analytics</option>
                      <option value="Angular">Angular</option>
                  </select>
                  <div class="select-dropdown"></div>
              </div>
          </div>
      </td>

      </tr>
    

      
<tr>
        <td class="spoc_req">
         Training Start Date:<br><br>  
        </td>
        <td>
        <div class="input-group">
            <input class="input--style-1 js-datepicker" type="text" placeholder="Start Date" name="start">
            
        </div>
        </td>
    </tr>

<tr>
        <br>
        <td class="spoc_req">
         Training End Date
        </td>
        <td class="spoc_req1">
            
                <div class="input-group">
                    <input class="input--style-1 js-datepicker" type="text" placeholder="End Date" name="end">
                    
                </div>
                
        </td>

</tr>
<tr>
         <td class="spoc_req">
          Number of Trainee:
        </td>
        <td class="spoc_req1">
        <div class="input-group">
                <input  type="number" placeholder="Number of Employees" name="noemp">
                                    
         </div>
         </td>
</tr>
      
<tr>
            <td class="spoc_req">
          Suggested Trainer
        </td>
         <td class="spoc_req1">
            <div class="input-group">
                
                <input type="text" name="sgtrain" placeholder="Suggest Trainer">
            </div>
        </td>  
</tr>
    
<tr>
          <br>
      <td class="spoc_req">
          Training Type:
          </td>
          <td class="spoc_req1">
              <div class="input-group">
                  <div class="rs-select2 js-select-simple select--no-search">
                      <select name="ttype" id="ttype">
                          <option disabled="disabled" selected="selected">...Select...</option>
                          <option value="classroom">Classroom</option>
                          <option value="online">Online</option>
                      </select>
                      <div class="select-dropdown"></div>
                  </div>
              </div>
          </td>
</tr>
     
<tr>
            <td class="spoc_req">
               City
            </td>
             <td class="spoc_req1">
                <div class="input-group">
                  <div class="rs-select2 js-select-simple select--no-search">
               <select name="city" id="city">
                 <option disabled="disabled" selected="selected">Select City</option>
                 <option value="pune">Pune</option>
                 <option value="mumbai">Mumbai</option>
                 <option value="chennai">Chennai</option>
                 <option value="tirunevelli">Tirunevelli</option>
             </select>
             <div class="select-dropdown"></div>
            </div>
          </div>
            </td>
</tr>


<!--  <tr>
        <br>
        <td class="spoc_req">
        Status: 
        </td>
        <td class="spoc_req1">
            <div class="input-group">
                <div class="rs-select2 js-select-simple select--no-search">
                    <select name="vertical" id="dom">
                        <option disabled="disabled" selected="selected">Select Status</option>
                        <option value="1">Request</option>
                        <option value="2">Started</option>
                        <option value="3">Completed</option>
                        
                    </select>
                    <div class="select-dropdown"></div>
                </div>
            </div>
        </td>

</tr>-->

      
    </table>
    <center><input type="submit" name="sendrequest" value="Send Request" class="btn btn-primary"></center>
    
</form>

  </div>
  

  </div>
</div>
</nav>

<!-- <div class="footer fixed-bottom bg-primary" >
  <p>Resize the browser window to see how the content respond to the resizing.</p>
</div> -->

</body>
</html>