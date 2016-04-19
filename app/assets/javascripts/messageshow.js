$(document).ready(function () {
  var current_user = 0;
  var users = [];
  var messages = [];
  var relevantMessages = [];

  //get current user id, call this function to kick it off
  var getUserId = function () {
    $.ajax('/current_user').done(function(result) {
      current_user = result.user.id;
    }).done(function (){
      getAllUsers();
    });
  };

  //get all users
  var getAllUsers = function () {
    $.ajax('/get_users').done(function(result) {
      users = result.users;
    }).done(function () {
      getAllMessages();
    });
  };

  // get all messages
  var getAllMessages = function () {
    $.ajax('/getmessages').done(function (result) {
      messages = result.messages;
    }).done(function () {
      relevantMessages = _.filter(messages, function (message){
        return (message.user_id === current_user || message.target === current_user);
      });
      displayMessages(relevantMessages);
    });
  };

  var displayMessages = function (messages) {
    $('table').remove();
    $('#show-messages').val('');
    _.each(messages, function (message) {
      var $newMessage = $('<div/>');
      if (message.user_id === current_user) {
        $newMessage.addClass('outgoing-message');
      } else {
        $newMessage.addClass('incoming-message');
      };
      var $messageText = $('<p/>').text(message.message);
      $newMessage.append($messageText);
      $('#show-messages').append($newMessage);
    });
  };

  //calling getUserId to kick off the chain of functions
  getUserId();

});
