$(document).ready ->

  $(".action-menu .menu").hide()


  # click functions

  $(document).mouseout (e) ->
    container = $ ".action-menu .menu"
    if !container.is e.target and container.has(e.target).length is 0
      container.fadeOut()

  $(".action-menu .menu-button").click ->
    $(@).parent().find(".menu").fadeToggle()

