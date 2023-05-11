<<<<<<< HEAD:1.Linux/5.ExecuteOnEachFileIf.sh

for file in *; do
    if [[ $file =~ ^[a-zA-Z] ]]; then
        # execute command on the file
        echo $file
    fi
=======
for file in *; do
    if [[ $file =~ ^[a-zA-Z] ]]; then
        # execute command on the file
        echo $file
    fi
>>>>>>> 1fbdc7ab35c8fb02af6d42156536594426450d32:Linux/5.ExecuteOnEachFileIf.sh
done