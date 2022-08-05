#!/bin/bash

# Here I am trying to check for different extensions. And call different scripts were necessary.
git() {
    js=(`find ./ -maxdepth 1 -name "*.js"`);
    python=(`find ./ -maxdepth 1 -name "*.py"`);
    jsFramework=(`find ./ -maxdepth 1 -name "package.json"`);
    dart=(`find ./ -maxdepth 1 -name "pubspec.yaml"`);
    echo ${#js[@]};
    if [ ${#js[@]} -gt 0 ]; then 
        echo true 
    elif [ ${#python[@]} -gt 0 ]; then
        echo true
    elif [ ${#jsFramework[@]} -gt 0 ]; then
        echo true
    elif [ ${#dart[@]} -gt 0 ]; then
        source ./js.sh --source-only;
        
        echo true
    else
        echo false
    fi
}
