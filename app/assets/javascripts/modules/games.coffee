Modules.Games = class
  show: ->
    $('#railroads').sortable()

    setupForm()
    clearTimerouts()
    setupTimer()

    entrance = $('img[data-entrance]')
    setEntranceIcon entrance.data('entrance')
    placeEntranceAndExitIcons entrance, $('#entrance-icon'), entrance.data('entrance')

    exit = $('img[data-exit]')
    placeEntranceAndExitIcons exit, $('#exit-icon'), exit.data('exit')

  setupForm = ->
    $('form').submit (e) ->
      blocks_positions = JSON.stringify($.map $('#railroads img'), (img) ->
        img.src.match(/.*\/(.*)-.*/)[1]
      )

      $('input[name=blocks_positions]').val(blocks_positions)

  clearTimerouts = ->
    id = window.setTimeout((->), 0)
    while id--
      window.clearTimeout(id)

  setupTimer = ->
    time = parseInt $('#timer').html()

    setInterval(->
      $('#timer').html(--time) if time > 0
    , 1000)

    setTimeout(->
      $('#timer').parent().css({ color: '#FF4136' })
    , (time - 10) * 1000)

    setTimeout(->
      (new Modules.FlashMessages).notify
        type: 'error',
        title: 'Game over!',
        text: 'Time out :(',
        confirmButtonText: 'Retry',
        onClose: ->
          $('body').html('Loading...')
          location.reload()
    , time * 1000)

  setEntranceIcon = (direction) ->
    icon = $('#entrance-icon')

    switch direction
      when 'U' then icon.html '⬇️'
      when 'D' then icon.html '⬆️'
      when 'L' then icon.html '➡️'
      when 'R' then icon.html '⬅️'

  placeEntranceAndExitIcons = (image, icon, direction) ->
    top    = image.offset().top
    left   = image.offset().left
    height = parseInt(image.css('height'))
    width  = parseInt(image.css('width'))

    iconTop      = undefined
    iconLeft     = undefined
    entranceIcon = undefined

    switch direction
      when 'U', 'D' then iconLeft = left + width / 2 - 10
      when 'L'      then iconLeft = left - 20
      when 'R'      then iconLeft = left + width

    switch direction
      when 'L', 'R' then iconTop = top + height / 2 - 10
      when 'U'      then iconTop = top - 20
      when 'D'      then iconTop = top + height

    icon.css
      top:  iconTop  + 'px'
      left: iconLeft + 'px'
