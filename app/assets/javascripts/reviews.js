$(document).ready(function() {

   $(".new_review").on("ajax:success", function(e, data, status, xhr) {
     $("#prevReviews").after(data);
  }).on("ajax:error", function(e, xhr, status, error) {
     $(".new_review").append("<p>ERROR</p>");
  });

});
