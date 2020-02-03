/**
 * 
 */


function myDashboardFunction() {
    var x = document.getElementById("dash1");
    var not = document.getElementById("notice1");

    if(not.style.display === "none"){
        not.style.display="none";
        if (x.style.display === "none") {
            x.style.display = "block";
        } else {
            x.style.display = "none";
        }  
    }
    else{
    	not.style.display="none";
        if (x.style.display === "none") {
            x.style.display = "block";
        } else {
            x.style.display = "none";
        }
    }

}
function myNoticeFunction() {

    var x = document.getElementById("notice1");
    var dash = document.getElementById("dash1");
    
    if(dash.style.display === "none"){
        dash.style.display="none";
        if (x.style.display === "none") {
            x.style.display = "block";
        } else {
            x.style.display = "none";
        }
    }
    else{
    	dash.style.display="none";
        if (x.style.display === "none") {
            x.style.display = "block";
        } else {
            x.style.display = "none";
        }
    }
}
function sureFun(){
    var l = confirm("Do you want to logout ?");
    if(l==true){
        console.log("true");
    }
    else{
        return false;
    }
}