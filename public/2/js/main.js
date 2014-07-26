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
      tabs = $(".tabs .tab");
      c = tabs.length;
      w = "" + (100 / c) + "%";
      tabs.css({
        "width": w
      });
      return tabs.click(function() {
        $(".tabs .tab").removeClass("active");
        return $(this).toggleClass("active");
      });
    };
    return tabs();
  });

}).call(this);
