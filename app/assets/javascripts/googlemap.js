var handler = Gmaps.build('Google');

function initialize() {
  handler.buildMap({ internal: {id: 'map'} }, function(){
    if(navigator.map)
      navigator.map.getCurrentPosition(displayOnMap);
  });
}


function gmap_show(event) {
  if ((event.lat == null) || (event.long == null)) {
    return 0;
  }
  console.log(event)
  var marker = handler.addMarkers([
      {
        "lat": event.lat,
        "lng": event.long,
        "picture": {
          "url": 'map_icon.ico',
          "width":  32,
          "height": 32
        },
        "infowindow": "<b>" + event.name + ": " + event.place + ". "
      }
  ]);
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
  handler.getMap().setZoom(12);
}








