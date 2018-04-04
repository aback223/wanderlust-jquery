function User (data) {
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