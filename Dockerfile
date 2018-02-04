FROM exolyte/base:latest

MAINTAINER Uday Kabe <uday.kabe@exolyte.com>

# Adapted from the original by:
# Borja Burgos <borja@tutum.co>, Mia Iversen <mia@chillfox.com

ENV S3_BUCKET_NAME docker-backups.example.com
ENV AWS_ACCESS_KEY_ID **DefineMe**
ENV AWS_SECRET_ACCESS_KEY **DefineMe**
ENV AWS_DEFAULT_REGION us-east-1
ENV PATHS_TO_BACKUP /paths/to/backup
ENV BACKUP_NAME backup
ENV RESTORE false

RUN apt-get update && apt-get install -y python-pip && pip install awscli

ADD scripts/backup.sh /backup.sh
ADD scripts/restore_from_s3bucket.sh /restore.sh
ADD scripts/copy_to_s3bucket.sh /copy_to_s3bucket.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh

CMD ["/run.sh"]
