$(function() {
  $.getJSON("/welcome.json", function(dataset) {   
    dataset.forEach(function(data) {
      $('#list').prepend('<h4><a href="/itineraries/' + data.id + '">' + data.trip_title + " (" + data.datestart + ")" + " by: " + data.users[0].firstname + " " + data.users[0].lastname + '</h4><br>')
    });
  });
});

$(function() {
  $(".js-sort").on('click', function() {
    $.getJSON("/welcome.json", function(dataset) {
      const sortedData = dataset.sort((a,b) => a.datestart.localeCompare(b.datestart))
      $("#list").empty();
      sortedData.forEach(function(data) {
        $('#list').append('<h4><a href="/itineraries/' + data.id + '">' + data.trip_title + " (" + data.datestart + ")" + " by: " + data.users[0].firstname + " " + data.users[0].lastname + '</h4><br>')
      });
    });
  });
});
