# bitcoin-core-docs
> Website that hosts bitcoin core docs

Hacky website that I built in order to view the docs (not including release info) in a more comfortable and searchable (on all.html) way.

Essentially, it works by triggering a github actions job once a day which

1. Pulls the bitcoin repo
2. Converts the markdown documents in `/doc` (excluding release notes) into html using pandoc
3. Publishes the resulting html into Github Pages
