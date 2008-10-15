
Entity = Class.extend({
  initialize: function(id) {
    this.id = id;
    this.get();

    this.attributes = {};
  },

  toString: function() {
    return this.id;
  },

  _get_attribute: function(attr) {
    refresh = arguments[1] 
    return this.attributes[attr]
  },

  _set_attribute: function(attr,value) {
    if (this.attributes[attr] == undefined) {
      // raise error
    }
    this.attributes[attr] = value;
    return this.attributes[attr];
  },
  
  url: function() {
    if(!this._url) {
      url = '/';
      if(this.owner && this.owner.resource) { 
        url += this.owner.resource + '/';
        $.app[this.owner.resource] = $.app[this.owner.resource] || {};
        if(this.owner_id) {
          url += this.owner_id + '/';
          $.app[this.owner.resource][this.owner_id] = $.app[this.owner.resource][this.owner_id] || {};
        }
      }

      if(this.id) {
        url += this.resource + '/';
       $.app[this.resource] = $.app[this.resource] || {};
        if(this.resource) {
          url += this.id + '/';
          $.app[this.resource][this.id] = $.app[this.resource][this.id] | {};
        }
      } else {
        url = this.resource; // If no id is specified options should be the resource.
      }
      this._url = url
    }
    return this._url;
  },

  get: function (callback) {
    if (callback) {
      this.response_callback = callback;
      $.getJSON(this.url(), null, this.get_response);
    } else {
      // get the data synchronously and return
      this.response_callback = undefined;
      this.get_response($.ajax({type: "GET", url: this.url(), dataType: "json", async: false}));
    }
  },
  
  get_response: function(response) {
    this.response = response;
    // TODO: error handling.

    this.attributes = response;
    for(key in response) {
      if (! this["get_"+key]) {
        this["get_"+key] = function() {return this._get_attribute(key)}
      }
      if (! this["set_"+key]) {
        this["set_"+key] = function(value) {return this._set_attribute(key,value)}
      }
    }
    if(this.response_callback) {
      this.response_callback();
      this.response_callback = nil;
    }
  }
});

Blog = Class.extend(Entity, {  
  initialize: function(id) {
    this.resource = "blogs";
    this.parent(id);
  },
  
  toString: function() {
    //return this.parent() + " works in " + this.dept;
    return this.name;
  }
});

Article = Class.extend(Entity, {
  initialize: function(id) {
    this.resource = "articles"
    this.parent(id);
  },

  toString: function() {
    return this.title;
  }
});


//new Blog(id);
//var sue = new Manager("Sue", "Management", "corner office");
//
//log(joe);
//log(sue);
