(function() {
  $(document).ready(function() {
    var tabs;
    $(".action-menu .menu").hide();
    $(document).mouseout(function(e) {
      var container;
      container = $(".action-menu .menu");
      if (!container.is(e.target && container.has(e.target).length === 0)) {
        return container.fadeOut(300);
      }
    });
    $(".action-menu .menu-button").click(function() {
      return $(this).parent().find(".menu").fadeToggle(300);
    });
    tabs = function() {
      var c, w;
      c = $(".tabs .tab").length;
      w = "" + (100 / c) + "%";
      return $(".tabs .tab").css({
        "width": w
      });
    };
    return tabs();
  });

}).call(this);
