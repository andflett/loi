//= require jquery

//= require jquery.ui.all

//= require jquery_ujs
//= require active_admin/application

//= require autocomplete-rails

//= require sir-trevor
//= require sir-trevor/blocks/heading
//= require sir-trevor/blocks/markdown
//= require sir-trevor/blocks/embed

$(document).ready(function(){
		
		$(function(){
						
			if($('.sir-trevor-area').length> 0) {
		  	
				var editor = new SirTrevor.Editor({ 
					el: $('.sir-trevor-area'),
					blockTypes: ["Text", "Heading", "Quote", "Ul", "Tweet", "Image", "Video", "Embed"]
				});
								
			}
			
		});
		
});