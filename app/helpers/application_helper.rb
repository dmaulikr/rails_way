module ApplicationHelper
  def flash_messages_as_json
    flash_messages = flash.to_a

    if defined?(resource) && resource&.errors&.any?
      flash_messages.concat(resource.errors.full_messages.map { |error| [:alert, error] })
    end

    flash_messages.map! do |type, message|
      {
        type:    type.in?([:alert, 'alert']) ? 'error' : 'success',
        message: message
      }
    end

    JSON.dump(flash_messages)
  end
end
