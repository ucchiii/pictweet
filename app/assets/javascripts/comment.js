$(function(){
  function buildHTML(comment){
    // テンプレートリテラル記法
    //バックティック文字で囲むことで、わかりやすくHTML要素を作成できる
    var html = `<p>
                  <strong>
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>
                    ：
                  </strong>
                  ${comment.text}
                </p>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    // FormDataは、フォームのデータの送信に使用
    var formData = new FormData(this);
    // attrメソッド:要素が持つ指定属性の値を返す（今回はaction属性の値）
    var href = window.location.href + '/comments'
    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      // processDataオプション:クエリ文字列に変換する。それをしないように指定
      processData: false,
      // contentTypeオプション:サーバにデータのファイル形式を伝えるヘッダ
      contentType: false
    })
    // 非同期通信に成功した時
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html)
      $('.textbox').val('')
    })
    // 通信に失敗した時
    .fail(function(){
      alert('error');
    })
  })
});
