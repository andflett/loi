//= require jquery

//= require jquery.ui.core
//= require jquery.ui.widget
//= require jquery.ui.mouse
//= require jquery.ui.position

//= require jquery.ui.accordion
//= require jquery.ui.autocomplete
//= require jquery.ui.button
//= require jquery.ui.datepicker
//= require jquery.ui.menu
//= require jquery.ui.spinner
//= require jquery.ui.tabs
//= require jquery.ui.tooltip

//= require jquery_ujs
//= require active_admin/application

//= require autocomplete-rails

//= require sir-trevor
//= require sir-trevor/blocks/heading
//= require sir-trevor/blocks/markdown
//= require sir-trevor/blocks/embed

$(document).ready(function(){
		
		// Trevs
		$(function(){
			if($('.sir-trevor-area').length> 0) {
				var editor = new SirTrevor.Editor({ 
					el: $('.sir-trevor-area'),
					blockTypes: ["Text", "Heading", "Quote", "Ul", "Image", "Video", "Embed"]
				});					
			}
		});
		
		// Post types
		$('#podcast_fields').hide();
		$('#post_type_id').bind('change',function(ev){
		  if($(this).val()==6) {
		    $('#podcast_fields').show();
		  } else {
		    $('#podcast_fields').hide();   
		  }
		});
		
		
});