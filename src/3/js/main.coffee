$(document).ready ->

  $(".action-menu .menu").hide()


  # click functions

  $(document).mouseout (e) ->
    container = $ ".action-menu .menu"
    if !container.is e.target and container.has(e.target).length is 0
      container.fadeOut 300

  $(".action-menu .menu-button").click ->
    $(@).parent().find(".menu").fadeToggle 300

  tabs = ->
    tabs = $(".tabs .tab")
    html = $(".tabs .tab.active").find(".html").html()
    $(".tabs").parent(".view").find(".content").html html

    c = tabs.length
    w = "#{100 / c}%"
    tabs.css
      width: w
    tabs.click ->
      tabs.removeClass "active"
      $(@).addClass "active"
      html = $(@).find(".html").html()
      $(".tabs").parent(".view").find(".content").html html

  tabs() # enable the tabs (includes width and active)
