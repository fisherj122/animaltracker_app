$(document).ready(function() {
  $("#create_animal").on("click",function() {
    var common = $("#animal_common_name").val();
    var latin = $("#animal_latin_name").val();
    var kingdom = $("#animal_kingdom").val();
    alert(kingdom);

    var newAnimal = {
      "animal": {
        "latin_name": latin,
        "common_name": common,
        "kingdom": kingdom
      }
    };

    alert(JSON.stringify(newAnimal));
    $.ajax({
       // tell the server that we are talking JSON
       dataType: 'json',
       // tell the server what resource to retrieve
       url: '/animals',
       // the HTTP method to store information on the server
       method: 'POST',
       // data to be sent. In this case it is the newWine object that was created
       data: newAnimal,
       // call this function if call to server was successful
       success: function(dataFromServer) {
         alert("Received message: " + JSON.stringify(dataFromServer));
         $("#animal_table").append(
           "<tr>" +
            "<td>" + dataFromServer.common_name + "</td>" +
            "<td>" + dataFromServer.latin_name + "</td>"+
            "<td>" + dataFromServer.kingdom + "</td>"+
          "</tr>");
       },
       // call this function if call to server was not successful
       error: function(jqXHR, textStatus, errorThrown) {
         alert("Add new wine failed: " + errorThrown);
       }
     });// end ajax
  });
}); //end of document ready
