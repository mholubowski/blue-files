# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$("#documentsTable").dataTable
		sPaginationType: "full_numbers"
		bJQueryUI: true

	#fixes disable_with bug for form submission 
	$('form[data-remote]').on 'ajax:remotipartSubmit', ->
	  submit_btn = $('input[type=submit]', this)
	  submit_btn.after('<div class="saving" style="display: block;"></div>')
	  submit_btn.attr('disabled', 'disabled').attr('value', submit_btn.data('disable-with'))
	  submit_btn.addClass('btn-warning')
