function(page) {
    var regex = /data-vr-contentbox="Lectrr, cartoon van de dag".+?<img[^>]+src="([^"]+.jpg)".+?<span>Lectrr, cartoon van de dag<\/span>/;
    var match = regex.exec(page);
    return match[1];
}
