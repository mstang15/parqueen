// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
// = require_tree .

function getCurbLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showCurbPosition);
  }
  else {
    var loc = "0,0";
    window.location.href=`/parking?location=${loc}`;
  }
}

function showCurbPosition(position) {
  var lat = position['coords']['latitude'];
  var lon = position['coords']['longitude'];
  var url = "/api/v1/parking?" + "latitude="+ lat + "&longitude=" + lon;
  fetch(url).then(response => response.json()).then((response) => {this.printCurbDetails(response)});
}

function printCurbDetails(response) {
  if (response['no_curbs_reason']) {
    document.getElementById("spot_info").innerHTML = (response['no_curbs_reason'])
  }
  else if (response['features'][0]['properties']['uses']['use'] === 'park') {
    document.getElementById("spot_info").innerHTML = "You parked on the "
    + (response['features'][0]['properties']['metadata']['side_of_street'])
    + " side of "
    + (response['features'][0]['properties']['metadata']['street_name'])
    + " between "
    + (response['features'][0]['properties']['metadata']['start_street_name'])
    + " and "
    + (response['features'][0]['properties']['metadata']['end_street_name'])}
  else if (response){
    document.getElementById("spot_info").innerHTML = 'YOU CANNOT LEGALLY PARK HERE!';
  }
}
