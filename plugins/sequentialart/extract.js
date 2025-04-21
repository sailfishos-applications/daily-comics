function(page) {
    var regex = /<img\s+class="w3-image"\s+src="([^" ]+)/;
    var match = regex.exec(page);
    return "https://www.collectedcurios.com/" + match[1];
}
