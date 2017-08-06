Modules.FlashMessages = class
  constructor: ->
    self = @

    $('body').data('flash').forEach (flash_message) ->
      self.notify
        type: flash_message.type,
        text: flash_message.message,

  notify: (options = {}) ->
    swal $.extend {
      confirmButtonText: 'OK'
    }, options
