```powershell
docker pull stilliard/pure-ftpd
docker run --rm -d --name ftpd_server -p 21:21 -p 30000-30009:30000-30009 `
-e "PUBLICHOST=localhost" `
-e FTP_USER_NAME=rico -e FTP_USER_PASS=12345 -e FTP_USER_HOME=/home/rico stilliard/pure-ftpd
```

