function toggleForm() {
  var postType = document.getElementById('post_post_type').value;
  if (postType === 'diary') {
    document.getElementById('diary_form').style.display = 'block';
    document.getElementById('event_form').style.display = 'none';
  } else if (postType === 'event') {
    document.getElementById('event_form').style.display = 'block';
    document.getElementById('diary_form').style.display = 'none';
  }
}

function checkFormCompletion() {
  var title = document.getElementById('post_title').value;
  var body = document.getElementById('post_body').value;
  var postType = document.getElementById('post_post_type').value;
  if (title && body && postType) {
    document.getElementById('submit_button').disabled = false;
  } else {
    document.getElementById('submit_button').disabled = true;
  }
}

document.getElementById('post_title').addEventListener('input', checkFormCompletion);
document.getElementById('post_body').addEventListener('input', checkFormCompletion);