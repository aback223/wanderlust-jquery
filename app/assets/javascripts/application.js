// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

//Click next to see next user and links to their itineraries

 $(function() {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.getJSON(`/users/` + nextId + ".json", function(data) {
      $(".tripsHeader").text(`${data["firstname"]}'s Trips`);
      $(".js-next").attr("data-id", data["id"]);
      $(".tripsList").empty()
      for (i=0; i < data["itineraries"].length; i++) {
        $(".tripsList").append(
          `
          <h4>
          <a href="/itineraries/${data["itineraries"][i]["id"]}">${data["itineraries"][i]["datestart"]} - ${data["itineraries"][i]["trip_title"]}</a>
          </h4><br>
          `
        )
      }
    });
  });
});


// Renders index (welcome) page and lists all itineraries
$(function() {
  $.getJSON("/welcome.json", function(dataset) {
    $.each(dataset, function(k, v) {
      $.each(v["users"], function(a,b) {
        $('#list').prepend('<h4><a href="/itineraries/' + v["id"] + '">' + v["trip_title"] + " by: " + b["firstname"] + " " + b["lastname"] + '</h4><br>');
      })
    });
  });
});