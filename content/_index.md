---
# Leave the homepage title empty to use the site title
title:
date: 2024-07-24
type: landing

sections:
  - block: hero
    content:
      title: Todo4NFDI
      image:
        filename: todo4nfdi.png
      text: |
        … is a basic service under development for the German National Research Data Infrastructure ([Nationale Forschungsdaten&shy;infrastruktur – NFDI](https://www.nfdi.de/?lang=en)). Todo4NFDI is part of [Base4NFDI](https://base4nfdi.de/) and is currently in its initialisation phase, the first of three service development phases.

        {{% cta cta_link="./about/" cta_text="Read more →" %}}

      # TODO here also other services could be linked which you provide, e.g. a hub or the documentation
  
  - block: collection
    content:
      title: Latest News
      subtitle:
      text:
      count: 3
      filters:
        author: ''
        category: ''
        exclude_featured: false
        publication_type: ''
        tag: ''
        folders:
          - news
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
        {{% cta cta_link="./people/" cta_text="Meet the team →" %}} {{% cta cta_link="./contact/" cta_text="Contact us →" %}}
    design:
      columns: '1'
---
