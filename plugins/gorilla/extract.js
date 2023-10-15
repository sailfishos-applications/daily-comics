function(page) {
    var regex = /<a[^>]+href="[^"]*\/cartoons\/.+<img[^>]+src="([^"]*)"/;
    var match = regex.exec(page);
    return match[1];
    // return "https://www.groene.nl" + match[1];
}
