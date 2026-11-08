# Solution

    mkdir lab17
    vim lab17/hello.sh

Type this into the file, save and quit (`:wq`):

    #!/bin/bash
    for name in "$@"; do
        echo "Hello, $name"
    done

Then:

    chmod +x lab17/hello.sh
    lab17/hello.sh Zed Mia
