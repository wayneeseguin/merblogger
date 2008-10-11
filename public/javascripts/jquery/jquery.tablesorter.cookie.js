/**
 * .tablesorter.cookie - Cookie Jar Widget for Tablesorter 2
 *
 * Version: 1.0
 * Updated: 2007-08-11
 *
 * Store, then restores the sort order of tables from tablesorter using cookieJar
 *
 * Copyright (c) 2007 jdempster (letssurf@gmail.com, http://www.jdempster.com/category/jquery/tablesorterCookie/)
 *
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 **/

/**
 * Requirements:
 * - jQuery (John Resig, http://www.jquery.com/)
 * - tablesorter (Christian Bach, http://tablesorter.com/)
 * - cookieJar (James Dempster, http://www.jdempster.com/category/jquery/cookieJar/)
 **/
(function($) {
    $.tablesorter.addWidget({
        id: 'cookie',
        format: function(table) {
            var sortList = table.config.sortList;
            var tablesorterCookieJar = $.cookieJar('tablesorter', {
	        cookie: {
                    path: '/'
		}
	    });
            if ( sortList.length > 0) {
                tablesorterCookieJar.set($(table).attr('id'), sortList);
            } else {
               var sortList = tablesorterCookieJar.get($(table).attr('id'));
               if (sortList && sortList.length > 0) {
                    jQuery(table).trigger('sorton', [sortList]);
               }
            }
        }
    });
})(jQuery);
