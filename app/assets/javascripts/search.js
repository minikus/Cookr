$(document).ready(function() {

  // Menus Search Field
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


  //Events Form
  var getMenus = function () {
    var chefID = $("#event_chef_id").val();
    var allMenus = [];
    $.ajax('/treefrogs').done(function(result) {
      allMenus = result.menus;
    }).done(function() {

      var chefMenus = [];
      for (var i = 0; i < allMenus.length; i++) {
        if (allMenus[i].user_id === Number(chefID)) {
          chefMenus.push([
            [allMenus[i].title],
            [allMenus[i].id]
          ]);
        }
      }
      $('.chefMenuField').hide();
      $('#event_menu_id').html('');
      $('#event_price').val("");
      $('#event_guests').val("");

      var firstItem = '<option selected disabled>Choose here</option>';

      $('#event_menu_id').append(firstItem);
      if (chefMenus.length >= 1) {
        for (var j = 0; j < chefMenus.length; j++) {
          var menuItem = '<option value="' + chefMenus[j][1] + '">' + chefMenus[j][0] + '</option>';
          $('#event_menu_id').append(menuItem);
        }
      } else {
        $('#menuField').hide();
        $('.chefMenuField').show();
      }
    });
  };

  $("#chefField").change(function() {
    var chefID = $("#event_chef_id").val();
    $('#menuField').show();
    getMenus();
  });


  $('#menuField').change(function() {
    $('#event_price').val("");
    $('#event_guests').val("");
  });

  $('#event_guests').on('keyup', function() {
    console.log('event_guests keyup');
    $('#event_price').val("");

    $.ajax('/treefrogs').done(function(result) {
      allMenus = result.menus;
    }).done(function() {
      var menuID = $('#event_menu_id').val();
      var menuPrice = 0;
      var guests = Number($('#event_guests').val());
      for (var i = 0; i < allMenus.length; i++) {
        if (allMenus[i].id === Number(menuID)) {
          menuPrice = allMenus[i].pricePP;
          console.log(menuPrice);
          var guest = Number($('#event_guests').val());
          var finalPrice = menuPrice * guests;
          console.log(finalPrice);
          if (finalPrice === 0) {
            $('#event_price').val("How many guests?");
          } else if (finalPrice < 0) {
            $('#event_price').val("This is not valid!");
          } else {
            $('#event_price').val(finalPrice);
          }
        }
      }
    });
  });


});
