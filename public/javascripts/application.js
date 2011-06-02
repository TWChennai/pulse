$(document).ready(function(){
  $('.iteration').dataTable({"bAutoWidth": false, "aaSorting": [[ 0, "desc" ]]});
  $(".datepicker").datepicker();
  $(".indicator").tooltip();

  $(".editable").editable("/staffing_plan/update");
  $("#project_properties_title").click(function(){
    $('#project_properties').toggle(400);
    return false;
  });

  $('.toggle_next_div').click(function(){
    $('togglable_div').toggle(400);
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

   
    $('#metric_filter').dropdownchecklist();
	
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
var edit=function(e){
    if (window.event){
        key = window.event.keyCode;
        combo = window.event.srcElement;
        // Stop the browser from scrolling through <option>s
        window.event.cancelBubble = true;
        window.event.returnValue = false;
    }
    else if (e) {
        key = e.which;
        combo = e.target;
    }
    else {
        return true;
    }

    if (key == 13 || key == 8 || (key > 31 && key < 127)) {
        if (combo.editing && key == 13) {
            // Done editing
            combo.editing = false;
            combo = null;
            return false;
        }
        else if (!combo.editing) {
            combo.editing = true;
            combo.options[combo.options.length] = new Option("");
        }

        // Normal key
        if (key > 32 && key < 127) {
            with (combo.options[combo.options.length - 1]) {
                if (combo.insertSpace) {
                    combo.insertSpace = false;
                    text = text + " " + String.fromCharCode(key);
                }
                else {
                    text = text + String.fromCharCode(key);
                }
                }
        }

        // The backspace key
        else if (key == 8 && combo.options[combo.options.length - 1].text.length) {
            if (combo.insertSpace) {
                combo.insertSpace = false;
            }
            else {
                with (combo.options[combo.options.length - 1]) {
                    text = text.substring(0, text.length - 1);
                    }
            }
        }
        // Space key requires special treatment; some browsers will not append a space
        else if (key == 32) {
            combo.insertSpace = true;
        }
        combo.selectedIndex = combo.options.length - 1;
        return false;
    }
}
