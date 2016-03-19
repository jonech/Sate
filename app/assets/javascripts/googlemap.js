
function initMap(event) {
  console.log(event);
  if ((event.lat == null) || (event.long == null)) {
    return 0;
  }
  console.log(event);
  var handler = Gmaps.build('Google');
  handler.buildMap({ internal: {id: 'map'} }, function(){
    markers = handler.addMarkers([    // put marker method
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
  });
}
// google.maps.event.addDomListener(window, "load", initialize);

// function gmap_show(event) {
//   if ((event.lat == null) || (event.lng == null)) {
//     return 0;
//   }
//   handler = Gmaps.build('Google');
//   handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
//     markers = handler.addMarkers([    // put marker method
//       {
//         "lat": company.lat,
//         "lng": company.lng,
//         "picture": {
//           "url": 'map_icon.ico',
//           "width":  32,
//           "height": 32
//         },
//         "infowindow": "<b>" + event.name + ": " + event.place + ". "
//       }
//     ]);
//     handler.bounds.extendWith(markers);
//     handler.fitMapToBounds();
//     handler.getMap().setZoom(12);    // set the default zoom of the map
//   });
// }


// function initialize(event) {
//   var handler = Gmaps.build('Google');
//   handler.buildMap({ internal: {id: 'map'} }, function(){
//     if ((event.lat == null) || (event.long == null)) {
//       return 0;
//     }
//     console.log(event)
//     var marker = handler.addMarkers([
//         {
//           "lat": event.lat,
//           "lng": event.long,
//           "picture": {
//             "url": 'map_icon.ico',
//             "width":  32,
//             "height": 32
//           },
//           "infowindow": "<b>" + event.name + ": " + event.place + ". "
//         }
//     ]);
//     handler.bounds.extendWith(markers);
//     handler.fitMapToBounds();
//     handler.getMap().setZoom(12);
//   });
// }






