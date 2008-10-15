$.app = $.app || {}; // Data buffering object, see application layout for pre-population

$.metadata.setType("attr", "metadata");

$(document).ready(function() { 
  $.loadTemplates();
  load_ui(); // Load all dashboard UI features
});

function get_entities_for (owner_type, owner_id, entity_type, entity_id, callback) {
  $.app[owner_type] = $.app[owner_type] || {};
  $.app[owner_type][owner_id] = $.app[owner_type][owner_id] || {};
  $.app[entity_type] = $.app[entity_type] || {};
  
  url = "/"+owner_type+"/"+owner_id+"/"+entity_type+"/"
  if(entity_id) { url += entity_id; }
  $.getJSON(url, null, function(payload) {
    if(entity_id) {
      // Buffer explicitely
      $.app[entity_type][entity_id] = payload;
    } else {
      $.each(payload, function(index,entity) {
       $.app[entity_type][entity.id] = entity; 
      });
      $.app[owner_type][owner_id][entity_type] = payload
    }

    if(callback) { callback(owner_type,owner_id,entity_type,entity_id,payload); }
  });
}

function get_entities (options, callback) {  
  url = '/';
  if(options.owner_class) { 
    url += options.owner_class + '/';
    set($.app[options.owner_class]);
    if(options.owner_id) {
      url += options.owner_id + '/';
      set($.app[options.owner_class][options.owner_id]);
    }
  }

  if(options.entity_class) {
    url += options.entity_class + '/';
    set($.app[options.entity_class]);
    if(options.entity_id) {
      url += options.entity_id + '/';
      set($.app[options.entity_class][options.entity_id]);
    }
  } else {
    url = options; // If no entity_class is specified options should be a string.
  }
  
  $.getJSON(url, null, function(response) {
    $.app[entity_class] = response;
    if(callback) { callback(response); }
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

function find(list,field,value) {
  list = list || [];
  item = null; // So that it's from the outer scope.
  $.each(list, function(index,entity) {
    if(entity && (entity[field] == value)) {
      item = entity;
    }
  });
  return item;
}
