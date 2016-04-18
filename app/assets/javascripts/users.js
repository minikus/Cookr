$(document).ready(function () {
  // hide the chef details unless the chef checkbox is checked
  var $isChef = $('#chef-box');
  if ($isChef.prop('checked') === false) {
    $('#chef-details').hide();
  };
  $isChef.on('click', function () {
    if ($isChef.prop('checked') === true) {
      $('#chef-details').show();
    } else if ($isChef.prop('checked') === false) {
      $('#chef-details').hide();
    };
  });

  // if a user is logged in then the password update field is hidden until they click the update password button
  $('#password-button').on('click', function () {
    $('#password-button').remove();
    $('#password-update').show();
  });

});
