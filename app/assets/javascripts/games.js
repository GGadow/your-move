//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  setTimeout(function() {
    var pathArray = window.location.pathname.split( '/' );
    if (pathArray[1] == 'games') {
      url = '/games/' + pathArray[2] + '/notification';
      var source = new EventSource(url);
      source.addEventListener('refresh', function(e) {
        source.close();
        window.location.reload();
      });
    }
  }, 1);
});
