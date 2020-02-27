#!/usr/bin/env bash

md2html () {
	pandoc -t html -f gfm --css "pandoc.css" -s $1 -o $2 -V header-includes:"<link rel='shortcut icon' href='favicon.png' />" --metadata pagetitle="$3" --fail-if-warnings
}

git clone https://github.com/bitcoin/bitcoin.git
doc_filenames=$(ls bitcoin/doc/*.md | grep -v release-notes)
sed -i s/\.md/\.html/g $doc_filenames
mkdir -p docs
cp pandoc.css docs
echo "" > index.md

cat $doc_filenames > all.md

for file in all.md $doc_filenames
do
	name=$(basename $file .md)
	md2html $file docs/$name.html $name
	echo "- [$name]($name.html)" >> index.md
done

md2html index.md docs/index.html "Bitcoin Core Docs"
