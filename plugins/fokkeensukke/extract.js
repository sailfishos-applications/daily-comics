function(page) {
    var regex = /<source[^>]+srcset="\s*(\S+)/;
    var match = regex.exec(page);
    return match[1];
}
