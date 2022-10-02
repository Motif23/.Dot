#!/usr/bin/env bash
#
# Script name: dmsearch.sh
# Description: Search various search engines (inspired by surfraw).
# Dependencies: dmenu and a web browser
# Github: https://www.github.com/Motif23/
# Contributors: Motif Tech Services

# Defining our web browser.
DMBROWSER="qutebrowser"

# An array of search engines.  You can edit this list to add/remove
# search engines. The format must be: "engine_name - url".
# The url format must allow for the search keywords at the end of the url.
# For example: https://www.amazon.com/s?k=XXXX searches Amazon for 'XXXX'.
declare -a options=(
"jwlibrary - https://www.jw.org/en/search/?q="
"youtube - https://www.youtube.com/results?search_query="
"github - https://github.com/search?q="
"gitlab - https://gitlab.com/search?search="
"archaur - https://aur.archlinux.org/packages/?O=0&K="
"archpkg - https://archlinux.org/packages/?sort=&q="
"archwiki - https://wiki.archlinux.org/index.php?search="
"bbcnews - https://www.bbc.co.uk/search?q="
"cnn - https://www.cnn.com/search?q="
"duckduckgo - https://duckduckgo.com/?q="
"google - https://www.google.com/search?q="
"googleimages - https://www.google.com/search?hl=en&tbm=isch&q="
"googlenews - https://news.google.com/search?q="
"imdb - https://www.imdb.com/find?q="
"reddit - https://www.reddit.com/search/?q="
"sourceforge - https://sourceforge.net/directory/?q="
"stack - https://stackoverflow.com/search?q="
"thesaurus - https://www.thesaurus.com/misspelling?term="
"translate - https://translate.google.com/?sl=auto&tl=en&text="
"urban - https://www.urbandictionary.com/define.php?term="
"wayback - https://web.archive.org/web/*/"
"webster - https://www.merriam-webster.com/dictionary/"
"wikipedia - https://en.wikipedia.org/wiki/"
"wiktionary - https://en.wiktionary.org/wiki/"
"quit"
)

# Picking a search engine.
while [ -z "$engine" ]; do
enginelist=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 10 -p 'Choose search engine:') || exit
engineurl=$(echo "$enginelist" | awk '{print $NF}')
engine=$(echo "$enginelist" | awk '{print $1}')
done

# Searching the chosen engine.
while [ -z "$query" ]; do
query=$(rofi -dmenu -i -l 1 -p "Searching $engine:") || exit
done

# Display search results in web browser
$DMBROWSER "$engineurl""$query"
