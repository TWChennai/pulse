$(document).ready(function(){
  $('.iteration').dataTable();
  $(".datepicker").datepicker();	
  $(".indicator").tooltip();

  $("#project_properties_title").click(function(){
    $('#project_properties').toggle(400);
    return false;
  });
});

var Attachment = {
  attachments_count : 0,
  remove_link : function(){
    return $('<a />').attr('class', 'remove_attachment').attr('href', '#').text('Remove Attachment');
  },

  list_item : function(){
    return $('<li />').html("<input type='file' name='attachments[]' />").append(Attachment.remove_link());
  },

  init : function(){
    $("#attachments a.add").click(function(){
      $("#attachments ul").append(Attachment.list_item());
      Attachment.attachments_count++;
      return false;
    });
    $(".remove_attachment").live('click', function(){
      $(this).parent().remove();
      return false;
    });
  }
};
