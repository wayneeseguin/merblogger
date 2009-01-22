/* Authors: Dennis J. Bell && Wayne E. Seguin
 * Licence: MIT
 * Name:    jQuery Models.
 * About:   REST style models objects for jQuery.
 */

Model = Class.extend({

/* Public API
 *
 *   Methods should remain availble on each next release. 
 *   Only subject to change with major release revisions and with notice if posisble.
 */

/* intialize
 *     Method used to setup the model. Overwrite this in extended models and be sure to call parent(id);
 */
  initialize: function(id) {
  log("Model initialize")
    this.id = id;

    //Private Members
    this._attributes = {id: id};

    // ???
    var load = function(data) {
      this._attributes = data;
      for(key in data) {
        // TODO: Skip if is public API method such as: initialize, parent
        if(key != "initialize" && key != "parent") {
          this[key] = data[key];
        }
      }

      if(this._after_load) {
        this._after_load();
        this._after_load = null;
      }
    }

    this._read();
  },

/*
 *   parent
 *     Used to call the parent method with the same name. Same concept as 'super' in Ruby.
 */

/*   _url
 *     Base URL resource is available at.
 */
  _url: function() {
    url = '/';

    if(this.owner && this.owner._resource) { 
      url += this.owner._resource + '/';
      $.app[this.owner._resource] = $.app[this.owner._resource] || {};
      if(this.owner_id) {
        url += this.owner_id + '/';
        $.app[this.owner._resource][this.owner_id] = $.app[this.owner._resource][this.owner_id] || {};
      }
    }

    url += this._resource;
    $.app[this._resource] = $.app[this._resource] || {};

    if(this._attributes["id"]) {
      url += '/' + this._attributes["id"] + '/';
      $.app[this._resource][this._attributes["id"]] = $.app[this._resource][this._attributes["id"]] | {};
    } else {
      url = this._resource; // If no id is specified options should be the resource.
    }
    return url;
  },

/* _resource
 *   Underlying plural model name from the backend. 
 *   Can be thought of similar to the 'table name'.
 *   This is set when you define your model.
 */

/*   _read()
 *     Read (fetch) the data from the backend URL, REST based construction. 
 *     Currently only one level of ownership is enabled.
 */
  _read: function(callback) {
    if (callback != undefined && typeof(callback) == "function") {
      this._after_load = callback;
      $.getJSON(this._url(), null, load);
    } else {
      // get the data synchronously and return
      this._after_load = null;
      response = $.ajax({ type: "GET", url: this._url(), dataType: "json", async: false });
      this._load(eval("(" + response.responseText + ")"));
    }
  },

/* _load()
 *   Load the attributes that do not conflict with public API methods into the object directly.
 *   This buffers the object such that a successive call will not query the backend. 
 *   To force a query after this call _reload().
 */
  _load: function(attributes) {
    // Go through and unset the existing data.
    data = this._attributes;
    for(key in data) {
      if(key != "initialize" && key != "parent") {
        this[key] = null;
      }
    }
    // Now load again.
    for(name in attributes) {
      if(name != "initialize" && name != "parent") {
        this[name] = attributes[name];
        this._attributes[name] = attributes[name];

      }
    }
    true;
  },

/* _reload()
 *   Re-fetch from the backend, remove attributes from the object and then load the attributes.
 */
  _reload: function() {
    // Go through and unset the existing data.
    data = this._attributes;
    for(key in data) {
      if(key != "initialize" && key != "parent") {
        this[key] = null;
      }
    }
    // Now load again.
    this._read();
  },

/* _update_attributes()
 *   Update a set of attributes, marking them dirty. Save to the backend when done.
 */
  _update: function(hash) {
    // Send a PUT to the object's URL with attributes to update, "dirty".
    for(key in hash) {
      this._set(key,hash[key]);
    }
    this._save();
  },

/* _set()
 *   Update an attribute, mark it as dirty for later saving.
 */
  _set: function(key,value) {
    // Set the value and store the key in the "dirty list"
    if (this._attributes[key] == undefined) {
      // raise error
    }
    this._attributes[key] = value;
    return this._attributes[key];
  },

/*
 * _get()
 *   Get the specified attribute from the attributes hash.
 *   Retrieves any attribute that does not conflict with a public API method name.
 */
  _get: function(name) {
    refresh = arguments[1] 
    return this._attributes[name]
  },

/*   _save()
 *     Save the record to the backend if any attributes are dirty. Update any views / return the record itself.
 */
  _save: function() {
    // save to backend if dirty.
  },

/*   _delete()
 *     Delete the record. 
 *     Sends a DELETE request to the resource url.
 *     Method returns true if successful, an error message from the backend otherwise.
 */
  _delete: function() {
    // Delete the record in the backend, destroy buffers, views, and forms.
  },

/*   _view()
 *     Render teh jQuery Template for the view of the model.
 */
  _view: function(options) {
    return $.templates[self._resource + "_view"](self._attributes);
  },

/*   _form()
 *     Render teh jQuery Template for the form of the model.
 */
  _form: function(options) {
    return $.templates[self._resource + "_form"](self._attributes);
  },

/*   _changed()
 *     true or false based on whether or not attributes have been updated. 
 *     Must use the _update/_set_attribute(s) methods in order for this to 
 *     be used properly instead of direct assignment.
 */
  _changed: function(options) {
    var changed = false;
    for (name in this._attributes) {
      if(this[name] != this._attributes[name]) {
        changed = true;
        break;
      }
    }
    return changed;
  },

/*   _to_s()
 *     Used to generate the display for the object. Defaults to the id for the record.
 *     Override in extended model classes as needed.
 */
  _to_s: function() { return this.id; },

/*
 * Private API
 *
 *   WARNING: Subject to change, do not rely on the below named items being available.
 */

/* _attributes
 *   The attributes hash/object is stored in here.
 */
  _attributes: {}

});

/*
 * Define your application's models below.
 * Examples:
Blog = Class.extend(Model, {  
  initialize: function(id) {
    this._resource = "blogs";
    this.parent(id);
  },
  
  _to_s: function() {
    //return this.parent() + " works in " + this.dept;
    return this.name;
  }
});

Article = Class.extend(Model, {
  initialize: function(id) {
    this._resource = "articles"
    this.parent(id);
  },

  _to_s: function() { return this.title; }
});


Comment = Class.extend(Model, {
  initialize: function(id) {
    this._resource = "comments"
    this.parent(id);
  },

  _to_s: function() { return this.title; }
});

Author = Class.extend(Model, {
  initialize: function(id) {
    this._resource = "authors"
    this.parent(id);
  },

  _to_s: function() { return this.first_name+' '+this.last_name; }
});

//b = new Blog(1);
//b._attributes["name"];
//b._get_attribute("name");
//b._get_name();
*/

