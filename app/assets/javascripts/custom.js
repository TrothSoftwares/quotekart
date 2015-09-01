
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