// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery/dist/jquery.min
//= require bootstrap/dist/js/bootstrap.bundle.min
//= require bootstrap-growl-ifightcrime/jquery.bootstrap-growl.min
//= require apexcharts
//= require chartkick
//= require Chart.bundle
//= require js-datepicker/dist/datepicker.min
//= require custom
//= require_tree .


function showNotification(message, type) {
  $.bootstrapGrowl(message, {
    ele: 'body',
    type: type, // (null, 'info', 'error', 'success')
    align: 'right', // ('left', 'right', or 'center')
    width: 250, // (integer, or 'auto')
    delay: 4000,
    allow_dismiss: true,
    stackup_spacing: 10 // spacing between consecutively stacked growls.
  });
}


datepicker('.datepicker', {
  formatter: (input, date, instance) => {
    const value = date.toLocaleDateString()
    input.value = value // => '1/1/2099'
  },
  dateSelected: new Date(), // Today is selected.
})


