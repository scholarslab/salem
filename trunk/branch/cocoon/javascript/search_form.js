$(function () {
	if($('#range') .children("option:selected") .attr('value') == 'from'){
		$('.toDate_hidden') .attr('class', 'toDate_visible');
	}
		
	$('#range') .change(function(){
		if($(this) .children("option:selected") .attr('value') == 'from'){
			$('.toDate_hidden') .attr('class', 'toDate_visible');
		}
		else{$('.toDate_visible') .attr('class', 'toDate_hidden');}
	});

	$('#search_button') .click(function(){
		var range = $('#range') .attr('value');
		var year = $('#year').attr('value');
		var month = $('#month').attr('value');
		var day = $('#day').attr('value');
		var date;
		var search_text = $('#q') .attr('value');
				
		if (range == 'exactly'){
			date = year + month + day;
		}
		else if (range == 'after'){
			date = '[' + year + month + day + ' TO *]';
		}
		else if (range == 'before'){
			date = '[* TO ' + year + month + day + ']';
		}
		else if (range == 'from'){
			var year2 = $('#year2').attr('value');
			var month2 = $('#month2').attr('value');
			var day2= $('#day2').attr('value');
		
			date = '[' + year + month + day + ' TO ' + year2 + month2 + day2 + ']';
		}
		else{ date = 'none';};
		alert (date);
		
		if (date != 'none'){
			if (search_text == ''){
				$('#q') .attr('value', 'date:' + date);
			}
			else{
				$('#q') .attr('value', search_text + ' AND date:' + date);
			}
		}
	});
	
	
});