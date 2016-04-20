$(document).ready(function (){

  $("#eventConfirm").on("click", function(){
    var eventID = $(this).attr("data");
    console.log(eventID);
    $.ajax({
      method: 'PUT',
      url: '/events/' + eventID + '/confirm',
      data: {
        confirm: true
      }
    });
  });

    $("#eventCancel").on("click", function(){
      var eventID = $(this).attr("data");
      console.log(eventID);
      $.ajax({
        method: 'DELETE',
        url: '/events/' + eventID + '/confirm',
        data: {
          confirm: false
        }
      });
    });

});
