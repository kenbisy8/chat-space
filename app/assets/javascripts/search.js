$(function(){
  var user_input = $('#user-input');

  function buildHTML(data){
    var html =
        '<div class="chat-group-user clearfix" id="addMember-data'+ data.id +'">'
          + "<p class='chat-group-user__name'>"
          + data.nickname + "</p>"
          + '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" id="addButton"'
          + 'data-user-id= "'+ data.id +'" data-user-name= "'+ data.nickname +'">'
          + '追加' + "</a>"
      + "</div>";
    return html
  }

  function addMEMBER(user){
    var add =
        '<div class="chat-group-user clearfix js-chat-member" id="removeMember-data'+ user.userId +'" >'
          + '<input name="group[user_ids][]" type="hidden" value="'+ user.userId +'">'
          + '<p class="chat-group-user__name">'
          + user.userName + '</p>'
          + '<a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove" id="removeButton"'
          + 'data-user-id= "'+ user.userId +'" data-user-name= "'+ user.userName +'">'
          + '削除' + '</a>'
      + '</div>';
    return add
  }


  user_input.on('keyup', function(e){
    e.preventDefault();
    var input = user_input.val();
      $.ajax({
        type: 'GET',
        data: ('q=' + input),
        url: '/users/search',
        dataType: 'json',
        contentType: false,
        processData: false
      })

    .done(function(data){
      $.each(data, function(i, data){
        var html = buildHTML(data);
        user_input.after(html)
      })
     })
    .fail(function(){
      alert('ユーザー検索に失敗しました');
    });
  });


  // チャットメンバー追加
    $('#addMember').on('click', '#addButton', function(){
      var user_data = $(this).data();
      var add = addMEMBER(user_data);
      $('#user-add-field').after(add);
      $('#addMember-data'+ user_data.userId +'').remove();
    })

  // チャットメンバー削除
    $('#removeMember').on('click', '#removeButton', function(){
      var user_data = $(this).data();
      $('#removeMember-data'+ user_data.userId +'').remove();
    });
});
