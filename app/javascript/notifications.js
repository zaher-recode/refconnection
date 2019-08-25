var notifications;
class Notifications {
    constructor() {
      notifications =$("[data-behavior= 'notifications']");
      if (notifications.length > 0){
          setup();
      }
    }
}

var setup= function(){
    
    $.ajax({
        method: "GET",
        url: "/notifications.json",
        datatype: "JSON",
        success: function (data) {
          items = $.map(data, function(notification){
            return `<a class="dropdown-item" href="${notification.url}">${notification.actor} ${notification.action} ${notification.notifiable.type}</a>`

            // `<%= link_to :${notification.actor} ${notification.action} ${notification.notifiable.type}, "notification.url",class:'dropdown-item' %>`
          })
          $("[data-behavior='unread-count']").html(items.length)
          // $("[data-behavior='unread-count']").text(unread_count)
          $("[data-behavior='notification-items']").html(items)
        }
    })

}



$("[data-behavior='notifications-link']").click(function(){
  $.ajax({
      method: "POST",
      url: "/notifications/mark_read",
      datatype: "JSON",
     success: function () {
        $("[data-behavior='unread-count']").html(0)
      }
    });
})


// setInterval(function(){new Notifications; }, 1000);
 
 new Notifications