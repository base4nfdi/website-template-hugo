# Welcome! 

This repository provides a [Hugo](https://gohugo.io/) template for a Base4NFDI basic service website. 
By default it includes a blog/newsfeed, publications, people in the project and a wiki, but can be customized in any way to your needs.
In this template, 'TODO' is used as a placeholder in every place you need to fill in your own service information, so you can just search for it, change/fill out every instance and the site should be ready to use.

TODO: insert your service logo

![todo](https://github.com/user-attachments/assets/f308fd01-e74c-45ef-a41d-19704095b7fe)

# TODO4NFDI

TODO: short intro text about project

# Website
Check out our website (TODO: ADD LINK AFTER PUBLISHING). (_The website is hosted in this repository._)

You can also find us [on the Base4NFDI website](https://base4nfdi.de/projects/). (TODO: specify) 

# License
This repository and the website content (TODO: ADD LINK AFTER PUBLISHING) are licensed under Creative Commons [CC-BY-SA-4.0 licence](https://creativecommons.org/licenses/by-sa/4.0/).

# Using this template

  1. [Click here to use this template in your own repository](https://github.com/new?template_name=website-template-hugo&template_owner=base4nfdi) or ask the Base4NFDI staff to create one for you in the Base4NFDI organisation
  2. Enable GitHub pages from GitHub actions in the settings (Settings ➜ Pages ➜ Source: GitHub Actions)
  3. Re-run the action to deploy the site (Actions ➜ click on last failed action ➜ top-right ‘re-run all actions’)
  4. The site should be available under https://base4nfdi.github.io/your-repo-name, where base4nfdi is the organisation or user under which you created the repository

# Adding a custom domain name

GitHub has [extensive documentation on this](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#dns-records-for-your-custom-domain). Basically it boils down to:

  1. Ask the Base4NFDI team to set a DNS CNAME record for your desired domain with looks like `todo.services.base4nfdi.de.    CNAME    base4nfdi.github.io.`
  Where of course todo.services.base4nfdi.de. needs to be replaced by your subdomain and if you used another GitHub organisation base4nfdi.github.io by the GitHub organisation your repository belongs to 
  2. Now the custom domain can be set in the project. Again in Settings ➜ Pages enter your domain (todo.services.base4nfdi.de) into the custom domain box and hit save. If the DNS check fails, wait a bit to make sure the change is published, otherwise make sure your DNS record is correct (e.g. missing dot at the end)
  3. After the DNS check passes, lastly set the new domain in the website configuration itself, so for this template in config/\_default/hugo.yaml. After the GitHub action ran again, your site should be ready and available under the new domain!

# About the design
  1. Font type: Fira Sans
  2. Primary color (paragraph, titles, top navi bar, link hover): #45546B
  3. Secondary color (link, buttons): #0ABAF0

## Acknowledgements
Significant primary work was done by M. Lange.
