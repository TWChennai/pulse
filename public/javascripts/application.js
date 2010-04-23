$(document).ready(function(){
  $('.iteration').dataTable();
  $(".datepicker").datepicker();	
  $(".indicator").tooltip();

  $("#project_properties_title").click(function(){
    $('#project_properties').toggle(400);
    return false;
  });
  
  $("#add_metric").click(function(){
		var metricName = $("#add_metric_name").attr("value");
		var metricDescription = $("#add_metric_desc").attr("value");
		var newMetric = $('<div />').attr('id', metricName).attr('class', 'metric_field').append($('<input />').attr('type', 'checkbox').attr('name', 'project[metrics[' + metricName + ']]').attr('value', 'yes')).append(metricName).append($('<h2 />').append(metricDescription));
		
		var newMetricData = $('<input />').attr('type', 'hidden').attr('name', 'project[additional_metrics[' + metricName + ']]').attr('value', metricDescription)
		$("#additional_metrics").append(newMetric);
		$("#additional_metrics").append(newMetricData);
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
