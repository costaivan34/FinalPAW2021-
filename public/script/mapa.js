
window.addEventListener("DOMContentLoaded", function () {
  currentPosition();
  
});

function agregarMarcador(longitud,latitud){
  // add markers to map
   // create a HTML element for each feature
   var el = document.createElement('div');
   el.className = 'marker';
   // make a marker for each feature and add to the map
   new mapboxgl.Marker(el,{'color': '#00000F'})
   .setLngLat([longitud, latitud])
   .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
     .setHTML('<h3>' + "marker.properties.title" + '</h3><p>' + "marker.properties.description" + '</p>'))
   .addTo(map);
 }

function cargarMarcadores(ciudad,provincia){
  var xmlHttpRequest=new XMLHttpRequest();
	xmlHttpRequest.onreadystatechange=function() {
		if (xmlHttpRequest.readyState==4 && xmlHttpRequest.status==200) { 
     console.log( xmlHttpRequest.responseText );
      var respuesta =JSON.parse(  xmlHttpRequest.responseText );
      console.log( respuesta );
     //currentPosition(longitud,latitud);
    /*
      for (cat of respuesta) {
        agregarMarcador(longitud,latitud);
      }*/
		}else{
    //  alert("ME CAGO EN LA PUTA");
    }  
	}
  xmlHttpRequest.open("GET","marcadores?&Provincia="+provincia+"&Ciudad="+ciudad,true);
	xmlHttpRequest.send();
	event.preventDefault();
}

function loadmapa(longitud,latitud) {
  mapboxgl.accessToken = 'pk.eyJ1IjoiY29zdGFpdmFuMzQiLCJhIjoiY2treDFvM25yMTd1ZjJ4anVldTA3ZHFpYiJ9.EsQJxJQTd6YbOHyUWcftnw';
  map = new mapboxgl.Map({container: 'mapa',style: 'mapbox://styles/mapbox/light-v10',center: [longitud,latitud],zoom: 13 });
  map.addControl(new mapboxgl.NavigationControl());
  map.addControl(new mapboxgl.FullscreenControl());
  var el = document.createElement('div');
      el.className = 'actualPosition';
      new mapboxgl.Marker(el,{'color': '#00000F'}).setLngLat([longitud,latitud]).addTo(map);
}

function currentPosition(){
  datos= datos.replaceAll('&quot;', '');
  datos= datos.replaceAll('{', '{"');
  datos= datos.replaceAll(',', '","');
  datos= datos.replaceAll(':', '":"');
  datos= datos.replaceAll('}', '"}');
 var respuesta =JSON.parse( datos );
 console.log(respuesta);
 loadmapa(respuesta.longitud,respuesta.latitud);
  // cargarMarcadores(respuesta.ciudad);
    cargarMarcadores('Navarro','Buenos Aires');
  
}

 