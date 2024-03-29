# Adding a new comic
This documents the guidelines for adding a new comic plugin.

## Structure
A subfolder with a unique, well recognisable ("sounding") identifier name must be created in the `plugins` folder.
This identifier must comprise only alphanumerical and lowercase characters.

#### Example 1
```
plugins/
  <comic-id-name>/
    cover.jpg
    example.jpg
    extract.js
    info.json
```

## Required information
- List of authors (past / present, scenarist / cartoonist / etc.)
- Homepage where to find more info about the comic
- Comic main representative colour (e.g. homepage colour, typical scenery colour, typical character colour)
- Language used in the comic strips
- Source where to extract a link to the latest strip (e.g. RSS, API, URL)

This information must be provided in a JSON file named `info.json`.

#### Example 2
```
{
  "name": "CommitStrip",                                 // Display name
  "color": "2a3f6a",                                     // Colour in hexadecimal "HTML format"
  "language": "en",                                      // Language code
  "authors": [                                           //
    "Etienne Issartial",                                 // List of authors (may be a single one)
    "Thomas Gx"                                          //
  ],                                                     //
  "homepage": "https://www.commitstrip.com/",            // Homepage URL
  "stripSource": "https://www.commitstrip.com/en/feed/"  // Source URL for extracting the most recent strip
}
```

## Comic cover
The cover image must be a file named `cover.jpg`.

### Goal
- The cover should be immediately recognisable when browsing the full list of comics.

### Design
- The cover image must be square (i.e. 1:1 aspect ratio).
- The background must be a plain colour (i.e. no gradient etc.) and should be aforementioned comic's own colour.
- The comic's name or its logo should be displayed on the center top of the cover image.
- The foreground should contain the main character(s).

### Technical
- The format is JPEG.
- Size is 300x300 pixels.
- Try to minimise the file size, e.g. by removing metadata, using an appropriate compression factor etc.

### Remarks
- Ensure text (especially the comic's name / logo) is well readable when displayed in the settings page of Daily Comics.
- The logo and the characters shall not overlap.
- There should not be any other item shown than the logo and the main character(s).
- Provide a strong contrast (colour and / or brightness) between the background colour to the logo and character.
- The main character(s) is preferably shown in a characteristic posture.
- Do not use shadows or other visual effects (at all, especially for the main character(s) or logo).
- Preferably no object is present with the character(s) (unless common for the comic or helping define the comic).
- The logo should be adapted to contain only the necessary parts (no tagline, background, author name, copyright / trademarks signs etc.).
- The logo's colour may be changed, if it is monochrome, or if it is the same or a very similar colour as the comic's main colour.
- Fully black or fully white are forbidden as a comic's main colour.
- The main character(s), logo or other items depoicted may extend to the bottom of the cover (i.e. without leaving a border), but not to either side or the top.
- If no main character exists, use a representative item or character.
- If there are too many main characters, show only to the most well known ones / recognisable ones.
- If the main colour is the colour of the main character, the main colour (and hence the background colour) should be darkened or lightened to provide sufficient contrast to the character.
- The character(s) are preferably shown in full colour, even if they appear even only sometimes as such in the strips.

## Example strip for a comic / cartoon
The example must be a file named `example.jpg`.

### Goal
- The example strip should give users that do not know this comic an idea of its usual content.

### Choice
- The example strip should be characteristic of the comic with regard to format, drawing style and topic.

### Technical
- The format is JPEG.
- Remove the not necessary surrounding parts of the strip.
- Maximum width and height is 600 pixels.
- Try to minimise the file size, e.g. by removing metadata, using an appropriate compression factor etc.

### Remark
- Ensure that text is well readable when displayed in Daily Comics.

## Extraction script
The script must be a file named `extract.js`.

This script is used to extract the current strip URL from the source as defined in the information.  
The Javascript code needs to comprise a single function with a single parameter.  
That function will be called with the content provided by the source URL.  
It must return a string with an absolute or relative (to the `stripSource`) URL to the most recent strip.

#### Example 3
```
function(page) {
    var regex = /<img[^>]*src="([^"]*\/wp-content\/uploads\/[^"]*)"/;
    var match = regex.exec(page);
    return match[1];
}
```

## Additional requirements
- Denote in the git commit message which (re)source URLs were used for the cover and example strip.
- Provide a higher resolution cover image ([1000x1000 px²](https://github.com/tardypad/sailfishos-daily-comics/pull/86#issuecomment-491614824)) in the comic's plugin folder with name `cover_big.jpg`.
- Regenerate the comic covers grid with the `resources/generate_covers_grid.sh` shell script.
- Regenerate the comics list with the `resources/generate_list.sh` shell script.
- If necessary, update the prefixes to ignore for sorting comic names in the `Comic` class (*ToDo: ¿Where?, please specify!*) and in the `resources/generate_list.sh` script.

## Note
- Mind that a extracted comic strip proper can be in another format than JPEG, e.g. PNG or GIF (for animated comics).
