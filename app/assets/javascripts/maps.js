// Map Javascript 
// defenition 
var map;
var first_location = {lat: 34.809006620739176, lng: 135.5614241910291};
var lat_lng;
var lat;
var lng;


//initialaize Map
function initMap () {
  map = new google.maps.Map(document.getElementById('new_map'), {
    center: first_location,
    zoom: 5
  });

  // set marker
  var marker = new google.maps.Marker ({
    position: first_location,
    map: map
  });

  map.addListener('click', function(mapsMouseEvent) {
  // delete current marker
    marker.setMap(null);
    // create new marker
    marker = new google.maps.Marker ({
      position: mapsMouseEvent.latLng,
      map: map
    })
    lat_lng = mapsMouseEvent.latLng;
    // change the center of the map
    map.panTo(lat_lng);
    console.log(lat_lng.toString());
    lat = lat_lng.lat();
    lng = lat_lng.lng();
    document.getElementById('lat').value = lat;
    document.getElementById('lng').value = lng;
  });
}


//submit button click event
$(document).on('turbolinks:load', function () {
  $('#submit_button').on('click', function () {
    var res = confirm('投稿を保存します');
    if (res == true ) {
      return true;
    } else {
      return false;
    }
  });
});
