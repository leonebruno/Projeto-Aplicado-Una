$.ajax({
	url: 'http://http://qrschool.hol.es/_includes/aluno-login.php',
	type: 'POST',
	//dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
	data: {ra: '31611542', password: '31611542'},
})
.done(function(data) {
	
})
/*.fail(function() {
	console.log("error");
})
.always(function() {
	console.log("complete");
})*/;
