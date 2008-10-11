$.app = $.app || {}; // Data buffering object, see application layout for pre-population

$.metadata.setType("attr", "metadata");

$(document).ready(function() { 
  $.loadTemplates();
  load_ui(); // Load all dashboard UI features
});

function logout() {
  answer = confirm("Are you sure you wish to logout?");
  if(answer) {
    window.location = "/logout";
  }
}

// Debugging console helper.
$(document).ajaxError(function(){
  if (window.console && window.console.error) {
    console.error(arguments);
  }
});

function log(message, type) {
  if(type == null) { type="log" }
  if(typeof console != "undefined") {
    console[type](message);
  } 
}

