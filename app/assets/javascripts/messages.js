// $(document).ready(function () {
//
//   // when you submit a message it gets the value from the option tab and adds it as the target ID
//   $('#create-message').on('click', function (event) {
//     var errors = 0;
//     event.preventDefault();
//     var current_user = 0;
//     var target = Number($('#message-target').val());
//     var message = $('#message-content').val();
//
//     // Error messages if there is no target or message
//     if (target === 0) {
//       errors += 1;
//       var $targetError = $('<p/>').text('Please select someone to message');
//       $('#new_message').append($targetError);
//       $('#message-target').focus();
//       setTimeout(function () {
//         $targetError.remove()
//       },2000);
//     };
//     if (message === '') {
//       errors += 1;
//       var $messageError = $('<p/>').text('Please enter some message text');
//       $('#new_message').append($messageError);
//       $('#message-content').focus();
//       setTimeout(function () {
//         $messageError.remove();
//       },2000);
//     };
//     if (errors === 0) {
//
//
//       $.ajax('/current_user').done(function(result) {
//         current_user = result.user.id;
//       }).done(function () {
//         $.ajax({
//           method: 'POST',
//           url: '/messages',
//           data: {
//             message: {
//               user_id: current_user,
//               target: target,
//               message: message,
//               seen: false,
//               archive: false
//             }
//           }
//         });
//       });
//       // reset message inputs
//       $('#message-target').val($('#message-target option:first').val());
//       $('#message-content').val('');
//     };
//   });
// });
