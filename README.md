# Usage

1. replace the authorized_keys ssh public key with your own
2. replace the unique enforced names in the fly.toml (if you intend to host with fly)
3. connect to your deployed instance with ssh, using your favorite tooling (FileZilla, scp, rsync... etc) to copy your backups to the `/mnt/data/html/*` directories.

# notes

:warning: YMMV! It might require a bit of manual fiddling, make sure to test (it's the only way... always)

When testing locally, i like to use a local file mount in docker called `/mnt` in the same directory as the project (hence ignored in the .gitignore), similar to the mount directory that gets used when deployed (and placed in the mounted volume). 
I did not upload the actual file backups to git since they are gigabytes big (might consider setting up LFS and some hosted place in the future as an extra backup).

## scp, rsync, FileZilla... and static IPv4

fly does not do static IPv4 addressses anymore (totally understandable, they are costly, and that means the users pay about $2/month per IP, which is silly when the machine itself costs close to $0), when I do maintenance (aka. uploading files), I'll assign a static ip for that small timeframe. You can [read more here](https://www.richardneililagan.com/posts/copying-files-to-fly-io-volume/).

```fly ips allocate-v4```

followed by 

```fly ips release <IP-to-release>``` 

when you're done.

## "The quirky way" that doesn't require assigning static IPv4's

fly supports a crude SFTP setup from their CLI tool. `fly ssh sftp console`. it doesn't allow you to uplad directories, nor to overwrite a single file. But it's still _fine_ for a single file upload every now and then. 
The steps I use are:
1. delete the single file from the normal console via `fly ssh console`.
2. open the sftp shell with `fly ssh sftp shell`
3. walk the directory to location of the file (the sftp shell supports `ls` and `cd`)
4. run `put path/to/file/on/local/drive.txt` (uses the cwd of both local and remote)

