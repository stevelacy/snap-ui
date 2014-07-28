$(document).ready ->

  $(".action-menu .menu").hide()

  snapper = new Snap
    element: document.getElementById 'main'
    disable: 'right'
    hyperextensible: false

  # click functions

  $(document).mouseout (e) ->
    container = $ ".action-menu .menu"
    if !container.is e.target and container.has(e.target).length is 0
      container.fadeOut 300

  $(".action-menu .menu-button").click ->
    $(@).parent().find(".menu").fadeToggle 300

  tabs = ->
    tabs = $ ".tabs .tab"
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

  cards = ->
    cards = $ ".cards .card"
    cards.each ->
      slide = (el) ->
        $(el).animate
          "margin-left": "-100px"
          "opacity": "0"
        .slideToggle()

      cards.swipe
        swipeLeft: (e, direction) ->
          slide @

  cards() # enable the cards

  snapButton = ->
    el = $ ".snap-button"
    el.click ->
      if snapper.state().state == "left"
        snapper.close()
        $(@).removeClass "active"
      else
        snapper.open "left"
        $(@).addClass "active"
    snapper.on "animated", ->
      if snapper.state().state == "left"
        el.addClass "active"
      else
        el.removeClass "active"

  snapButton() # enable snap button
