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
            return `<a class="dropdown-item" data-behavior='note' data-id="${notification.id}"  href="${notification.url}">${notification.actor} ${notification.action} ${notification.notifiable.type}</a>`

          })
          $("[data-behavior='unread-count']").html(items.length)
          // $("[data-behavior='unread-count']").text(unread_count)
          $("[data-behavior='notification-items']").html(items)
        }
    })

}


x = document.querySelector("[data-behavior = 'notifications']");
x.addEventListener("click",function(e){
  var y = e.target.dataset.id
  if (y){
    $.ajax({
           method: "POST",
           url: `/notifications/read/${y}`,
           datatype: "JSON",
          success: function () {
           }
         });
  }

});


// $("[data-behavior='note']").click(function(e){
//   alert(22);
//   var x= e.target
//   console.log(e.target)
//   $.ajax({
//       method: "POST",
//       url: `/notifications/read/${x.data-set.id}`,
//       datatype: "JSON",
//      success: function () {
//       }
//     });
// })


// setInterval(function(){new Notifications; }, 1000);
 
 new Notifications