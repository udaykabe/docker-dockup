#!/usr/bin/env sh

export PATH=$PATH:/usr/bin:/usr/local/bin:/bin

# Get timestamp
: ${BACKUP_SUFFIX:=.$(date +"%Y-%m-%d-%H-%M-%S")}
readonly tarball=$BACKUP_NAME$BACKUP_SUFFIX.tar.gz

# Create a gzip compressed tarball with the volume(s)
tar czf $tarball $BACKUP_TAR_OPTION $PATHS_TO_BACKUP

# Save to S3
copy_to_s3bucket.sh $tarball
