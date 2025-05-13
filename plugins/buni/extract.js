function(page) {
    var regex = /<div\s+id="comic">\s+<img\s+src="([^? "]+)/;
    var match = regex.exec(page);
    return match[1];
}
