$.app = $.app || {}; // Data buffering object, see application layout for pre-population

$.metadata.setType("attr", "metadata");

$(document).ready(function() { 
  $.loadTemplates();
  load_ui(); // Load all dashboard UI features
});

function get_entities_for (owner_type, owner_id, entity_type, entity_id, callback) { 
  $.getJSON("/"+owner_type+"/"+owner_id+"/"+entity_type+"/"+entity_id, null, function(response) {
    $.app[owner_type] = $.app[owner_type] || {};
    $.app[owner_type][owner_id] = $.app[owner_type][owner_id] || {};
    $.app[owner_type][owner_id][entity_type] = response.payload;
    if(callback) { callback(response.payload); }
  });
}

function get_entities (entity_type, callback) { 
  $.getJSON("/" + entity_type, null, function(response) {
    $.app[entity_type] = response.payload;
    if(callback) { callback(response.payload); }
  });
}

function get_entity (entity_type, entity_id, callback) {  
  $.getJSON("/" + entity_type + "/" + entity_id, null, function(payload) {
    $.app[entity_type] = $.app[entity_type] || {};
    $.app[entity_type][entity_id] = response.payload
    if(callback) { callback(response.payload); }
  });
}

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
