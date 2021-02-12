
function loadmapa(longitud,latitud) {
  mapboxgl.accessToken = 'pk.eyJ1IjoiY29zdGFpdmFuMzQiLCJhIjoiY2treDFvM25yMTd1ZjJ4anVldTA3ZHFpYiJ9.EsQJxJQTd6YbOHyUWcftnw';
  map = new mapboxgl.Map({container: 'mapa',style: 'mapbox://styles/mapbox/streets-v11',center: [longitud,latitud],zoom: 15 });
  map.addControl(new mapboxgl.NavigationControl());
  var marker = new mapboxgl.Marker().setLngLat([longitud, latitud]).addTo(map);
}


function openTab(evt, Name) {
  // Declare all variables
  var i, tabcontent, tablinks;

  // Get all elements with class="tabcontent" and hide them
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }

  // Get all elements with class="tablinks" and remove the class "active"
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }

  // Show the current tab, and add an "active" class to the link that opened the tab
  document.getElementById(Name).style.display = "block";
  evt.currentTarget.className += " active";
  if(Name=="Ubicacion"){
    loadmapa(longitud,latitud);
  }
  if(Name=="Platos"){

    getPlato(1,sitio);
  }
  
}
