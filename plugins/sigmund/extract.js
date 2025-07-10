function(page) {
    var regex = /<img id=\"strook[^>]*src="(http.*gif)"/;
    var match = regex.exec(page);
    return match[1];
}
