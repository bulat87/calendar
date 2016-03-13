$(document).ready(function() {
  $(".deleteAction").click(function(){
    var current_comment = $(this).parent('div');
    if(confirm("Delete comment?")){
      $.ajax({
        url: '/event/' + $(current_comment).attr('data-event_id') + '/comments/' + $(current_comment).attr('data-coment_id'),
        type: 'POST',
        data: { _method: 'DELETE'},
        success: function() {
          $(current_comment).fadeOut(200);
        }
      });
    };
  });
});