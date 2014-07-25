(function() {
  $(document).ready(function() {
    $(".action-menu .menu").hide();
    return $(".action-menu .button").click(function() {
      return $(this).find(".menu").fadeToggle();
    });
  });

}).call(this);
