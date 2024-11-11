function toggleForm() {
  var postType = document.getElementById('post_post_type').value;

  // フォームを切り替え
  if (postType === 'diary') {
    document.getElementById('diary_form').style.display = 'block';
    document.getElementById('event_form').style.display = 'none';
    
    // イベントフォームのフィールドを無効化
    disableEventForm();
  } else if (postType === 'event') {
    document.getElementById('event_form').style.display = 'block';
    document.getElementById('diary_form').style.display = 'none';
    
    // 日記フォームのフィールドを無効化
    disableDiaryForm();
  }
}

// イベントフォームのフィールドを無効化する関数
function disableEventForm() {
  document.getElementById('post_place').disabled = true;
  document.getElementById('post_group_id').disabled = true;
  // 他のイベント専用フィールドも無効化
}

// 日記フォームのフィールドを無効化する関数
function disableDiaryForm() {
  document.getElementById('post_place').disabled = true;
  document.getElementById('post_group_id').disabled = true;
  // 他の日記専用フィールドも無効化
}

// フォーム送信時に必要な項目をチェック
function checkFormCompletion() {
  var title = document.getElementById('post_title').value;
  var body = document.getElementById('post_body').value;
  var postType = document.getElementById('post_post_type').value;
  
  // 送信を有効化する条件
  if (title && body && postType) {
    document.getElementById('submit_button').disabled = false;
  } else {
    document.getElementById('submit_button').disabled = true;
  }
}