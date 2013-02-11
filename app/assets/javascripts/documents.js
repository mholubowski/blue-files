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


$('#add-more').bind("ajax:complete", function(){
	$('form').enableClientSideValidations();
})


	window.enableTypeahead = function(){
		console.log('step1');
		// $('.document_category').each(function(idx){
		// 	$(this).typeahead({ source: list_of_majors, items: 4 });
		// })
		$('.document_category').last().typeahead({ source: list_of_majors, items: 4 });
		$('.document_sub_category').typeahead({ source: list_of_courses, items: 4 });
		console.log('typahead enabled!');
  }
	
	$("#documentsTable").dataTable(
	{ 
		  // sPaginationType: false,
		  "bScrollInfinite": true,
		  "sScrollY":   "500px",
		  "bJQueryUI":  true,
		  "bStateSave": true,
		  "iDisplayLength":  50   }
		  );

	$('form[data-remote]').on('ajax:beforeSend, ajax:remotipartSubmit', function() {
		var submit_btn;
		submit_btn = $('input[type=submit]', this);
		submit_btn.after('<div class="saving" style="display: block;"></div>');
		submit_btn.attr('disabled', 'disabled').attr('value', submit_btn.data('disable-with'));
		return submit_btn.addClass('btn-warning');
	});

	$(document).ready(function(){
		// TODO Do this without the shitty js hack
		// $('.addThisForm').first().click();
		// enableTypeahead();


});
	
	// $('.addThisForm').on('click', function(){
	// 	var addForm = $(this).parent();
	// 	addForm.animate({right:'-=900'}, 457,'swing');
	// 	addForm.removeClass('hiddenDocForm');
	// 	$(this).hide(100);
	// })


	$('#reloadButton').click(function() {
		if (confirm('Reload?')){
			location.reload(true);
		}
	});

	$('#convert-link').click(function(ev){
		window.open('http://www.techiecorner.com/311/how-to-convert-doc-to-pdf-in-mac-os-x/',
			'Continue_to_Application','width=750,height=400');
		ev.preventDefault();
		return false;
	})

})

