function(page) {
    var regex = /<div id="comic">\n[:blank:]*<img[^>]*src="([^"]*\/wp-content\/uploads\/[^"]*)"/;
    var match = regex.exec(page);
    return match[1];
}
