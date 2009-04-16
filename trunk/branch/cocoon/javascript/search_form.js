$(function () {
	$('#search_button') .click(function(){
		var year = $('#year').attr('value');
		var month = $('#month').attr('value');
		var day = $('#day').attr('value');
		var date;
		var search_text = $('#q') .attr('value');
				
		if(year != 'any'){
			if(month != 'any'){
				if(day != 'any'){
					date = year + month + day;
				}
				else {
					date = '[' + year + month + '01' + ' TO ' + year + month + '31' + ']';
				}
			}
			else{
				if(day != 'any'){
					date = '[' + year + '01' + day + ' TO ' + year + '12' + day + ']';
				}
				else {
					date = '[' + year + '01' + '01' + ' TO ' + year + '12' + '31' + ']';
				}
			}
		}
		else{
			if(month != 'any'){
				if(day != 'any'){
					date = '[' + '1692' + month + day + ' TO ' + '1693' + month + day + ']';
				}
				else {
					date = '[' + '1692' + month + '01' + ' TO ' + '1693' + month + '31' + ']';
				}
			}
			else{
				if(day != 'any'){
					date = '[' + '1692' + '01' + day + ' TO ' + '1693' + '12' + day + ']';
				}
				else {
					date = 'none';
				}
			}
		}
		
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