
function initMap(event) {
  console.log(event);
  // var temp = event["attributes"];
  // console.log(temp);
  var latitude = event.lat;
  var longitude = event.long;
  var myLatLng = {lat: latitude, lng: longitude};

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 12,
    center: myLatLng
  });

  var infowindow = new google.maps.InfoWindow({
    content: "<p>Find us here!</p>"
  });

  var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    title: 'Find me here',
    animation: google.maps.Animation.DROP,
  });
  infowindow.open(map, marker);
  marker.setAnimation(google.maps.Animation.BOUNCE);


  // var handler = Gmaps.build('Google', null);
  // handler.buildMap({ internal: {id: 'map'} }, function(){
  //   var latitude = event.lat;
  //   var longitude = event.long;
  //   if ((lat == null) || (lng == null)) {
  //     lat = -37.814509
  //     lng = 144.963289
  //   }
  //   console.log(lat, lng);
  //   markers = handler.addMarkers([    // put marker method
  //     {
  //       "lat": lat,
  //       "lng": lng,
  //       "picture": {
  //         "url": 'map_icon.ico',
  //         "width":  32,
  //         "height": 32
  //       },
  //       "infowindow": "<b>" + temp.name + ": " + temp.place + ". "
  //     }
  //   ]);
  //   handler.bounds.extendWith(markers);
  //   handler.fitMapToBounds();
  //   handler.getMap().setZoom(12);
  // });
}





