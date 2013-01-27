// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function(){
	$('#myTab a').click(function (e) {
		e.preventDefault();
		$(this).tab('show');
	})
	
})

// ----- PRICING ------

$(function(){

	$('#files-slider').slider({ animate: "fast",  min: 0, max: 1000, step: 50, value: 200, slide: function(e,ui){
		var handle = ui.handle;
		changeFilesPrice(ui.value); } 
	});

	$('#users-slider').slider({ animate: "fast",  min: 0, max: 200, step: 10, value: 70, slide: function(e,ui){
		changeUsersPrice(ui.value); } 
	});
	
});

changeFilesPrice = function(val){
	$('#numberOfFiles span').html(val);
	users = $('#users-slider').slider("value")
	if (users === 0){
		users = 1;
	}
	base  = ( val >= 500 ? 29.99 : 19.99 )
	price = base / users
	$('#price').html( "$"+ price.toFixed(2) );
}

changeUsersPrice = function(val){
	files = $('#files-slider').slider("value");
	if (val === 0){
		val = 1;
	}
	$('#numberOfUsers span').html(val);
	base  = ( files >= 500 ? 29.99 : 19.99 )
	price = base / val
	$('#price').html( "$"+ price.toFixed(2) );
}

setFilesLabelPosition = function(handle) {
	console.log(handle.css('left'));
	// var thumb = $($('#files-slider').children('.ui-slider-handle'));
	var label = $('#files-value');
	label.css('top', handle.offset().top + label.outerHeight(true));
	label.css('left', handle.offset().left - (label.width() - handle.width())/ 2);  
}