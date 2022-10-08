#!/bin/bash
# ======================================================================
# REVISION HISTORY:

# AUTHOR				DATE			DETAILS
# --------------------- --------------- --------------------------------
# Brealy Fabian Padron R	 2021-06-04	  Initial version

# LICENSE: CC https://neighbordevcr.com
# ======================================================================


echo "Starting to run the script..."
# VARIABLE ASSIGNMENT
# Show hostname:
HOST=$(hostname)
# User executing the script:
CURRENTUSER=$(whoami)
# Current date:
CURRENTDATE=$(date +%F)
# Host IP address:
IPADDRESS=$(hostname -I | cut -d ' ' -f1)

# SHOW MESSAGES
echo "Today is $CURRENTDATE"
echo "Hostname: $HOST ($IPADDRESS)"
echo "User info for $CURRENTUSER:"
grep $CURRENTUSER /etc/passwd