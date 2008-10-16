/* Authors: Dennis J. Bell && Wayne E. Seguin
 * Licence: MIT
 * Name:    jQuery Models.
 * About:   REST style models objects for jQuery.
 * 
 * Public API
 * 
 *   Methods should remain availble on each next release. 
 *   Only subject to change with major release revisions and with notice if posisble.
 *
 *   intialize
 *     Method used to setup the model. Overwrite this in extended models and be sure to call parent(id);
 *
 *   parent
 *     Used to call the parent method with the same name. Same concept as 'super' in Ruby.
 *
 *   _resource
 *     Underlying plural model name from the backend. Can be thought of similar to the 'table name'.
 *
 *   _fetch()
 *     Fetch the data from the backend URL, REST based construction. 
 *     Currently only one level of ownership is enabled.
 *
 *   _load()
 *     Load the attributes that do not conflict with public API methods into the object directly.
 *
 *   _reload()
 *     Re-fetch from the backend, remove attributes from the object and then load the attributes.
 *
 *   _update_attributes()
 *     Update a set of attributes, marking them dirty. Save to the backend when done.
 *
 *   _set_attribute()
 *     Update an attribute, mark it as dirty for later saving.
 *
 *   _save()
 *     Save the record to the backend if any attributes are dirty. Update any views / return the record itself.
 *
 *   _[]
 *     Retrieves any attribute that does not conflict with a public API method name.
 *
 *   _view()
 *     Render teh jQuery Template for the view of the model.
 *
 *   _form()
 *     Render teh jQuery Template for the form of the model.
 *
 *   _dirty()
 *     true or false based on whether or not attributes have been updated. 
 *     Must use the _update/_set_attribute(s) methods in order for this to 
 *     be used properly instead of direct assignment.
 *
 *   _to_s()
 *     Used to generate the display for the object. Defaults to the id for the record.
 *     Override in extended model classes as needed.
 *
 * Private API
 *
 *   Subject to change, do not rely on the below named items being available.
 *
 *   _attributes
 *     The attributes hash/object is stored in here.
 */
Model = Class.extend({
  initialize: function(id) {
    this._attributes = {id: id};
    this.id = id;
    this._fetch();
  },

  _to_s: function() { return this.id; },

  _get_attribute: function(attr) {
    refresh = arguments[1] 
    return this._attributes[attr]
  },
  
  _update_attributes: function(hash) {
    // Send a PUT to the object's URL with attributes to update, "dirty".
    for(key in hash) {
      this._set_attribute(key,hash[key]);
    }
    this._save();
  },
  
  _save: function() {
    // save to backend if dirty.
  },
  
  _delete: function() {
    // Delete the record in the backend, destroy buffers, views, and forms.
  },
  
  _set_attribute: function(key,value) {
    // Set the value and store the key in the "dirty list"
    if (this._attributes[key] == undefined) {
      // raise error
    }
    this._attributes[key] = value;
    return this._attributes[key];
  },
  
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
    
    if(this.id) {
      url += this._resource + '/';
     $.app[this._resource] = $.app[this._resource] || {};
      if(this._resource) {
        url += this.id + '/';
        $.app[this._resource][this.id] = $.app[this._resource][this.id] | {};
      }
    } else {
      url = this._resource; // If no id is specified options should be the resource.
    }
    return url;
  },

  _fetch: function (callback) {
    if (callback) {
      this._after_load = callback;
      $.getJSON(this._url(), null, this._load);
    } else {
      // get the data synchronously and return
      this._after_load = null;
      log(this._url());
      response = $.ajax({ type: "GET", url: this._url(), dataType: "json", async: false });
      this._load(eval("(" + response.responseText + ")"));
    }
  },
  
  _reload: function() {
    // Go through and unset the existing data.
    data = this._attributes;
    for(key in data) {
      if(key != "initialize" && key != "parent") {
        this[key] = null;
      }
    }
    // Now load again.
    this.fetch();
  },

  _load: function(data) {
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
  },
  
  _view: function(options) {
    return $.templates[self._resource + "_view"](self._attributes);
  },
  
  _form: function(options) {
    return $.templates[self._resource + "_form"](self._attributes);
  }
});

/*
 * Define your application's models below.
 */
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
