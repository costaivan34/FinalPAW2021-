

window.addEventListener("DOMContentLoaded", function () {
 
});



function loadmapa(longitud,latitud) {
  mapboxgl.accessToken = 'pk.eyJ1IjoiY29zdGFpdmFuMzQiLCJhIjoiY2treDFvM25yMTd1ZjJ4anVldTA3ZHFpYiJ9.EsQJxJQTd6YbOHyUWcftnw';
  map = new mapboxgl.Map({container: 'mapa',style: 'mapbox://styles/mapbox/streets-v11',center: [longitud,latitud],zoom: 15 });
  map.addControl(new mapboxgl.NavigationControl());
  var marker = new mapboxgl.Marker().setLngLat([longitud, latitud]).addTo(map);
}



self.mapview.on('render', function() {
  self.mapview.resize();
});  