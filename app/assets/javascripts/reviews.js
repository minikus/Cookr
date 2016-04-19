$(document).ready(function() {
  return $("#new_article").on("ajax:success", function(e, data, status, xhr) {
    return $("#new_article").append(xhr.responseText);
  }).on("ajax:error", function(e, xhr, status, error) {
    return $("#new_article").append("<p>ERROR</p>");
  });
});
