function(page) {
    var regex = /onclick="big\('([^']*)'/;
    var match = regex.exec(page);
    return match[1];
}
