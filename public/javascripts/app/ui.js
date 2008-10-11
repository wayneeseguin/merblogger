function load_ui () {
  $("body").
    html($.templates.default_layout());

  $("div#header").
    html("header");
  
  //$("div#content");
  get_entities("blogs", blogs); // TODO: 
  
  $("div#footer").
    append($.templates.footnote({date: new Date()}));
}

function blogs() {
  $("div#content").
    append($.templates.blogs($.blogs));
}

function articles() {
  $("div#content").
    append($.templates.articles($.articles));
}