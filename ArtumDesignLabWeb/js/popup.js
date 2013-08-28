$(document).ready(function(){
   //align element in the middle of the screen
	$.fn.alignCenter = function () {
		//get margin left
		var marginLeft = - $(this).width()/2 + 'px';
		//get margin top
		var marginTop = - $(this).height()/2 + 'px';
		//return updated element
		return $(this).css({'margin-left':marginLeft, 'margin-top':marginTop});
	};
   
//close pop-up box
	function closePopup(){
		$('#popupOverlay').hide();
		$('.popup').hide();
	};
 
//open pop-up
	function showPopup(){   
		$('#popupOverlay').height($(document).height()).fadeTo('slow', 0.7);
	};

	$('#popupOverlay').click(function(){
		closePopup();
	});
	
	
	$('.close-popup').click(function(){
		closePopup();
	});

});
