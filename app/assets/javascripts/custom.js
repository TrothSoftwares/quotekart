

jQuery(function()
{
	
	
	/* FOR QUOTE FORM */
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
    /* END OF QUOTE FORM */
    
    
	/* FOR MULTISELECT IN ADMIN SENT TO DEALERS  */
	$('#sent_quotes').multiselect({
	    enableFiltering: true,
	    //includeSelectAllOption: true
	});
	/*---------  END OF TABLE LISTING QUOTES -----------*/
	
	
	
});






$(document).ready(function() {
	
	

	
	
	/* FOR TABLE LISTING QUOTE (DATATABLES) */
$('#quotes_table').DataTable({
		"pageLength": 2, 
		
});
/*---------  END OF TABLE LISTING QUOTES -----------*/





} );