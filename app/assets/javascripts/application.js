// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require turbolinks
//= require_tree .
//= require bootstrap-multiselect

    $(document).ready(function() {
    $('#quotes_table').DataTable({
    		"pageLength": 10, 
    		
    });
    
    
    
   $('#sent_quotes').multiselect({
        enableFiltering: true,
        enableClickableOptGroups: true, 
        //includeSelectAllOption: true
   });
   
   $('.multiselect-group').before('<input type="checkbox" />');
   $(document).on('click', '.multiselect-group', function(event) {
       var checkAll = true;
       var $opts = $(this).parent().nextUntil(':has(.multiselect-group)'); 
       var $inactive = $opts.filter(':not(.active)'); 
       var $toggleMe = $inactive;
       if ($inactive.length == 0) { 
           $toggleMe = $opts;
           checkAll = false;
       }
       $toggleMe.find('input').click();
       $(this).parent().find('input').attr('checked', checkAll);
       event.preventDefault();
   });
     
    
    
} );