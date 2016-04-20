$(document).ready(function (){

  $('#eventCancel').hide();
  $(".confirmationEvent").hide();
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
    $('#eventConfirm').hide();
    $(".confirmationEvent").show();
    $('#eventCancel').show();

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
      $('#eventConfirm').show();
      $(".confirmationEvent").hide();
      $('#eventCancel').hide();
    });

});
