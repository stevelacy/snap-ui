(function() {
  $(document).ready(function() {
    $(".action-menu .menu").hide();
    $(document).mouseout(function(e) {
      var container;
      container = $(".action-menu .menu");
      if (!container.is(e.target && container.has(e.target).length === 0)) {
        return container.fadeOut();
      }
    });
    return $(".action-menu .menu-button").click(function() {
      return $(this).parent().find(".menu").fadeToggle();
    });
  });

}).call(this);
