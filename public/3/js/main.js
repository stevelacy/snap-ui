(function() {
  $(document).ready(function() {
    var cards, snapButton, snapper, tabs;
    $(".action-menu .menu").hide();
    snapper = new Snap({
      element: document.getElementById('main'),
      disable: 'right',
      hyperextensible: false
    });
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
      var c, html, w;
      tabs = $(".tabs .tab");
      html = $(".tabs .tab.active").find(".html").html();
      $(".tabs").parent(".view").find(".content").html(html);
      c = tabs.length;
      w = "" + (100 / c) + "%";
      tabs.css({
        width: w
      });
      return tabs.click(function() {
        tabs.removeClass("active");
        $(this).addClass("active");
        html = $(this).find(".html").html();
        return $(".tabs").parent(".view").find(".content").html(html);
      });
    };
    tabs();
    cards = function() {
      cards = $(".cards .card");
      return cards.each(function() {
        var slide;
        slide = function(el) {
          return $(el).animate({
            "margin-left": "-100px",
            "opacity": "0"
          }).slideToggle();
        };
        return cards.swipe({
          swipeLeft: function(e, direction) {
            return slide(this);
          }
        });
      });
    };
    cards();
    snapButton = function() {
      var el;
      el = $(".snap-button");
      el.click(function() {
        if (snapper.state().state === "left") {
          snapper.close();
          return $(this).removeClass("active");
        } else {
          snapper.open("left");
          return $(this).addClass("active");
        }
      });
      return snapper.on("animated", function() {
        if (snapper.state().state === "left") {
          return el.addClass("active");
        } else {
          return el.removeClass("active");
        }
      });
    };
    return snapButton();
  });

}).call(this);
