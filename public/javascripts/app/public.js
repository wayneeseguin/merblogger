function load_ui () {
  display();
}

function display () {
  $("body").
    html($.templates.default_layout());

  $("div#header").
    html("header");
  
  get_entities("blogs", blogs);
  
  $("div#footer").
    append($.templates.footnote({date: new Date()}));
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
}

function comments(owner_type,owner_id,entity_type,entity_id) {
  $("div#articles").
    append($.templates.articles({
      "blog_id": owner_id, "comments": $.app[owner_type][owner_id].comments
      })
    );
}
