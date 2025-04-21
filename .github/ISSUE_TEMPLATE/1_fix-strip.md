---
name: Fix strip
about: Extracting a comic strip for Daily Comics is broken 
title: "[Fix strip] "
labels: 'fix strip'
---

**Daily Comics VERSION** (Daily Comics → [Top pulley] About): ***`<x.y.z>`***
<br />

#### REQUIRED DATA
- Name of the strip<br />
  ***\<name in Daily Comics\>***
- Document, whose source code allows for extracting a URL to a single image of the newest, published strip by a RegEx (see next bullet point).  This page may be identical to the home-page of the strip.<br />
  ***\<URL\>***
- An idea for a RegEx (regular expression) to do so, containing a sub-expression which exactly matches the image URL<br />
  ***`<RegEx>`***
- If such a single RegEx is not feasible, please design a JavaScript code snippet, which extracts the URL to the image of the current comic strip from the document retrieved via the URL provided in the first bullet point of this section "NECESSARY DATA".
  ```
  <JavaScript code>
  ```

#### ADDITIONAL INFORMATION
*\<Please consider thoroughly which other pieces of information may be relevant.\>*

