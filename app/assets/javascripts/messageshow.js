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
    $('#messages').val('');
    _.each(messages, function (message) {
      var messageFrom = _.find(users, function (user){
        return user.id === message.user_id;
      });
      var messageTo = _.find(users, function (user) {
        return user.id === message.target;
      });
      var $newMessage = $('<div/>');
      var $messageHeader = $('<p/>');
      if (message.user_id === current_user) {
        $newMessage.addClass('outgoing-message');
        $messageHeader.text('From you:');
      } else {
        $newMessage.addClass('incoming-message');
        $messageHeader.text('From ' + messageFrom.first_name + ':');
      };
      var $messageText = $('<p/>').text(message.message);
      $newMessage.append($messageHeader);
      $newMessage.append($messageText);
      $('#messages').append($newMessage);
    });
    var $messageInput = $('<textarea/>').attr({'id': 'message-content', 'placeholder': 'Enter message here'});
    $messageInput.appendTo('#messages');
    var $submitMessage = $('<button/>').attr({'id': 'create-message', 'value': messageTo.id});
    $submitMessage.appendTo('#messages');
  };

  //calling getUserId to kick off the chain of functions
  getUserId();


});
