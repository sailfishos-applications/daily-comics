---
name: Fix strip
about: Extracting a comic strip for Daily Comics is broken 
title: "[Fix strip] "
labels: 'fix strip'
assignees: ''

---

**Daily Comics VERSION** (Daily Comics → [Top pulley] About): 
<br />

#### REQUIRED METADATA
- Name of the strip: *\<official, full name\>*
- Author(s): *\<real name(s), if available\>*
- Home webpage: *\<official webpage\>*
- Existing strip, which is very typical for this comic strip
  (shouid include the main character(s) of this strip): *<URL or image file>*
- Easily recognisable logo, icon or picture for the cover page of this
  strip (might include the main character(s) of this strip): *<URL or image file>*

See **[this document] ()** for details on these requirements, the image resolutions stated there are the minimal ones: Images can be easily downscaled, but up-scaling always involves a significant loss of visual quality.

#### NECESSARY DATA
These are technically necessary to implement a new strip source in Daily Comic.
- Webpage, whose HTML source code enables extracting an URL to a single image of the newest, published strip.  This page can be identical to the home-page of the strip, which is provided in the prior paragraph.
- An idea for n RegEx (regular expression) to do so.
- If such a single RegEx is not feasible, you can provide a JavaCript code snippet, which extracts the URL to the image of the current comic strip.

Providing this data significantly lowers the time and effort it takes to implemnent a new strip.  Or provide a pull request (PR) for this new comic strip, after having read **[this guidance] ()**.

#### ADDITIONAL INFORMATION
*\<Please consider which other pieces of information may be relevant.\>*

