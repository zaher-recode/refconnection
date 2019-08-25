json.array! @notifications do |notification|
    json.id notification.id
    json.actor notification.actor.username
    json.action notification.action
    json.notifiable do
        @x = json.type "a #{notification.notifiable.class.to_s.underscore.humanize}"
    end
    if @x == "a Message"
        json.url conversations_path(notification.notifiable.conversation, anchor: dom_id(notification.notifiable))
    else
        json.url post_path(notification.notifiable.post, anchor: dom_id(notification.notifiable))
    end
  end