function(page) {
    var regex = /"single":\{"url":"(https:[^"]+)/;
    var match = regex.exec(page);
    return match[1];
}
