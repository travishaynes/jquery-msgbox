#!/bin/bash
# This script compiles the CoffeeScript into JS, then minifies and compresses it
# using uglifyjs.

# Dependencies:
#   http://jashkenas.github.com/coffee-script/
#   https://github.com/mishoo/UglifyJS

echo "Compiling CoffeeScript"
coffee --output ./build -c ./lib/jquery.msgbox.coffee

echo "Compressing"
uglifyjs ./build/jquery.msgbox.js  > ./build/jquery.msgbox.min.js

echo "Done."
