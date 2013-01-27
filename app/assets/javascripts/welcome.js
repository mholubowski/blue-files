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
	
	$('.threePlans').on("click", function(){
		$('.threePlans').removeClass('active');
		$(this).addClass('active');

		if (this.id === "plan1"){
			$('#files-slider').slider("value", 50)
			changeFilesPrice(50);
		}
		else if (this.id === "plan2"){
			$('#files-slider').slider("value", 250)
			changeFilesPrice(250);
		}
		else if (this.id === "plan3"){
			$('#files-slider').slider("value", 900)
			changeFilesPrice(1000);
		}
	});

});

changeFilesPrice = function(val){
	$('.threePlans').removeClass('active');
	if (val <= 50){
		$('#plan1').addClass('active');
		$('#numberOfFiles span').html(val);
		setFree();
		return;
	}
	else if (val > 50 && val <= 250){
		$('#plan2').addClass('active');
	}
	else {
		$('#plan3').addClass('active');
	}

	$('#numberOfFiles span').html(val);
	users = $('#users-slider').slider("value")
	if (users === 0){
		users = 1;
	}
	base  = ( val > 250 ? 39.95 : 19.95 )
	price = base / users
	$('#price').html( "$"+ price.toFixed(2) );
	$('#per').html( "per user / month" );

}

setFree = function(){
	$('#price').html( "free trial" );
	$('#per').html( "for 30 days" );
}

changeUsersPrice = function(val){
	files = $('#files-slider').slider("value");
	if (val === 0){
		val = 1;
	}
	if (files <= 50){
		setFree();
		return;
	}
	$('#numberOfUsers span').html(val);
	base  = ( files > 250 ? 39.95 : 19.95 )
	price = base / val
	$('#price').html( "$"+ price.toFixed(2) );
	$('#per').html( "per user / month" );
}

setFilesLabelPosition = function(handle) {
	// var thumb = $($('#files-slider').children('.ui-slider-handle'));
	var label = $('#files-value');
	label.css('top', handle.offset().top + label.outerHeight(true));
	label.css('left', handle.offset().left - (label.width() - handle.width())/ 2);  
}
