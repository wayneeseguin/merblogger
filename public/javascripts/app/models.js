//b = new Blog(1);
//b._attributes["name"];
//b._get_attribute("name");
//b._get_name();


Model = Class.extend({
  initialize: function(id) {
    this._attributes = {id: id};
    this.id = id;
    this._fetch();
  },

  toString: function() {
    return this.id;
  },

  _get_attribute: function(attr) {
    refresh = arguments[1] 
    return this._attributes[attr]
  },

  _set_attribute: function(attr,value) {
    if (this._attributes[attr] == undefined) {
      // raise error
    }
    this._attributes[attr] = value;
    return this._attributes[attr];
  },
  
  _url: function() {
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
      this[key] = null;
    }
    // Now load again.
    this.fetch();
  },

  _load: function(data) {
    this._attributes = data;
    // Forget this for now, ._attributes[] and ._get_attribute() work.
    for(key in data) {
      this[key] = data[key];
      //if (! this["_get_"+key]) {
      //  this["_get_"+key] = function() {
      //    return this[key];
      //  }
      //}
      //
      //if (! this["_set_"+key]) {
      //  this["_set_"+key] = function (value) {
      //    return this._attributes[key] = value;
      //  }
      //}
    }
    
    if(this._after_load) {
      this._after_load();
      this._after_load = null;
    }
  }
});

Blog = Class.extend(Model, {  
  initialize: function(id) {
    this.resource = "blogs";
    this.parent(id);
  },
  
  toString: function() {
    //return this.parent() + " works in " + this.dept;
    return this.name;
  }
});

Article = Class.extend(Model, {
  initialize: function(id) {
    this.resource = "articles"
    this.parent(id);
  },

  toString: function() {
    return this.title;
  }
});
