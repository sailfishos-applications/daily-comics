function(page) {
    var regex = /\s+src="([^"]+\/images.nrc.nl\/[^"]+)"/;
    var match = regex.exec(page);
    return match[1];
}
