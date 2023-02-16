var data = document.getElementById("usertype");
var btn = document.getElementById('form-btn')
var doctor="doctor";
var user = "user";

function usertype(){
    const dataVal = data.value;
    if(dataVal==doctor){
        location.assign("doctorSignUp.html");
    }
    else if(dataVal == user){
        location.assign("userSignUp.html");
    }
}
