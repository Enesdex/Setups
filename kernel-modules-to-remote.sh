
port=10021
ssh_key=image/stretch.id_rsa
user=root
ip=127.0.0.1

remote_kernel_ver=xxxxxx
mkdir copy_modules

rm /root/.ssh/known_hosts
ssh -p $port -i $ssh_key $user@$ip "mkdir -p /lib/modules/$remote_kernel_ver"
scp -P $port -i $ssh_key /lib/modules/$(uname -r)/* $user@$ip:/lib/modules/$remote_kernel_ver/

for i in $(find . | grep "\.ko$" | cut -c 3-1000 |sed 's%/[^/]*$%%' | sort -u)
do
mkdir -p "copy_modules/$i"
done


for i in $(find . | grep "\.ko$" | cut -c 3-1000)
do
cp $i "copy_modules/$i"
done

tar zcvf modules.tar.gz copy_modules/

scp -P $port -i $ssh_key modules.tar.gz $user@$ip:/root
