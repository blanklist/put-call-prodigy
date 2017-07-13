$(document).on('turbolinks:load', function () {
  showRegistrationForm();
});

var showRegistrationForm = function() {
  $("a[data-remote]").on("ajax:success", function(e, data) {
    e.preventDefault();
    $('#register-link').replaceWith()
  });
}
