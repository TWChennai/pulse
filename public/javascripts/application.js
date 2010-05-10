$(document).ready(function(){
  $('.iteration').dataTable({"bAutoWidth": false});	
  $(".datepicker").datepicker();	
  $(".indicator").tooltip();

  $("#project_properties_title").click(function(){
    $('#project_properties').toggle(400);
    return false;
  });

  var addMetricNameField = $("#add_metric_name"),
      addMetricDescField = $("#add_metric_desc"),
      additionalMetricsField = $("#additional_metrics"),
      addMetricFields = $(addMetricNameField).add(addMetricDescField);
  $("#add_metric").click(function(){
		var metricName = addMetricNameField.attr("value"),
        metricDescription = addMetricDescField.attr("value"),
        newMetric;

    if(!metricName && !metricDescription) {
      addMetricFields.addClass('hasError').end().focus();
      return;
    }

    addMetricFields.removeClass('hasError').attr('value', '');

    newMetric = '<div id="'+metricName+'" class="metric_field"><input type="checkbox" id="metricName_'+metricName+'" name="project[metrics[' + metricName + ']]" value="yes" />'
                   +'<label for="metricName_'+metricName+'">'+metricName+' <span>' +metricDescription+'</span></label>'
                   +'<input type="hidden" name="project[additional_metrics[' + metricName + ']]" value="'+metricDescription+'" /></div>';
		additionalMetricsField.append(newMetric);
    
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
