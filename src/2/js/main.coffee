$(document).ready ->

  $(".action-menu .menu").hide()


  # click functions
  $(".action-menu .button").click ->
    $(@).find(".menu").fadeToggle()