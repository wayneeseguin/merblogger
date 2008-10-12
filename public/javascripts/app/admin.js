function load_ui () {
  display();
  admin();
}

function admin () {
  // enable admin stuff.
}

function blogs() {
  $("div#content").
    append($.templates.blogs($.app.blogs));

  $("div#content div#blogs span.blog").click(function() {
    get_entities_for("blogs",$(this).attr("blog_id"),"articles", null, articles);
  });
}

function articles(owner_type,owner_id,entity_type,entity_id) {
  $("div#blogs").hide();

  $("div#content").
  append($.templates.articles({
    "blog_id": owner_id, "articles": $.app[owner_type][owner_id].articles
    })
  );

  $("div.articles > .back").click(function() {
    $("div.articles").hide();
    $("div.blogs").show();
  });

  $("div.article > .edit").click(function() {
    log($(this).attr("article_id"));
    article_edit($(this).attr("article_id"));
  });
}

function article_edit(article_id) {
  $("div[article_id="+article_id+"]").empty().append(
    $.templates.article_form(find_by_id($.app.articles[article_id]))
  );
}

function comments(owner_type,owner_id,entity_type,entity_id) {
  $("div#articles").
    append($.templates.articles({
      "blog_id": owner_id, "comments": $.app[owner_type][owner_id].comments
      })
    );
}
