#!/bin/sh

# Source in the Sybase environment variables

source /opt/sybase/SYBASE.sh

# Start SYBASE
nohup /opt/sybase/ASE-16_0/install/RUN_MYSYBASE &

# Wait a bit for Sybase to boot
sleep 30
/opt/sybase/ASE-16_0/bin/sqllocres -r /opt/tmp/sqlloc.rs

# exit ${RET}
exit 0
