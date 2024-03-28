---
name: Fix comic
about: Extracting a comic strip by Daily Comics is broken 
title: "[Fix comic] "
labels: 'fix comic'
---

**Daily Comics VERSION** (Daily Comics → [Top pulley] About): ***`<x.y.z>`***

*\<Please do name only a single comic / cartoon in each "fix comic" suggestion!\>*

#### NECESSARY DATA
- Name of the comic<br />
  ***\<name in Daily Comics\>***
- Denote the URL of a source page which allows for extracting a URL of a single image of the most recent, published strip by a RegEx (see next bullet point).  This source page may be identical to the home-page of the comic.<br />
  ***\<URL\>***
- An idea for a RegEx (regular expression), containing a sub-expression which exactly matches the image URL to be extracted from the content of the source page.<br />
  ***`<RegEx>`***
- If such a single RegEx is not feasible, please design a JavaScript code snippet, which extracts the URL of the image of the most recent comic strip starting from the content retrieved via the URL provided in the second bullet point of this section "NECESSARY DATA".
  ```
  <JavaScript code>
  ```

#### ADDITIONAL INFORMATION
*\<Please consider thoroughly which other pieces of information might be relevant.\>*

