$(document).ready(function(){
  $('#notification_button').on('click', function(){
    let url = $('#notification_url').text()
    $.ajax({
      url,
      type: 'get',
      success: function(data) {
        $('#notification_dropdown').html(data.html); 
      }
    })
  })

  
});
