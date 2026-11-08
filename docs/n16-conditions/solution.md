# Solution

    mkdir lab16
    vim lab16/exists.sh

Type this into the file, save and quit (`:wq`):

    #!/bin/bash
    if [ -f /etc/hosts ]; then
        echo "found"
    else
        echo "missing"
    fi

Then:

    chmod +x lab16/exists.sh
    lab16/exists.sh
