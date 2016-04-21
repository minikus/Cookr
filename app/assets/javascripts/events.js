$(document).ready(function (){

  var id = $("#eventConfirm").data("id");
  console.log(id);
  var $confirmedText = $("<p></p>").text("Event Is Confirmed").addClass("eventConfirmed");
  var $cancelledText = $("<p></p>").text("Event Is Cancelled").addClass("eventCancelled");
  var $eventCancelButton = $("<button></button>").text("Cancel event").attr("id", "eventCancel");
  var $eventConfirmButton = $("<button></button>").text("Confirm event").attr("id", "eventConfirm");
  $eventCancelButton.attr('data-id', id);
  $eventConfirmButton.attr('data-id', id);


  $('body').on('click', "#eventConfirm", function(){
    $("#eventConfirm").remove();
    $(".eventCancelled").remove();
    $(".eventconfirmations").append($confirmedText);
    $(".eventconfirmations").append($eventCancelButton);
    var eventID = $(this).data("id");
    // console.log(eventID);
    $.ajax({
      method: 'PUT',
      url: '/events/' + eventID + '/confirm',
      data: {
        confirm: true
      }
    });
  });

    $('body').on('click', "#eventCancel", function(){
      $("#eventCancel").remove();
      $(".eventConfirmed").remove();
      $(".eventconfirmations").append($cancelledText);
      $(".eventconfirmations").append($eventConfirmButton);
      var eventID = $(this).data("id");
      console.log(eventID);
      $.ajax({
        method: 'DELETE',
        url: '/events/' + eventID + '/confirm',
        data: {
          confirm: false
        }
      });
      // $('#eventConfirm').show();
      // $(".confirmationText2").hide();
      // $(".confirmationText1").show();
      // $('#eventCancel').hide();

    });

});
