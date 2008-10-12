function load_ui () {
  public();
  context();
}

function context () { }

function public () {
  $("body").
    append($.templates.default_layout());

  header("MerBlogger");
  
  get_entities("blogs", blogs);
  
  $("div#footer").
    append($.templates.footnote({date: new Date()}));
}

function header(title) {
  $("div#header").empty().append(
    $.templates.header({title: title})
  );
}

function blogs() {
  header("Blogs");

  $("div#content").
    append($.templates.blogs($.app.blogs));

  $("div#content div#blogs span.blog").click(function() {
    get_entities_for("blogs",$(this).attr("blog_id"),"articles", null, articles);
  });
}

function articles(owner_type,owner_id,entity_type,entity_id) {
  owner = $.app[owner_type][owner_id];
  
  header("Articles in "+owner.name);
  
  $("div#blogs").hide();
  
  $("div#content").
  append($.templates.articles({
    "blog_id": owner_id, "articles": owner.articles
    })
  );
  
  $("div.articles div.menu span.back").click(function() {
    $("div.articles").hide();
    $("div#blogs").show();
    header("Blogs");
  });

  $("span.edit").click(function() {
    article_edit(owner_type,owner_id,entity_type,$(this).attr("article_id"));
  });
  
  $("span.new").click(function() {
    article_edit(owner_type,owner_id,entity_type,0);
  });
}

function article_edit(owner_type,owner_id,entity_type,entity_id) {
  if(entity_id != 0) {
    entity = find($.app[entity_type]||[],"id",entity_id);
  } else {
    entity = {id: 0}
  }
  
  $("div[article_id="+(entity_id||0)+"]").empty().append(
    $.templates.article_form(entity)
  ).show();
  
  form = $("form[article_id="+(entity_id||0)+"]");
  form.ajaxForm({ 
      url: form.attr("action"), type: (entity.id == "0") ? "POST" : "PUT", dataType: "json", 
      success: article_response, beforeSubmit: validate_article 
    }
  );
}

function validate_article () {
}

function article_response(response) {
  $.app.articles[response.id] = response;
  $("div[article_id="+(response.id||0)+"]").empty().append(
    $.templates.article(response)
  );
  $("span.edit[article_id="+(response.id)+"]").click(function() {
    article_edit(owner_type,owner_id,entity_type,$(this).attr("article_id"));
  });
}

function comments(owner_type,owner_id,entity_type,entity_id) {
  $("div#articles").
    append($.templates.comments({
      "blog_id": owner_id, "comments": $.app[owner_type][owner_id].comments
      })
    );
}
