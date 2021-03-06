#!/bin/bash
# A Hello World program using the GraphTerm API

prefix=https://raw.github.com/mitotic/graphterm
url=$prefix/master/graphterm/www/GTYY500.png
esc=`printf "\033"`
code="1155"
# Prefix escape sequence
echo "${esc}[?${code};${GTERM_COOKIE}h"
# Display text with HTML markup
echo '<b>Hello</b>'
echo '<b style="color: red;">World!</b><p>'
# Display inline image
echo "<a><img width="200" src=\"$url\"></a>"
# Suffix escape sequence
echo "${esc}[?${code}l"

# Display clickable link that executes a command
echo "${esc}[?${code};${GTERM_COOKIE}h"
echo '<hr><a class="gterm-link gterm-click" href="" data-gtermmime="" data-gtermcmd="echo " data-gtermconfirm="Execute echo command?">Clickable Command</a><hr>'
echo "${esc}[?${code}l"

# Pretend we do not have a valid GTERM cookie
DUMMY_COOKIE=0

# Display blob showing red dot
echo "${esc}[?${code};${DUMMY_COOKIE}h<!--gterm data-->image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==${esc}[?${code}l" 

