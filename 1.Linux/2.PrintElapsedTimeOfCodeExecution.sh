<<<<<<< HEAD:1.Linux/2.PrintElapsedTimeOfCodeExecution.sh
#!/bin/bash

start_time=$(date +%s)

# your code here

end_time=$(date +%s)

=======
#!/bin/bash

start_time=$(date +%s)

# your code here
# python script.py

end_time=$(date +%s)

>>>>>>> 1fbdc7ab35c8fb02af6d42156536594426450d32:Linux/2.PrintElapsedTimeOfCodeExecution.sh
echo "Time elapsed: $(($end_time - $start_time)) seconds"