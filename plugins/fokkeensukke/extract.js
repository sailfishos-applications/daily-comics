function(page) {
    var regex = /\ssrc="([^"]+\/images.nrc.nl\/[^"\s]+)/;
    var match = regex.exec(page);
    return match[1];
}
