$(function(){
  function insertHTML(data){
    var chat_room = '<div class="chat__group__room'
    var chat_name = $(chat_room + '-name">').append(data.nickname);
    var chat_date = $(chat_room + '-date">').append(data.created_at);

    var result = $(chat_room + '>').append(chat_name, chat_date);
    if (data.body) {
      var chat_body = $(chat_room + '-text">').append(data.body)
      result.append(chat_body)
    };
    if (data.image.url) {
      var chat_image = $('<img>').attr('src', data.image.url)
      result.append(chat_image)
    };
  return result
  }

  setInterval(function(){
    var first_message_id = $('.chat__group').first().attr('id');
    $.ajax({
      type: 'GET',
      url: './messages',
      dataType: 'json',
      data: ('q=' + first_message_id)
    })
    .done(function(data){
      for (var i = 0; i < data.length; i++){
        var result = insertHTML(data[i])
        $('.chat__bar').after(result)
      };
    })
    .fail(function(data){
      alert('更新に失敗しました');
    })
  },5000);
});
