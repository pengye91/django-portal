function showhideupdown(id){
	if ($('div#' + id).is(":hidden")) {
		$('#a' + id).text('Zwiń');
		$('div#' + id).slideDown("slow");
	} else {
		$('#a' + id).text('Rozwiń');
		$('div#' + id).slideUp("fast");
	}
}
