function load_ui () {
  $("body").
    html($.templates.default_layout());

  $("div#header").
    html("header");
  
  //$("div#content");
  get_entities("blogs", blogs);
  
  $("div#footer").
    append($.templates.footnote({date: new Date()}));
}

function blogs() {
  $("div#content").
    append($.templates.blogs($.app.blogs));
}

function articles() {
  $("div#blogs").
    append($.templates.articles($.app.articles));
}

function comments() {
  $("div#articles").
    append($.templates.articles($.app.articles));
}
