
/* FOR QUOTE FORM */
jQuery(function()
{
    jQuery(document).on('click', '.btn-add', function(e)
    		
    {
        e.preventDefault();

        var controlForm = jQuery('.controls'),
            currentEntry = jQuery(this).parents('.entry:first'),
            newEntry = jQuery(currentEntry.clone()
            		.find(':input')
            	      .each(function(){
            	            this.name = this.name.replace(/\[(\d+)\]/, function(str,p1){
            	                return '[' + (parseInt(p1,10)+1) + ']';
            	            });
            	        })
            	    .end()
            	    .appendTo(controlForm));
            		

        newEntry.find('input').val('');
        controlForm.find('.entry:not(:last) .btn-add')
            .removeClass('btn-add').addClass('btn-remove')
            .removeClass('btn-success').addClass('btn-danger')
            .html('<span class="glyphicon glyphicon-minus"></span>');
    }).on('click', '.btn-remove', function(e)
    {
    	jQuery(this).parents('.entry:first').remove();

		e.preventDefault();
		return false;
	});
});

/* END OF QUOTE FORM */




$(document).ready(function() {
	
	
	
	/**** FOR TABLE LISTING QUOTE (DATATABLES) */
$('#quotes_table').DataTable({
		"pageLength": 10, 
		
});
/*---------  END OF TABLE LISTING QUOTES -----------*/



/**** FOR MULTISELECT IN ADMIN SENT TO DEALERS  */
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


/*---------  END OF TABLE LISTING QUOTES -----------*/

} );