---
name: Fix comic
about: Extracting a comic strip by Daily Comics is broken 
title: "[Fix comic] "
labels: 'fix comic'
---

**Daily Comics VERSION** (Daily Comics → [Top pulley] About): **`<x.y.z>`**

Please do name only a single comic / cartoon in each "fix comic" suggestion!  The only exception is when a format change by a comics provider affects multiple comics retrieved from this provider.

#### NECESSARY DATA
- Name of the comic
  **\<name in Daily Comics\>**
- Error message displayed by Daily Comics
  **\<Daily Comics' error message\>**
- Denote the URL of a source page which allows for extracting a URL of a single image of the most recent, published strip by a RegEx (see next bullet point).  This source page may be identical to the home-page of the comic.
  **\<URL\>**

#### Optional Data
Providing this information usually speeds up fixing a comic in Daily Comics significantly.
- An idea for a RegEx (regular expression), containing a sub-expression which exactly matches the image path (either as a full URL or a path relative to the source page URL from the prior bullet point) to be extracted from the content of the source page.
  **`<RegEx>`**
- If such a single RegEx is not feasible, please design a JavaScript code snippet, which extracts the URL of the image of the most recent comic strip starting from the content retrieved via the URL provided in the second bullet point of this section "NECESSARY DATA".
  ```
  <JavaScript code>
  ```

#### ADDITIONAL INFORMATION
\<Please consider thoroughly which other pieces of information might be relevant.\>

