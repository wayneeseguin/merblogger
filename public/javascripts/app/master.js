$.app = $.app || {}; // Data buffering object, see application layout for pre-population

$.metadata.setType("attr", "metadata");

$(document).ready(function() { 
  $.loadTemplates();
  load_ui(); // Load all dashboard UI features
});

function get_entities_for (owner_type, owner_id, entity_type, entity_id, callback) {
  url = "/"+owner_type+"/"+owner_id+"/"+entity_type+"/"
  if(entity_id) { url += entity_id; }
  $.getJSON(url, null, function(payload) {
    $.app[owner_type] = $.app[owner_type] || {};
    $.app[owner_type][owner_id] = $.app[owner_type][owner_id] || {};
    $.app[owner_type][owner_id][entity_type] = payload;
    if(callback) { callback(owner_type,owner_id,entity_type,entity_id,payload); }
  });
}

function get_entities (entity_type, callback) { 
  $.getJSON("/" + entity_type, null, function(payload) {
    $.app[entity_type] = payload;
    if(callback) { callback(payload); }
  });
}

function get_entity (entity_type, entity_id, callback) {  
  $.getJSON("/" + entity_type + "/" + entity_id, null, function(payload) {
    $.app[entity_type] = $.app[entity_type] || {};
    $.app[entity_type][entity_id] = payload
    if(callback) { callback(payload); }
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

function sort_by(list, field) {
  sorted_list = [];
  $.each(list, function(index, item) {
    sorted_list[item[field]] = item;
  });
  return sorted_list;
}

function find_by_id(list,field,value) {
  result = {};
  for(index in list) {
    if(list[index][field] == value) {
      result = list[index];
    }
  }
  return result;
}
