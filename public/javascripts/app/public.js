function load_ui () 
{
  public();
  context();
}

function context () { }

function public () {
  $("body").empty().
    append($.templates.default_layout());

  header("MerBlogger");

  get_entities({entity_class:"blogs"}, blogs);

  $("div#footer").
    append($.templates.footnote({date: new Date()}));

  $("div#edit_dialog").dialog(
    {autoOpen: false,modal: true, overlay: { opacity: 0.5, background: "black" }, height: "auto", width: "auto"}
  );
}

function header(title) {
  $("div#header").empty().append(
    $.templates.header({title: title})
  );
}

function blogs() {
  header("Blogs");

  $("div#content").empty().
    append($.templates.blogs($.app.blogs));

  $("div#content div#blogs span.blog").click(function() {
    get_entities_for("blogs",$(this).attr("blog_id"),"articles", null, articles);
  });
}

function articles(owner_type,owner_id,entity_type,entity_id) {
  $.app.owner_type = owner_type;
  $.app.owner_id = owner_id;

  $.app.owner = $.app[owner_type][owner_id];

  header("Articles in "+$.app.owner.name);

  $("div#content").empty().append($.templates.articles($.app.owner.articles));

  $("div.articles div.menu span.back").click(function() {
    blogs();
  });

  $.each($.app.owner.articles || [],function(index,article) {
    $("span.view[article_id="+article.id+"]").click(function() {
      article_view(article.id);
    });
  });

  $("div.article span.new").click(function() {
    article_edit(0);
  });
}

function article_edit(entity_id) {
  if(entity_id != 0) {
    entity = find($.app.articles||[],"id",entity_id);
  } else {
    entity = {id: 0}
  }

  header("Editing an article");

  $("div#content").empty().append(
    $.templates.articles_form(entity)
  );

  form = $("form[article_id="+(entity_id||0)+"]");
  form.ajaxForm({ 
      url: form.attr("action"), type: (entity.id == "0") ? "POST" : "PUT", 
      dataType: "json", success: article_response, beforeSubmit: validate_article 
    }
  );

  $("input.cancel").click(function() {
    articles($.app.owner_type, $.app.owner_id);
  });
}

function article_view(entity_id) {
  header("Viewing an article");

  if($.app.articles[entity_id]) {
    var article = $.app.articles[entity_id];
  } else {
    var article = new Article(entity_id);
  }

  $("div#content").empty().append(article._view());

  $("span.edit[article_id="+article.id+"]").click(function() {
    article_edit(article.id);
  });

  $("span.back").click(function() {
    articles($.app.owner_type, $.app.owner_id);
  });
}


function validate_article () {
}

function article_response(response) {
  $.app.articles[response.id] = response;
  $("div[article_id="+(response.id||0)+"]").empty().append(
    $.templates.articles(response)
  );
  // TODO: add owner_id...
  $("span.edit[article_id="+(response.id)+"]").click(function() {
    article_edit(response.id);
  });
}

function comments(owner_type,owner_id,entity_type,entity_id) {
  $("div#articles").
    append($.templates.comments({
      "blog_id": owner_id, "comments": $.app[owner_type][owner_id].comments
    })
  );
}

/*
 * Models
 *
 */

$.loadModels = function() {
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
}

//b = new Blog(1);
//b._attributes["name"];
//b._get_attribute("name");
//b._get_name();

