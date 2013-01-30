$(document).ready(function(){
	
	// Smart Labels
	$('.input.smart_label').each(function(i,el){
		
		label = $($(el).find('label')[0]).addClass('js');
		label.text(label.text().replace('*',''))
		
		if($(el).hasClass('text')) {
			input = $($(el).find('textarea')[0]);
		} else {
			input = $($(el).find('input')[0]);
		}
		
		input.bind('focus',function(ev){ $($(this).siblings('label')[0]).hide();  });
		
		input.bind('blur',function(ev){
			if($(this).val()=='') {
				$($(this).siblings('label')[0]).show()
			}
		});
		
		if(input.val()!='') { $(input.siblings('label')[0]).hide(); }
		
	});

	// Smooth scroll inline links
	$('a[href*=#]').click(function() {
	  scrollToElement(this.hash)
	  return false;   
	});
	
});

function scrollToElement(element) {
	var targetPosition=$(element).offset().top-10;
  $('html:not(:animated),body:not(:animated)').animate({ scrollTop: targetPosition }, {
    duration: 500, 
    easing:'swing'
  });
}
