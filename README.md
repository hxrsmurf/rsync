Rsync script to backup my seafile-data to another server. Will be moving this to Nearline or S3/Glacier shortly with duplicity encryption. But don't really have the upload speed at home for that. 

This simply logs everything with the date, and goes on its merry way. I did a check for the NFS mount I have, because one time the NFS wasn't mounted and I accidentally sync'd to the local disk drive not the remote. Whoops! That ain't happening again.


