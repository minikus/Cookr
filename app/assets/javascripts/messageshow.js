$(document).ready(function () {
  var current_user = 0;
  var users = [];
  var messages = [];
  var relevantMessages = [];
  var conversations = [];
  var conversationMessages = [];

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
      // puts all of the conversation counterparts in an array
      _.each(relevantMessages, function (message) {
        if (message.user_id === current_user) {
          conversations.push(message.target);
        } else if (message.target === current_user) {
          conversations.push(message.user_id);
        };
      });
      conversations = _.uniq(conversations).sort();

      // creates "chat heads" for each conversation
      var width = 95/conversations.length;
      for (var i = 0; i< conversations.length; i++) {
        var user = _.find(users, function(user) {
          return user.id === conversations[i];
        });
        $chatHead = $('<div/>').width(width + '%').addClass('chat-head').attr('data', user.id );
        $chatHead.html('<p>' + user.first_name + '</p>')
        $chatHead.appendTo($('#conversations'));
      }
      //when you click on a chat head it shows the message history with that person

      $('.chat-head').on('click', function () {
        var person = Number($(this).attr('data'));
        displayMessages(person, relevantMessages);
      });
    });
  };



  var displayMessages = function (person, messages) {

    $('#messages-display').html('');

    _.each(messages, function (message) {
      //gets the id of the user who sent/received the message
      var messageFrom = _.find(users, function (user){
        return user.id === message.user_id;
      });
      var messageTo = _.find(users, function (user) {
        return user.id === message.target;
      });

      //if the message is either to or from the chat head you clicked it will display
      if (messageFrom.id === person || messageTo.id === person) {
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
        $('#messages-display').append($newMessage);
      };
    });
    var $messageInput = $('<textarea/>').attr({'id': 'message-content', 'placeholder': 'Enter new message here'});
    $messageInput.appendTo('#messages-display');
    var $submitMessage = $('<button/>').attr({'id': 'create-message', 'value': person}).text('Send message');
    $submitMessage.appendTo('#messages-display');

    $($submitMessage).on('click', function () {
      sendMessage(person);
    });
  };

  //calling getUserId to kick off the chain of functions
  getUserId();

  var sendMessage = function (recipient) {
    var errors = 0;
    var messageGetter = recipient;
    var message = $('#message-content').val();

    //error message if the message is blank
    if (message === '') {
      errors += 1;
      var $messageError = $('<p/>').text('Please enter some message text');
      $('#messages-display').append($messageError);
      $('#message-content').focus();
      setTimeout(function () {
        $messageError.remove();
      },2000);
    };

    //if there is not an error it will send the message to the recipient
    if (errors === 0) {
        $.ajax({
          method: 'POST',
          url: '/messages',
          data: {
            message: {
              user_id: current_user,
              target: messageGetter,
              message: message,
              seen: false,
              archive: false
            }
          }
        });
        // reset message inputs
        $('#message-content').val('');
      };
  };
});
