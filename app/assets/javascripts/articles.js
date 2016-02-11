var ready;
ready = function() {
	
	$("td[data-link]").click(function() {
		window.location = $(this).data("link")
	})

};

$(document).ready(ready);
$(document).on('page:load', ready);
