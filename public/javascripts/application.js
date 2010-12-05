$(function() {
	$("#usersArea .pagination a").live("click", function() {
		$.getScript(this.href)
		return false;
	});
	
	$("#users_search_form input").keyup(function() {
		$.get($("#users_search_form").attr("action"), $("#users_search_form").serialize(), null, "script");
		return false;
	});
	
	$("#followForm").submit(function() {
		$.get(this.action, $(this).serialize(),null,"script");
		return false;
	});
	
	$("#unfollowForm").submit(function() {
		$.get(this.action, $(this).serialize(),null,"script");
		return false;
	});
	
});