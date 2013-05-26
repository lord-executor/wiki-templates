
(function ($) {
	$(document).ready(function () {
		// set page title to first H1 content
		$("title").text($("h1").first().text());
	});
})(jQuery);
