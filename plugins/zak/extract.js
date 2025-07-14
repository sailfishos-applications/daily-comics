function(page) {
    var regex = /&quot;path&quot;:&quot;(\S+ - Zak - De Morgen\.\S+)&quot;/;
    var match = regex.exec(page);
    return "https://admin.presscartoondev.eu/" + match[1].replace(/\\\//g, '/');
    // return match[1].replace(/&amp;/g, '&');
}
