$(document).ready(function() {
  "use strict";

  // Update panel badge to show percent filled and change colors
  function updateBadge ($el, total) {
    var $inputs = $el.find("input[type!='radio']");
    var filled = 0;
    var percent = 0;
    $inputs.each(function(index, element) {
      return ($(this).val().length) ? filled++ : filled;
    });
    percent = Math.round((filled / total) * 100);
    console.log(percent);
    $el.find("span.badge").text(percent + "%");
  }

  // Set up medrec panel
  var medrecPanel = $("#medrec-panel");
  medrecPanel.find("input").on("change", function(event) {
    var $test = $(this).attr("name");
    var $panel = $(this).parents(".panel");
    updateBadge($panel, 9);
    console.log($test + " changed!");
  });

  $(function() {
    var $bdate = $("#birthPicker").datepicker()
      .on("changeDate", function() {
        $idate.datepicker("setStartDate", $("#birth").val());
      });
    var $idate = $("#imagePicker").datepicker();
  });

});
