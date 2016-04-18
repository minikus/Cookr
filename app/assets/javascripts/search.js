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
});

$(document).ready(function (){
      $("#chefField").change(function() {
        var chefID = $("#event_chef_id").val();
        console.log(chefID);
        $('#menuField').show();
          $('#event_menu_id').html("53");
      });
  });
