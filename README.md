# Usage

1. replace the authorized_keys ssh public key with your own
2. replace the unique enforced names in the fly.toml (if you intend to host with fly)
3. connect to your deployed instance with ssh, using your favorite tooling (FileZilla, scp, rsync... etc) to copy your backups to the `/mnt/data/html/*` directories.

# notes 

:warning: YMMV It might require a bit of manual fiddling, make sure to test (it's the only way... always)

When testing locally, i like to use a local file mount in docker called `/mnt` in the same directory as the project (hence ignored in the .gitignore), similar to the mount directory that gets used when deployed (and placed in the mounted volume). 
I did not upload the actual file backups to git since they are gigabytes big (might consider setting up LFS and some hosted place in the future as an extra backup).
