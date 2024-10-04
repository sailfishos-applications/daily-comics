function(page) {
    var regex = /\s+src="(https://images.nrc.nl/[^"]*)"/;
    var match = regex.exec(page);
    return match[1];
}
