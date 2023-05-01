for file in *; do
    if [[ $file =~ ^[a-zA-Z] ]]; then
        # execute command on the file
        echo $file
    fi
done