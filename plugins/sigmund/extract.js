function(page) {
    var regex = /<img\s+id=\"strook[^>]+src="(http\S+)"/;
    var match = regex.exec(page);
    return match[1];
}
