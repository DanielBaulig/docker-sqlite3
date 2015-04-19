# _docker-sqlite3_

docker-sqlite3 creates a minimal sqlite3 docker image based off of
busybox:ubuntu-14.04. Ideal for sqlite3 data-only containers.

# Create

    make

Will create a docker image with the name dbaulig/sqlite3, output the image to
sqlite3.tar.gz as a distributable image and create a reference to the image's
hash in refs/latest.

You will need curl, tar and a build chain installed to download, extract and
build sqlite from source and sudo installed to to run docker commands.

# License
The MIT License (MIT)

Copyright (c) 2015 Daniel Baulig (daniel.baulig@gmx.de)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
