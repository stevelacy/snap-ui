(function() {
  $(document).ready(function() {
    $(".action-menu .menu").hide();
    $(".action-menu .button").click(function() {
      return $(this).find(".menu").fadeIn();
    });
    return $(document).mouseout(function(e) {
      var container;
      container = $(".action-menu .menu");
      if (!container.is(e.target && container.has(e.target).length === 0)) {
        return container.fadeOut();
      }
    });
  });

}).call(this);
