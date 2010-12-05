$(function() {
	$("#users .pagination a").live("click", function() {
		$.getScript(this.href)
		return false;
	});
	
	$("#users_search_form input").keyup(function() {
		$.get($("#users_search_form").attr("action"), $("#users_search_form").serialize(), null, "script");
		return false;
	});
};)