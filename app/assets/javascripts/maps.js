// Map Javascript 
// defenition 
var map;
var myLocation = {lat: 34.809006620739176, lng: 135.5614241910291};
var lat_lng;
var lat;
var lng;
var map2;


//initialaize Map
function initMap () {
  map = new google.maps.Map(document.getElementById('new_map'), {
    center: myLocation,
    zoom: 5
  });

  // set marker
  var marker = new google.maps.Marker ({
    position: myLocation,
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
    alert('Your information will be saved');
  });
});

//delete button on mypage click event
$(document).on('turbolinks:load', function () {
  $('#delete_button').on('click', function () {
    alert('Are you sure?');
  });
});

//delete button on infowindow click event
$(document).on('turbolinks:load', function () {
  $('#hoge').on('click', function () {
    concole.log('delete');
    alert('Are you sure?');
  });
});

