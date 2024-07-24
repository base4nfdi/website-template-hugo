---
# Leave the homepage title empty to use the site title
title:
date: 2024-07-15
type: landing

sections:
  - block: hero
    content:
      title: Meme4NFDI
      image:
        filename: pid4nfdi_small.jpg
      text: |
        … is a basic service for persistent identifiers in development for the German National Research Data Infrastructure ([Nationale Forschungsdaten&shy;infrastruktur – NFDI](https://www.nfdi.de/?lang=en)). PID4NFDI is part of [Base4NFDI](https://base4nfdi.de/) and is currently in its initialisation phase, the first of three service development phases.

        {{% cta cta_link="./about/" cta_text="Read more →" %}}
  
  - block: collection
    content:
      title: Latest Blog Posts
      subtitle:
      text:
      count: 5
      filters:
        author: ''
        category: ''
        exclude_featured: false
        publication_type: ''
        tag: ''
        folders:
          - blog
      offset: 0
      order: desc
    design:
      view: card
      columns: '1'

  - block: collection
    content:
      title: Latest Publications
      text: ""
      count: 5
      filters:
        folders:
          - publications
        #publication_type: 'article'
    design:
      view: list
      columns: '1'

  - block: markdown
    content:
      title:
      subtitle:
      text: |
        {{% cta cta_link="./people/" cta_text="Meet the team →" %}}
        {{% cta cta_link="./contact/" cta_text="Contact us →" %}}
    design:
      columns: '1'
---
