
function openLoginModal() {
  document.getElementById('id01').style.display='block';
}

function closeLoginModal() {
  document.getElementById('id01').style.display='none';
}

function callLogin(){
	var xmlHttpRequest=new XMLHttpRequest();
	var userName = document.getElementById("userName").value;
	var password = document.getElementById("password").value;
	xmlHttpRequest.onreadystatechange=function() {
		console.log(xmlHttpRequest);
		if (xmlHttpRequest.readyState==4 && xmlHttpRequest.status==200) {
			var response = xmlHttpRequest.responseText;
			if(xmlHttpRequest.responseText == 1) {
				var welcome_message = '<p class="welcome-message">Welcome, You have successfully loggedin!</p>';
				document.getElementById("container").innerHTML = welcome_message;
			} else {
				document.getElementById("messageBoxId").innerHTML="Invalid Credentials";
				document.getElementById("messageBoxId").className="error-message";
			}
		}else{
			document.getElementById("messageBoxId").innerHTML="Invalid Credentials";
			document.getElementById("messageBoxId").className="error-message";
		}
	}
	xmlHttpRequest.open("POST","login",true);
	xmlHttpRequest.send();

	event.preventDefault(); 
}

