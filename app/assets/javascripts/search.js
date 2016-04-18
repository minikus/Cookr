$(document).ready(function() {
  var $rows = $('#table tr');

  $('#search').keyup(function() {
    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase().split(' ');

    $rows.hide().filter(function() {
      var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
      var matchesSearch = true;
      $(val).each(function(index, value) {
        matchesSearch = (!matchesSearch) ? false : ~text.indexOf(value);
      });
      return matchesSearch;
    }).show();
  });

  $("#chefField").change(function() {
    var chefID = $("#event_chef_id").val();
    $('#menuField').show();

    var allMenus = [];
    $.ajax('/treefrogs').done(function(result){
      allMenus = result.menus;
    }).done(function () {

      var chefMenus = [];
      for (var i = 0; i<allMenus.length; i ++) {
        if (allMenus[i].user_id === Number(chefID) ) {
          chefMenus.push(allMenus[i].title);
        }
      }
      $('.chefMenuField').hide();
      $('#event_menu_id').html('');
      if (chefMenus.length >= 1) {
        for (var j = 0; j < chefMenus.length; j ++ ) {
          var menuItem = '<option>' + chefMenus[j] + '</option>';
          $('#event_menu_id').append(menuItem);
        }
      } else {
        $('#menuField').hide();
        $('.chefMenuField').show();
      }
    });
});

    // console.log(chefID);
    // $('#menuField').show();
    // $('#event_menu_id').html();

});
