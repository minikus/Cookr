$(document).ready(function () {
  var current_user = 0;
  var users = [];
  var messages = [];
  var newMessages = [];
  var conversations = [];
  var messageFocus = 0;
  var unreadConvos = [];

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
      newMessages = result.messages;

      var incomingMessages = _.filter(newMessages, function (message) {
        return message.target === current_user;
      });

      var unreadMessages = 0;
      _.each(incomingMessages, function (message) {
        if (!message.seen) {
          unreadMessages += 1;
          unreadConvos.push(message.user_id);
        };
      });
      if (unreadMessages === 0) {
        $('.message_link').removeClass('redder').text('Messages');
      } else {
        $('.message_link').addClass('redder').text('Messages ('+unreadMessages+')');
      };
      unreadConvos = _.uniq(unreadConvos).sort();


      if (messageFocus === 0) {
        messages = newMessages;
        getConversations(messages);
      } else {
        if (newMessages.length !== messages.length) {
          messages = newMessages;
          getConversations(messages);
          displayMessages(messageFocus, messages);
        };
      };
    });
  };

  //get an array of conversations counterparts
  var getConversations = function (messages) {

    var existingChatHeads = conversations.length;
    _.each(messages, function (message) {
      if (message.user_id === current_user) {
        conversations.push(message.target);
      } else if (message.target === current_user) {
        conversations.push(message.user_id);
      };
    });
    conversations = _.uniq(conversations).sort();
    if (conversations.length !== existingChatHeads || conversations.length === 0 || unreadConvos !== 0) {
      createChatHeads();
    };
  };

  //creates chat heads for your conversations and appends them to the #conversations div
  var createChatHeads = function () {

    $('#conversations').html('');
    if (conversations.length !== 0) {
      var header = $('<h1/>').text('Your conversations:').appendTo($('#conversations'));
    }
    var width = 90/conversations.length;
    if (width < 30 ) { width = 30 };
    for (var i = 0; i< conversations.length; i++) {
      var isConversation = undefined;
      var isUnreadConvos = undefined;
      var user = _.find(users, function (user) {
        return user.id === conversations[i];
      });

      //if user.id is in the conversations array and also in the unreadConvos array it will add the class unread to the chat head
      isConversation = _.find(conversations, function (num) {
        return num === user.id;
      });
      isUnreadConvos = _.find(unreadConvos, function (num) {
        return num === user.id;
      });

      var $chatHead = $('<div/>').width(width + '%').addClass('chat-head').attr('data', user.id);
      if (isUnreadConvos !== undefined && isConversation !== undefined) {
        $chatHead.addClass('unread');
      };

      var $userIcon = $('<img/>').addClass('userIcon');
      $chatHead.html('<img src="' + user.image + '" class="userIcon"><span>' + user.first_name + '</span>');
      $chatHead.appendTo($('#conversations'));
    };
    //create chathead for new message
    $chatHead = $('<div/>').width('97%').addClass('new-message');
    $chatHead.html('<p>Create New Message</p>').appendTo($('#conversations'));
    addChatHeadClicker();
    addNewMessageListener();
  };

  var addNewMessageListener = function () {
    $('.new-message').on('click', function () {
      $('#messages-display').html('').hide();
      createUserSelect();
      createMessageInput();
    });
  };

  var createUserSelect = function () {
    //create array of users and IDs
    var usersAndIDs = [];
    _.each(users, function (user) {
      usersAndIDs.push([user.first_name, user.id])
    })
    //create a select tag with each user as an option with their id as the value
    if ($('.userSelect').length > 0) {
      $('.userSelect').remove();
    };
    var $userSelect = $('<select/>').addClass('userSelect');
    $userSelect.html('<option selected disabled>Choose recipient</option>');
    _.each(usersAndIDs, function (user) {
      var $userOption = $('<option/>').val(user[1]).text(user[0]);
      $userOption.appendTo($userSelect);
    });
    $userSelect.appendTo('#create-message-box');
  };

  //adds the click listener to the chat heads once they have been loaded
  var addChatHeadClicker = function () {
    $('.chat-head').on('click', function () {
      $(this).removeClass('unread');
      unreadConvos = _.without(unreadConvos, Number($(this).attr('data')));
      $('.userSelect').remove();
      var person = Number($(this).attr('data'));
      messageFocus = person;
      displayMessages(person, messages);
      if ($('#message-content').length < 1) {
        createMessageInput();
      };
    });
  };

  //when you click on a chat head it displays the messages you have with that person
  var displayMessages = function (messageFocus, messages) {
    $('#messages-display').html('').show();
    var convoTarget = _.find(users, function (user) {
      return user.id === messageFocus;
    });
    var $convoHeader = $('<h2/>').text('Your conversation with ' + convoTarget.first_name + ':');
    $convoHeader.appendTo($('#messages-display'));
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
        if (messageFrom.id === messageFocus && message.seen !== true) {
          $.ajax ({
            method: 'PUT',
            url: '/messages/' + message.id,
            data: {
              message: {
                seen: true
              }
            }
          });
        }
        var $newMessage = $('<div/>').addClass('messageOnScreen');
        var $messageHeader = $('<p/>');
        if (message.user_id === current_user) {
          $newMessage.addClass('outgoing-message');
          $messageHeader.text('From you:');
        } else {
          $newMessage.addClass('incoming-message');
          $messageHeader.text('From ' + messageFrom.first_name + ':');
        };
        var $messageText = $('<p/>').html(message.message);
        $newMessage.append($messageHeader);
        $newMessage.append($messageText);
        $('#messages-display').append($newMessage);
      };
    });
    $("#messages-display").scrollTop($('#messages-display')[0].scrollHeight);
  };

  var createMessageInput = function () {
    $('#message-content').remove();
    $('#create-message').remove();

    var $messageInput = $('<textarea/>').attr({'id': 'message-content', 'placeholder': 'Enter new message here'});
    $messageInput.appendTo('#create-message-box');
    var $submitMessage = $('<button/>').attr({'id': 'create-message', 'value': messageFocus}).text('Send message');
    $submitMessage.appendTo('#create-message-box');

    $($submitMessage).on('click', function () {
      var message = $('#message-content').val();
      if ($('.userSelect').length > 0 && $('#message-content').val() !== '') {
        messageFocus = Number($('.userSelect').val());
        $('.userSelect').remove();
        sendMessage(messageFocus, message);
        getAllUsers();
      } else {
        sendMessage(messageFocus, message);
      };
    });
  };

  //when you click send message it will send a message
  var sendMessage = function (recipient, message) {
    var errors = 0;
    var messageGetter = recipient;

    //error if target is blank
    if (messageGetter === 0) {
      errors += 1;
      var $recipientError = $('<p/>').text('Please select a recipient');
      $('#messages').append($recipientError);
      createUserSelect();
      createMessageInput();
      $('.userSelect').focus();
      $('#message-content').text(message);
      setTimeout(function () {
        $recipientError.remove();
      },2000);
    };

    //error message if the message is blank
    if (message === '') {
      errors += 1;
      var $messageError = $('<p/>').text('Please enter some message text');
      $('#messages').append($messageError);
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

  // add click listener to user show page message Button
  $('#message-from-profile').on('click', function () {
    //saves the message recipient as profileToMessage
    var profileToMessage = Number($(this).attr('data'));

    //adds the message input field and submit button, and hides the message button
    var $messageInput = $('<textarea/>').attr({'id': 'profile-message-content', 'placeholder': 'Enter new message here'});
    $messageInput.appendTo($('#profile-message'));
    var $submitMessage = $('<button/>').attr({'id': 'create-message-from-profile', 'value': profileToMessage}).text('Send message');
    $submitMessage.appendTo($('#profile-message'));
    $('#message-from-profile').hide();

    // click listener on the submit message button
    $('#create-message-from-profile').on('click', function () {
      //if there is something in the message field it will continue
      if ($('#profile-message-content').val() !== '') {
        console.log('here');
        sendMessage(profileToMessage, $('#profile-message-content').val());
        $submitMessage.remove();
        $messageInput.remove();
        $('#message-from-profile').show();
      };
    });
  });

  //add click listener for when event is created and send boilerplate to chef
  $('#createEventButton').find('input').on('click', function (event){
    var chef = Number($('#event_chef_id').val());
    if (chef !== 0) {
      var message = "You have been requested for a new event."
      sendMessage(chef, message);
    };
  });

  //add click listener to events confirm by chef
  $('.chefConfirm').on('click', function () {
    var messageTarget = $(this).attr('data-host');
    var eventID = $(this).attr('data-id');
    var link = '<a href="/events/'+ eventID + '">event</a>';
    var message = "The chef has confirmed the " + link;
    sendMessage(messageTarget, message);
  });

  //add click listener to events cancel by chef
  $('.chefCancel').on('click', function (e) {
    var messageTarget = $(this).attr('data-host');
    var eventID = $(this).attr('data-id');
    var link = '<a href="/events/'+ eventID + '">event</a>';
    var message = "The chef has rejected your  " + link;
    sendMessage(messageTarget, message);
  });


  //calling getUserId to kick off the chain of functions
  getUserId();

  setInterval(function () {
    // if (messageFocus !== 0) {
      getAllUsers();
    // }
  }, 3000);
});
