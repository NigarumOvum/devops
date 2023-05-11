#!/bin/bash
# ======================================================================
# REVISION HISTORY:

# AUTHOR				DATE			DETAILS
# --------------------- --------------- --------------------------------
# Brealy Fabian Padron R	 2021-06-04	  Initial version

# LICENSE: CC https://neighbordevcr.com
# ======================================================================

while [ true ] ;do
used=`free -m |awk 'NR==3 {print $4}'`

if [ $used -lt 1000 ] && [ $used -gt 800 ]; then
echo "Free memory is below 1000MB. Possible memory leak!!!" | /bin/mail -s "HIGH MEMORY ALERT!!!" user@mydomain.com


fi
sleep 5
done