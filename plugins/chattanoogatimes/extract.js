function(page) {
  var regex = /<img[^>]* srcset="([^ "]+)[ "]/;
  var match = regex.exec(page);
  return match[1];
}
