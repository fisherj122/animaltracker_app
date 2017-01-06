$(document).ready(function() {
  $("#add_sighting").on("click", function() {
    var latitude = $("#sighting_latitude").val();
    var longitude = $("#sighting_longitude").val();
    var year = $("#sighting_date_1i").val();
    var month = $("#sighting_date_2i").val();
    var day = $("#sighting_date_3i").val();
    var hour = $("#sighting_date_4i").val();
    var minute = $("#sighting_date_5i").val();
    var animal_id = $("#animal_id").val();

  var newSighting = {
    "sighting": {
      "latitude": latitude,
      "longitude": longitude,
      "date": year + "-" + month + "-" + day + "T" + hour + ":" + minute,
      "animal_id": animal_id 
    }
  };
  alert(JSON.stringify(newSighting));
  $.ajax({
     // tell the server that we are talking JSON
     dataType: 'json',
     // tell the server what resource to retrieve
     url: '/sightings',
     // the HTTP method to store information on the server
     method: 'POST',
     // data to be sent. In this case it is the newWine object that was created
     data: newSighting,
     // call this function if call to server was successful
     success: function(dataFromServer) {
       alert("Received message: " + JSON.stringify(dataFromServer));
       $("#sighting_table").append(
         "<tr>" +
          "<td>" + dataFromServer.latitude + "</td>" +
          "<td>" + dataFromServer.longitude + "</td>"+
          "<td>" + dataFromServer.date + "</td>"+
        "</tr>");
     },
     // call this function if call to server was not successful
     error: function(jqXHR, textStatus, errorThrown) {
       alert("Add new wine failed: " + errorThrown);
     }
   });
 });
});
