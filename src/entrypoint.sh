#!/bin/bash

function main() {
    # Load Hadoop configurations and run daemons
    ./hadoop_entrypoint.sh $1

    # Load Giraph configurations
    ./giraph_config_loader.sh

    if [[ "$1" == "giraph" ]]; then
        tail -f /dev/null
    fi
}

main $1