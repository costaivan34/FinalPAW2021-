
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
				const mensaje = document.getElementById("messageBoxId");
				mensaje.innerHTML = `<div class="alert alert-success" role="alert">
				Bienvenido!</div>`; 
				setTimeout(function(){ mensaje.innerHTML = "" }, 2500);
			} else {
				const mensaje = document.getElementById("messageBoxId");
      	mensaje.innerHTML = `<div class="alert alert-danger" role="alert">
      	El nombre de usuario y la contraseña que ingresaste no coinciden con nuestros registros. Por favor, revisa e inténtalo de nuevo.
    		</div>`;
				setTimeout(function(){ mensaje.innerHTML = "" }, 2500);
			}
		}else{
			const mensaje = document.getElementById("messageBoxId");
      	mensaje.innerHTML = `<div class="alert alert-danger" role="alert">
      	El nombre de usuario y la contraseña que ingresaste no coinciden con nuestros registros. Por favor, revisa e inténtalo de nuevo.
    		</div>`;
				setTimeout(function(){ mensaje.innerHTML = "" }, 2500);
		}
	}

	var mail = document.getElementById("userName").value;
var psw = document.getElementById("password").value;
xmlHttpRequest.open("POST","login",true);
xmlHttpRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xmlHttpRequest.send("userName="+mail+"&password="+psw);
event.preventDefault();
}

