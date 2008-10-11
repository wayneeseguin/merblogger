function load_ui () {
  $("body").html($.templates.default());
  $("div#header").html("header");
  $("div#content").html("articles go here w00t");
  date = new Date();
  $("div#footer").html("<div class=\"copyright center\">&copy;2008 - "+date.getFullYear()+"MerBlogger :)</div>");
}
