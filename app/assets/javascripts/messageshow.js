$(document).ready(function () {
  var current_user = 0;
  var users = [];
  var messages = [];
  var newMessages = [];
  var conversations = [];
  var messageFocus = 0;
  var pageLoaded = 0;

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
      getMessages();
    });
  };

  // get all messages where user is target or creator
  var getMessages = function () {
    $.ajax('/getmessages').done(function (result) {
      newMessages = _.filter(result.messages, function (message) {
        return (message.user_id === current_user || message.target === current_user)
      });
      if (messageFocus === 0) {
        messages = newMessages;
        getConversations(messages);
      } else {
        if (newMessages !== messages) {
          messages = newMessages;
          displayMessages(messageFocus, messages);
        };
      };
    });
  };

  //get an array of conversations counterparts
  var getConversations = function (messages) {
    _.each(messages, function (message) {
      if (message.user_id === current_user) {
        conversations.push(message.target);
      } else if (message.target === current_user) {
        conversations.push(message.user_id);
      };
    });
    conversations = _.uniq(conversations).sort();
    createChatHeads();
  };

  //creates chat heads for your conversations and appends them to the #conversations div
  var createChatHeads = function () {
    var width = 100/conversations.length;
    for (var i = 0; i< conversations.length; i++) {
      var user = _.find(users, function (user) {
        return user.id === conversations[i];
      });
      $chatHead = $('<div/>').width(width + '%').addClass('chat-head').attr('data', user.id);
      $chatHead.html('<p>' + user.first_name + '</p>');
      $chatHead.appendTo($('#conversations'));
    };
    addChatHeadClicker();
  };

  //adds the click listener to the chat heads once they have been loaded
  var addChatHeadClicker = function () {
    $('.chat-head').on('click', function () {
      var person = Number($(this).attr('data'));
      messageFocus = person;
      displayMessages(person, messages);
    });
  };

  //when you click on a chat head it displays the messages you have with that person
  var displayMessages = function (messageFocus, messages) {
    console.log('this far');
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
      if (messageFrom.id === messageFocus || messageTo.id === messageFocus) {
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
    createMessageInput();
  };

  var createMessageInput = function () {
    var $messageInput = $('<textarea/>').attr({'id': 'message-content', 'placeholder': 'Enter new message here'});
    $messageInput.appendTo('#create-message-box');
    var $submitMessage = $('<button/>').attr({'id': 'create-message', 'value': messageFocus}).text('Send message');
    $submitMessage.appendTo('#create-message-box');

    $($submitMessage).on('click', function () {
      sendMessage(messageFocus);
    });
  };

  //when you click send message it will send a message (duh)
  var sendMessage = function (recipient) {
    var errors = 0;
    var messageGetter = recipient;
    var message = $('#message-content').val();

    //error message if the message is blank
    if (message === '') {
      errors += 1;
      var $messageError = $('<p/>').text('Please enter some message text');
      $('#create-message-box').append($messageError);
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
      }).done(function () {
        // reset message inputs
        $('#message-content').val('').focus();
      });
    };
  };



  //calling getUserId to kick off the chain of functions
  getUserId();


});
