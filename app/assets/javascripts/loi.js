$(document).ready(function(){
	
	// Smart Labels
	$('.input.smart_label').each(function(i,el){
		
		label = $($(el).find('label')[0]).addClass('js');
		label.text(label.text().replace('*',''))
		
		if($(el).hasClass('text')) { input = $($(el).find('textarea')[0]);
		} else { input = $($(el).find('input')[0]); }
		
		label.bind('click',function(ev){ $(this).siblings('input')[0].focus(); });
		input.bind('focus',function(ev){ $($(this).siblings('label')[0]).hide(); });
		input.bind('blur',function(ev){ if($(this).val()=='') { $($(this).siblings('label')[0]).show(); }});
		if(input.val()!='') { $(input.siblings('label')[0]).hide(); }
		
	});

	// Smooth scroll inline links
	/*$('a[href*=#]').click(function() {
	  scrollToElement(this.hash)
	  return false;   
	});*/
	
	// Externals
	$('a:external').click(function(e){
	  e.preventDefault();
	  window.open(this.href);
	});
	
	// Content slider
	$('#archetypes').easyPaginate({step:1})
	
	// Homepage banners
	$('.banners').easyPaginate({step:1})
	
	// Homepage banners
	$('.toolkit-slides').easyPaginate({step:1, numeric: false})
	
	// Link blocks
	$('.person_block, .post_block').each(function(i,el){
	  
	  $(el).find('.media p').hide();
	  
	  $(el).bind('mouseenter',function(e){
	    $(this).addClass('active');
	    $(el).find('.media p').show();
	  });
	  
	  $(el).bind('mouseleave',function(e){
	    $(this).removeClass('active');
	    $(el).find('.media p').hide();
	  })
	  
	  $(el).bind('click',function(ev){
	    ev.preventDefault();
	    ev.stopPropagation();
	    if($(this).find('.media h2 a:external').length>0) {
	      window.open($(this).find('.media h2 a').attr('href'))
	    } else {
	      window.location = $(this).find('.media h2 a').attr('href');
	    }
	  })
	  
	});
	
	// Toolkit link blocks 
	$('.toolkit-block').each(function(i,el){
	  
	  $(el).bind('mouseenter',function(e){
	    $(this).addClass('active');
	  });
	  
	  $(el).bind('mouseleave',function(e){
	    $(this).removeClass('active');
	  })
	  
	  $(el).bind('click',function(ev){
	    ev.preventDefault();
	    ev.stopPropagation();
	    window.location = $(this).find('.option-view-white a').attr('href');
	  })
	  
	})
	
	// Modals
	$("a[rel*=leanModal]").leanModal({closeButton: ".modal_close", overlay: 0.01});
		
});

function scrollToElement(element) {
	var targetPosition=$(element).offset().top-10;
  $('html:not(:animated),body:not(:animated)').animate({ scrollTop: targetPosition }, {
    duration: 500, 
    easing:'swing'
  });
}

$.expr[':'].external = function(obj){
    return !obj.href.match(/^mailto\:/)
           && (obj.hostname != location.hostname || /.pdf$/.test(obj.href))
           && !obj.href.match(/^javascript\:/)
           && !obj.href.match(/^$/)
};
