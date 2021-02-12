function getPlato(pagina,sitio){
	var xmlHttpRequest=new XMLHttpRequest();
	xmlHttpRequest.onreadystatechange=function() {
		if (xmlHttpRequest.readyState==4 && xmlHttpRequest.status==200) {
			var response = xmlHttpRequest.responseText;
			response = response.slice(10);
		//	alert("SALIO BIEN,PEDI pagina="+pagina+"DEL SITIO="+sitio);
			var respuesta = JSON.parse( response );
			console.log(response);
			
		
			//ARMAR PLATOS
			//ARMAR PAGINACION
			
			/*<div class="fila">
          {% for A in 1..4 %}
          {% for N in datos.PlatosPag1 %}
            <div class="plato">
              <button onclick="openModal()" id="boton-modal" class="carta">
                <section>
                  <img src="{{ N.path }}" alt="Denim Jeans" >
                </section>
                <section class="plato-text">
                  <h3>{{ N.nombre }}</h3>
                </section>
              </button>
            </div>
          {% endfor %}
          {% endfor %}
        </div>
			*/
		}
	}
	xmlHttpRequest.open("GET","platos?Sitio="+sitio+"&platopage="+pagina,true);
	xmlHttpRequest.send();

	event.preventDefault(); 
}

function getComentario(pagina,sitio){
	var xmlHttpRequest=new XMLHttpRequest();
	xmlHttpRequest.onreadystatechange=function() {
		if (xmlHttpRequest.readyState==4 && xmlHttpRequest.status==200) {
			var response = xmlHttpRequest.responseText;
			response = response.slice(10);
		//	alert("SALIO BIEN,PEDI pagina="+pagina+"DEL SITIO="+sitio);
			var respuesta = JSON.parse( response );
			console.log(response);
			
		
			//ARMAR PLATOS
			//ARMAR PAGINACION
			
			/*<div class="fila">
          {% for A in 1..4 %}
          {% for N in datos.PlatosPag1 %}
            <div class="plato">
              <button onclick="openModal()" id="boton-modal" class="carta">
                <section>
                  <img src="{{ N.path }}" alt="Denim Jeans" >
                </section>
                <section class="plato-text">
                  <h3>{{ N.nombre }}</h3>
                </section>
              </button>
            </div>
          {% endfor %}
          {% endfor %}
        </div>
			*/
		}
	}
	xmlHttpRequest.open("GET","platos?Sitio="+sitio+"&platopage="+pagina,true);
	xmlHttpRequest.send();

	event.preventDefault(); 
}


function openModal() {
  document.getElementById('plato').style.display='block';
	
}

function closeModal() {
  document.getElementById('plato').style.display='none';

}


