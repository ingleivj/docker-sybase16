FROM nguoianphu/docker-sybase

COPY s* /opt/tmp/

RUN chmod +x /opt/tmp/sybase-update-sort.sh \
 && /opt/tmp/sybase-update-sort.sh 

# Bypass issue with Snap validation.
# See https://answers.sap.com/questions/13286419/ase-16-signal-11-stack-trace-snapvalidate-kba-3018.html
#RUN sed -i 's/sMYSYBASE/sMYSYBASE -T11889/g' /opt/sybase/ASE-16_0/install/RUN_MYSYBASE

# Same entrypoint as base image
ENTRYPOINT ["/sybase-entrypoint.sh"]

