// Uber API Constants
var uberClientId = "27WppfdE8d3ASHHTaxX014F7WflOXVR1"
  , uberServerToken = "hpXMY2vyJ-JMnHQcaWTSD1su_3yXQ1o2gs3rbUFQ";

// Create variables to store latitude and longitude
var userLatitude
  , userLongitude
  , destLatitude = 37.796423
  , destLongitude = 144.961260;

navigator.geolocation.watchPosition(function(position) {
    console.log(position);

    // Update latitude and longitude
    userLatitude = position.coords.latitude;
    userLongitude = position.coords.longitude;

  // Query Uber API if needed
    getEstimatesForUserLocation(userLatitude, userLongitude);
});

function getEstimatesForUserLocation(latitude,longitude) {
  $.ajax({
    url: "https://api.uber.com/v1/estimates/price",
    headers: {
        Authorization: "Token " + uberServerToken
    },
    data: {
      start_latitude: latitude,
      start_longitude: longitude,
      end_latitude: destLatitude,
      end_longitude: destLongitude
    },
    success: function(result) {
      console.log(result);
      var data = result["prices"];
      if (typeof data != typeof undefined) {
        // Sort Uber products by time to the user's location
        data.sort(function(t0, t1) {
          return t0.duration - t1.duration;
        });

        // Update the Uber button with the shortest time
        var shortest = data[0];
        if (typeof shortest != typeof undefined) {
          console.log("Updating time estimate...");
          $("#uber-text").html("IN " + Math.ceil(shortest.duration / 60.0) + " MIN");
        }
      }
    }
  });
}

$("a#uber-button-text").click(function(event){
  // Redirect to Uber API via deep-linking to the mobile web-app
  var uberURL = "https://m.uber.com/sign-up?";

  // Add parameters
  uberURL += "client_id=" + uberClientId;
  if (typeof userLatitude != typeof undefined) uberURL += "&" + "pickup_latitude=" + userLatitude;
  if (typeof userLongitude != typeof undefined) uberURL += "&" + "pickup_longitude=" + userLongitude;
  uberURL += "&" + "dropoff_latitude=" + partyLatitude;
  uberURL += "&" + "dropoff_longitude=" + partyLongitude;
  uberURL += "&" + "dropoff_nickname=" + "Thinkful";

  // Redirect to Uber
  window.location.href = uberURL;
});