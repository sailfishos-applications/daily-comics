function(page) {
    var regex = /<img\s+class="diks-card__image"\s+src="([^"]+)/;
    var match = regex.exec(page);
    var hash = match[1];

    return hash.replace(/FREE_\d+/,"FREE");
}
