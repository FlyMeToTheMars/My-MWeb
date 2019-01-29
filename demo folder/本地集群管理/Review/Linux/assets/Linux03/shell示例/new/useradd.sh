#！/bin/sh
# The script to add user

# /etc/passwd info
echo "please input username:"
read name
echo "please input number:"
read num
n=1
while [ $n -le $num ]
do
     /usr/sbin/useradd $name$n
     n=`expr $n + 1 `
done

# /etc/shadow info
echo "please input the password:"
read passwd
m=1
while [ $m -le $num ]
do
 echo $passwd | /usr/bin/passwd --stdin $name$m > /dev/null
 m=`expr $m + 1`
done