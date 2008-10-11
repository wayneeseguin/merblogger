/**
 * .serverCookieJar - Server Cookie Jar Plugin
 *
 * Version: 1.0
 * Updated: 2007-09-14
 *
 * Used to store objects, arrays or multiple values in one cookie, under one name
 *
 * Copyright (c) 2007 James Dempster (letssurf@gmail.com, http://www.jdempster.com/category/jquery/cookieJar/)
 *
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 **/

/**
 * Requirements:
 * - jQuery (John Resig, http://www.jquery.com/)
 * - toJSON (Mark Gibson, http://jollytoad.googlepages.com/json.js)
 **/
(function(A){A.serverCookieJar=function(C,B){if(!A.parseJSON){return false}if(!A.toJSON){return false}return new function(){function E(H){if(typeof console!="undefined"&&typeof console.log!="undefined"){console.log("cookiejar:"+D.cookieName+" "+H)}else{alert(H)}}function F(){if(D.options.debug){E("save "+A.toJSON(D.cookieObject))}var H=A.ajax({type:"POST",url:"jquery.servercookiejar.php",data:{name:D.cookieName,action:"set",data:A.toJSON(D.cookieObject)},global:false,async:false}).responseText;return A.parseJSON(H,true)}function G(){if(D.options.debug){E("load "+D.cookieName)}var H=A.ajax({type:"POST",url:"jquery.servercookiejar.php",data:{name:D.cookieName,action:"get"},global:false,async:false}).responseText;if(typeof H=="string"){if(D.options.debug){E("load "+H)}D.cookieObject=A.parseJSON(H,true)}else{if(D.options.debug){E("load new")}D.cookieObject={};F()}}this.set=function(H,I){if(D.options.debug){E("set "+H+" = "+I)}D.cookieObject[H]=I;return F()};this.get=function(H){if(!D.options.cacheCookie){G()}if(D.options.debug){E("get "+H+" = "+D.cookieObject[H])}return D.cookieObject[H]};this.remove=function(H){if(D.options.debug){E("remove "+H)}if(typeof H!="undefined"){delete (D.cookieObject[H])}else{D.setFromObject({})}return F()};this.setFromObject=function(H){if(typeof H=="object"){if(D.options.debug){E("setFromObject")}D.cookieObject=H;return F()}};this.toObject=function(){if(D.options.debug){E("toObject")}return D.cookieObject};this.toString=function(){if(D.options.debug){E("toString = "+A.toJSON(D.cookieObject))}return A.toJSON(D.cookieObject)};this.destroy=function(){if(D.options.debug){E("destroy")}D.cookieObject={};return A.cookie(D.cookieName,null,D.options.cookie)};this.construct=function(I,H){D.options=A.extend({cookie:{expires:365},cacheCookie:true,cookiePrefix:"jqCookieJar_",debug:false},H);D.cookieName=D.options.cookiePrefix+I;G()};var D=this;D.construct(C,B)}}})(jQuery);