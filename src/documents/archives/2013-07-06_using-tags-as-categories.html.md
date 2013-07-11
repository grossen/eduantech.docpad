---
title: Using tags as categories
author: Eduan Lavaque
tags:
    - CMS
    - Tutorials
    - gist
    - docpad
---
OK so if you're using DocPad, or Statamic, or anything similar you might come across the fact that having category and tag pages is not as easy as it could be.

So here's a system I've come up with a system to use *tags* as *categories*.

First. All of your tags should be **all lowercase**, this is important. If it's all lowercase your users know (maybe) and your code knows it's to be treated as a tag.

Here's some examples of some *tags*:

``` none
- music
- videos
- dogs
- cats
```

OK now to categories. Your categories should be Capitalized correctly and should be more global than the tags. Here's some examples:

``` none
- Media
- Animals
- Travelling
- Food
```

So here's how the category tag hierarchy could look:

``` none
- Media
    - music
    - videos
    - images
    - photos
- Animals
    - dogs
    - cats
- Travelling
    - europe
    - japan
- Food
    - italian
    - french
    - mexican
```

So that's basically it. This allows your code to recognize the difference between categories and tags. Alowing you to show it to your users in a simple way which are tags and categories. :wink:

here's the Gist that contains the code to do this with DocPad:
#### TODO
