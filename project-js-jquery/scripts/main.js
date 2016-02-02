$(document).ready(function() {

	//Variables and Functions
	// Grid-Generator
	var createDivs = function (n){
		var boxsize = Math.floor((960 / parameter) - 2);
		var s = parseInt(parameter);
		for (var i = 0; i < n ; i++) {
			if (i === s) {
				// console.log(s);
				$('#container').append('<div class="clearleft"></div>');
				s = s + parseInt(parameter);
				console.log(s);
			}
			else $('#container').append('<div></div>');		
		}
		$('#container div').css({
				'height': boxsize.toString() + 'px',
				'width': boxsize.toString() + 'px',
				'display': 'inline-block',
				'background-color': '#000',
				'border': '1px solid #cee',
				'float': 'left'
			});
	};

	//Random-color-generator

	function getRandomColor() {
    var letters = '0123456789ABCDEF'.split('');
    var color = '#';
    for (var i = 0; i < 6; i++ ) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

	//main program

	$('#settings').after('<div id="container"></div>');
	$('#settings').on('click', '#butt', function() {
		$('#container').text('');
		parameter = $('#in').val();
		createDivs(parameter * parameter);
	});
	$('#settings').on('click', '#butt2', function() {
		$('#container').text('');
	});
	$('#container').on('mouseenter', 'div', function() {
		$(this).css({
			'background-color': getRandomColor()
			
		});
	});
});