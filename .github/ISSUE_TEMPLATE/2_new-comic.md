---
name: New comic
about: Suggest a new comic for Daily Comics
title: "[New comic] "
labels: 'new comic'
---

**Daily Comics VERSION** (Daily Comics → [Top pulley] About): **`<x.y.z>`**

Please do name only a single new comic / cartoon in each "new comic" suggestion!

#### REQUIRED DATA
- Name of the comic
  **\<official, full name\>**
- Author(s)
  **\<real name(s), if available, and pseudonym(s) / nickname(s)\>**
- Home webpage
  **\<URL to official webpage\>**
- An existing strip, which is very typical for this comic; it *should* include the main character(s) and / or main scenery of this strip.
  **\<URL or image file\>**
- Easily recognisable logo, icon or picture for the cover page of this
  comic; this *might* include either a sketch of the author(s), or the main character(s) and / or main scenery of this comic.
  **\<URL or image file\>**

See [this document](../../info/comic_addition.md) for details on these requirements; the image resolutions stated there are the minimal ones: Images can be easily downscaled, but up-scaling always involves a significant loss of visual quality.

#### NECESSARY DATA
These are technically necessary to implement a new comic strip source in Daily Comics.
- Denote the URL of a source page which allows for extracting a URL of a single image of the most recent, published strip by a RegEx (see next bullet point).  This source page may be identical to the home-page of the comic, which must be provided in the prior section "REQUIRED DATA".
  **\<URL\>**
- An idea for a RegEx (regular expression), containing a sub-expression which exactly matches the image path (either as a full URL or a path relative to the source page URL from the prior bullet point) to be extracted from the content of the source page.
  **`<RegEx>`**
- If such a single RegEx is not feasible, please design a JavaScript code snippet, which extracts the URL of the image of the most recent comic strip starting from the content retrieved via the URL provided in the first bullet point of this section "NECESSARY DATA".
  ```
  <JavaScript code>
  ```

Providing this necessary data might reduce the time and effort to implement a new comic significantly.

At best, provide a pull request (PR) for this new comic, adhering to [this guidance](../../info/comic_addition.md).

#### ADDITIONAL INFORMATION
\<Please consider thoroughly which other pieces of information might be relevant.\>

