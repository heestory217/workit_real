/**
 * check.js
 */
 
$(document).ready(function() {
	$('#chkAll').click( function() {
		$('tbody input[type=checkbox]').prop( 'checked', this.checked );
	} );
});
