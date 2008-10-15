Entity = Class.extend({
  initialize: function(id) {
    this.id = id;
    this.get();
  },

  toString: function() {
    return this.id;
  },
  
  url: function() {
    if(!this.url) {
      url = '/';
      if(this.owner && this.owner.resource) { 
        url += this.owner.resource + '/';
        set($.app[this.owner.resource]);
        if(this.owner_id) {
          url += this.owner_id + '/';
          set($.app[this.owner.resource][this.owner_id]);
        }
      }

      if(this.id) {
        url += this.resource + '/';
        set($.app[this.resource]);
        if(this.resource) {
          url += this.id + '/';
          set($.app[this.resource][this.id]);
        }
      } else {
        url = this.resource; // If no id is specified options should be the resource.
      }
    }
    return this.url;
  },

  get: function (callback) {
    this.response_callback = callback;
    $.getJSON(this.url(), null, this.get_response);
  },
  
  get_response: function(response) {
    this.response = response;
    // TODO: error handling.
    for(key in response) {
      this[key] = response[key];
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


new Blog(id);
var sue = new Manager("Sue", "Management", "corner office");

log(joe);
log(sue);
