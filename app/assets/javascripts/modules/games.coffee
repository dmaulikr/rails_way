Modules.Games = class
  constructor: ->
    $('#railroads').sortable()

    setEntranceIcon 'D'

    placeEntranceAndExitIcons $($('#railroads img')[2]), $('#entrance-icon'), 'D'
    placeEntranceAndExitIcons $($('#railroads img')[3]), $('#exit-icon'),     'D'

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

