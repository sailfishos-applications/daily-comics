---
name: New strip
about: Suggest a new comic strip for Daily Comics
title: "[New strip] "
labels: 'new strip'
assignees: ''

---

**Daily Comics VERSION** (Daily Comics → [Top pulley] About): ***`<x.y.z>`***
<br />

#### REQUIRED DATA
- Name of the strip<br />
  ***\<official, full name\>***
- Author(s)<br />
  ***\<real name(s), if available, and pseudonym(s) / nickname(s)\>***
- Home webpage<br />
  ***\<URL to official webpage\>***
- Existing strip, which is very typical for this comic strip; *should* include the main character(s) and / or scenery of this strip<br />
  ***\<URL or image file\>***
- Easily recognisable logo, icon or picture for the cover page of this
  strip; *might* include either a scetch of the author(s), or the main character(s) and / or scenery of this strip<br />
  ***\<URL or image file\>***

See **[this document] ()** for details on these requirements, the image resolutions stated there are the minimal ones: Images can be easily downscaled, but up-scaling always involves a significant loss of visual quality.

#### NECESSARY DATA
These are technically necessary to implement a new strip source in Daily Comics.
- Document, whose source code enables extracting an URL to a single image of the newest, published strip by an RegEx (see next bullet point).  This page can be identical to the home-page of the strip, which is provided in the prior section "REQUIRED DATA".<br />
  ***\<URL\>***
- An idea for a RegEx (regular expression) to do so<br />
  ***`<RegEx>`***
- If such a single RegEx is not feasible, please design a JavaScript code snippet, which extracts the URL to the image of the current comic strip from the document retrieved via the URL provided in the first bullet point of this section "NECESSARY DATA".
  ```
  <JavaScript code>
  ```

Also providing this necessary data lowers the time and effort it takes to implement a new strip significantly.  Or provide a pull request (PR) for this new comic strip, after having read **[this guidance] ()**.

#### ADDITIONAL INFORMATION

*\<Please consider thoroughly which other pieces of information may be relevant.\>*

