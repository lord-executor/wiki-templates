
hljs.initHighlightingOnLoad();

(function ($) {
	$(document).ready(function () {
		// set page title to first H1 content
		$("title").text($("h1").first().text());
		
		var segments = location.pathname.split("/");
		if (segments[segments.length - 1] == "")
			segments.pop()
		var crumbs = $.map(segments, function (value, index) {
			var link = $("<a></a>").attr("href", segments.slice(0, index + 1).join("/"));
			var item = $("<li></li>").append(link);
			
			if (index == 0) {
				link.html("<i class=\"icon-home\"></i>");
				link.attr("href", "/");
			} else {
				link.text(value);
				item.prepend("<i class=\"separator icon-arrow-right\"></i>");
			}
			
			
			return item;
		});
		$("#breadcrumb ul").append(crumbs);
	});
})(jQuery);
