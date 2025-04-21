function(page) {
    var regex = /<img src="([^"]+\\.jpg)((?!<img).)*artoon van de dag/;
    var match = regex.exec(page);
    return match[1];
}
