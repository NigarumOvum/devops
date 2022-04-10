#!/bin/bash

sudo chown -R www-data:martin .
sudo find . -type d -exec chmod 775 {} \;
sudo find . -type f -exec chmod 664 {} \;
sudo find ./.git -type d -exec chmod 775 {} \;
sudo find ./.git -type f -exec chmod 774 {} \;
