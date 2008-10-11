/*
 * JavaScript Pretty Date
 * Copyright (c) 2008 John Resig (jquery.com)
 * Modified/Updated by Sudara to uhhh, work
 * Licensed under the MIT license.
 */

// Takes an ISO time and returns a string representing how
// long ago the date represents.
function prettyDate(time){
	var time_without_zone = time.replace(/-/g,"/").replace(/[TZ]/g," ").replace(/((\+|\-)\d{2}:\d{2})/g,"");
	var date = new Date(time_without_zone);
	var now = new Date();
	var diff = ((now.getTime() - date.getTime()) / 1000);
	var day_diff = Math.floor(diff / 86400);

	if ( isNaN(day_diff) || day_diff < 0 )
		return;
			
	return day_diff == 0 && (
			diff < 60 && "a few seconds ago" ||
			diff < 120 && "1 minute ago" ||
			diff < 3600 && Math.floor( diff / 60 ) + " minutes ago" ||
			diff < 7200 && "1 hour ago" ||
			diff < 86400 && Math.floor( diff / 3600 ) + " hours ago") ||
		day_diff == 1 && "Yesterday" ||
		day_diff < 7 && day_diff + " days ago" ||
		day_diff < 31 && Math.ceil( day_diff / 7 ) + " weeks ago" ||
		 Math.ceil( day_diff / 30 ) + " months ago"
}

// Call this function to 'update' the pretty date...
// The title of the jQuery object should contain the date
if ( typeof jQuery != "undefined" )
	jQuery.fn.prettyDate = function(){
		return this.each(function(){
			var date = prettyDate($(this).attr('title'));
			if ( date )
				jQuery($(this)).html( date );
		});
	};