$(function(){
  function buildHTML(data) {
    var html =
      '<div class="chat__room">'
         + '<div class="chat__room__name">'
           + data.nickname
         + '</div>'
         + '<div class="chat__room__date">'
           + data.created_at
         + '</div>'
         + '<div class="chat__room__text">'

        if (data.body != "") {
           html += data.body
        };
        if (data.image.url != null) {
           html += '<img src="'+ data.image.url +'">'
        };
         + '</div>'
      + '</div>'
  return html
  }

$(function(){
  $('.new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
      type: 'POST',
      url: window.location.href,
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chat__bar').after(html);
      $('html,body').animate({scrollTop: 0});
      $('.message').val('');
    })
    .fail(function(){
      alert('error');
    })
    return false
  });
});
});
