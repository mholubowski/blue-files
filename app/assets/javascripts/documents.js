// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
// # jQuery ->
// # 	$("#documentsTable").dataTable
// # 		sPaginationType: "full_numbers"
// # 		bJQueryUI: true

// # 	#fixes disable_with bug for form submission 
// # 	#TODO this might break for other ajax forms
// # 	$('form[data-remote]').on 'ajax:remotipartSubmit', ->
// # 	  submit_btn = $('input[type=submit]', this)
// # 	  submit_btn.after('<div class="saving" style="display: block;"></div>')
// # 	  submit_btn.attr('disabled', 'disabled').attr('value', submit_btn.data('disable-with'))
// # 	  submit_btn.addClass('btn-warning')

$(function(){
	
	$("#documentsTable").dataTable(
		{ sPaginationType: "full_numbers", bJQueryUI: true }
		);

	$('form[data-remote]').on('ajax:beforeSend, ajax:remotipartSubmit', function() {
		var submit_btn;
		submit_btn = $('input[type=submit]', this);
		submit_btn.after('<div class="saving" style="display: block;"></div>');
		submit_btn.attr('disabled', 'disabled').attr('value', submit_btn.data('disable-with'));
		return submit_btn.addClass('btn-warning');
	});

	
	$('.addThisForm').on('click', function(){
		var addForm = $(this).parent();
		addForm.animate({right:'-=900'}, 457,'swing');
		addForm.removeClass('hiddenDocForm');
		$(this).hide(100);
	})


	$('#reloadButton').click(function() {
		if (confirm('Reload?')){
			location.reload(true);
		}
	});

})
