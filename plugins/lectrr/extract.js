function(page) {
    var regex = /<img[^>]+src="(https:\/\/prod-img.standaard.be\/public\/nieuws\/\S+)/;
    var match = regex.exec(page);
    return match[1];
}
