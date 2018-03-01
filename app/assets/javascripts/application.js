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

function User(data) {
  this.id = data.id
  this.firstname = data.firstname;
  this.itineraries = data.itineraries;
}

User.prototype.userDisplay = function() {
  var html = "";
  $(".tripsList").empty();

  for(i=0; i<this.itineraries.length;i++){
    html += `<h4><a href="/itineraries/${this.itineraries[i].id}">${this.itineraries[i].datestart} - ${this.itineraries[i].trip_title} </h4></a><br>`;
  }
 
  $(".js-next").attr("data-id", this.id);
  $(".tripsHeader").text(`${this.firstname}'s Trips`);
  $(".tripsList").append(html);
}



$(function() {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.getJSON(`/users/` + nextId + ".json", function(data) {
      var user = new User(data);
      user.userDisplay();
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