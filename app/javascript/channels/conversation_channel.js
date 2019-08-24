import consumer from "./consumer"

const converse = consumer.subscriptions.create("ConversationChannel", {
  connected: function() {},
  disconnected: function() {},
  // received: function(data) {
  //   console.log(data['message']);
  // },

  received: function(data) {
    var conversation = $('#conversations-list').find("[data-conversation-id='" + data['conversation_id'] + "']");
    conversation.find('.messages-list').find('ul').append(data['message']);

    var messages_list = conversation.find('.messages-list');
    var height = messages_list[0].scrollHeight;
    messages_list.scrollTop(height);
  },
  speak: function(message) {
    return this.perform('speak', {
      message: message
    });
  }
});
$(document).on('submit', '.new_message', function(e) {
  e.preventDefault();
  var values = $(this).serializeArray();
  converse.speak(values);
// console.log(values[2].value)
  $(this).trigger('reset');
});