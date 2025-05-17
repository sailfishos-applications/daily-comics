function(page) {
    var regex = /<div\s+class="the-daily-mutts-[^"]+">\s+<img\s+src="([^? "]+)/;
    var match = regex.exec(page);
    return match[1];
}
