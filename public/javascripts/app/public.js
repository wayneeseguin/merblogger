function load_ui () {
  display();
}

function display () {
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
  owner = find_by_id($.app[owner_type],"id",owner_id);

  header("Articles in "+owner.name);
  
  $("div#blogs").hide();

  $("div#content").
  append($.templates.articles({
    "blog_id": owner_id, "articles": $.app[owner_type][owner_id].articles
    })
  );

  $("div.articles div.menu span.back").click(function() {
    $("div.articles").hide();
    $("div#blogs").show();
  });

  log($("span.edit").html());

  $("span.edit").click(function() {
    article_edit($(this).attr("article_id"));
  });
}

function article_edit(article_id) {
  $("div[article_id="+article_id+"]").empty().append(
    $.templates.article_form(find_by_id($.app.articles,article_id))
  );
  $("form[]").ajaxForm();
}

function comments(owner_type,owner_id,entity_type,entity_id) {
  $("div#articles").
    append($.templates.articles({
      "blog_id": owner_id, "comments": $.app[owner_type][owner_id].comments
      })
    );
}
