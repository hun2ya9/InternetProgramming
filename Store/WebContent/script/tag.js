(function($) {
	$(function() {
		var $window = $(window), $body = $('body');
		
		$('.gallery').each(function() {
					var $gallery = $(this), $content = $gallery.find('.content');
					
					$gallery.each(function() {
						var $this = $(this), $tabs = $this.find('.tabs a'), $media = $this.find('.media');
						
						$tabs.on('click',function(e) {
							var $this = $(this), tag = $this.data('tag');
								e.preventDefault();
								$tabs.removeClass('active');
								$this.addClass('active');
								
								$media.fadeOut('fast').each(function() {
									var $this = $(this);
									if ($this.hasClass(tag))
										$this.fadeOut('fast').delay(200).queue(function(next) {$this.fadeIn();next();});
								});
						});
						});
				});
	});
})(jQuery);