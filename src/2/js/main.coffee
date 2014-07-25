$(document).ready ->

  $(".action-menu .menu").hide()


  # click functions

  $(".action-menu .button").click ->
    $(@).find(".menu").fadeIn()


  $(document).mouseout (e) ->
    container = $ ".action-menu .menu"
    if !container.is e.target and container.has(e.target).length is 0
      container.fadeOut()
