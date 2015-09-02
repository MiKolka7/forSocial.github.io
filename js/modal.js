$(document).ready(function() {
	$('.login').click(function(){
		$('.modal-layout').addClass('is-visible');
	})

	$('.modal-layout').click(function(e){
		e = e || event;
		if(e.target == this){
			$('.modal-layout').removeClass('is-visible');
		};
	})
});