// Map Javascript 
// defenition 
var map;
var myLocation = {lat: 34.809006620739176, lng: 135.5614241910291};
var lat_lng;
var lat;
var lng;

//initialaize Mao
function initMap() {
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
    document.getElementById('lat').textContent = lat;
    document.getElementById('lng').textContent = lng;
  });
}

// Ajax function 
$(document).on('turbolinks:load', function(){ // first load turbolinks to avoid error
  $(function (){
    $('#submit_button').click(function(e){
      e.preventDefault();
      var input = $('#content').val();
      $.ajax({
        type: 'POST',
        url: '/maps/create',
        dataType: 'html',
        processData: false,
        contentType: false,
        data:{
          latitude: lat,
          longitude: lng,
          content: input
        }
      })
      .done(function(){
        alert('sucess'),
        console.log(input);
      })
      .fail(function(){
        alert('fail')
      })
    })
  })
})
