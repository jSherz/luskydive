$ ->
  controls_btn = $('#navbar .controls a')
  controls_btn_label = $(controls_btn).children('span')

  controls_btn.click ->
    console.log 'A'
    menu_items = $('#navbar li').not('.controls')

    menu_items.toggle()

    if menu_items.is(':hidden')
      controls_btn_label.html("Show menu")
    else
      controls_btn_label.html("Hide menu")