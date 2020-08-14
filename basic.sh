#xshell登入sftp
sftp sy1@XXX.XXX.XXX.XXX

##grep
grep 1 test1.txt  #输出含有test1.txt文件中含有1的行
grep 1 test1.txt test2.txt  #输出含有test1.txt和test2.txt文件中含有'1'字符的行
grep '1 2' test1.txt  #输出含有test1.txt文件中含有'1 2'字符串的行

##less
1、输入/+要查找内容,按enter; 再按n，则显示下一个

##find
find ~/ -name test  #寻找家目录下文件名为test的文件
find ~/ -name workspace -type d  #寻找家目录下文件名为workspace的文件夹
find . -name sy1 -type f   #寻找当前文件夹下文件名为sy1的文件

##创建用户
sudo useradd -r -m -s /bin/bash sy2    #-r:建立系统账号;-m:建立用户主目录;-s:指定用户登入后使用的shell
##删除用户
sudo userdel -r sy2   #-r:同时删除用户主目录
#创建组
sudo groupadd transcriptome

##进程监控
#静态监控
ps aux | grep + 关键字    #显示当前系统上运行的所有进程,搜索关键进程

#打包
tar -cvf test.tar test/
#打包并压缩成.gz
tar -zcvf test.tar.gz test/   #等同于gunzip test.tar.gz;tar -xf test.tar
#打包并压缩成.bz2
tar -jcvf test.tar.bz2 test/  
#解开.tar文件
tar -xvf test.tar
#解压.gz并解开.tar文件
tar -zxvf test.tar.gz
#解压.bz2并解开.tar文件
tar -jxvf test.tar.bz2

#添加硬盘：参考https://jingyan.baidu.com/article/f7ff0bfc268c3a2e27bb1373.html
#查看硬盘是否添加成功
ls /dev | grep sd
#设置硬盘分区
sudo fdisk /dev/sdb    #具体步骤参考《ubuntu linux操作系统实用教程》P109-112
#针对性显示硬盘情况
df -t ext4
#格式化磁盘
sudo mkfs.ext4 /dev/sdb1
#挂载
sudo mount /dev/sdb1 /pub
#设置开机自启动挂载, 不设置这个开机也有挂载，要设置??
sudo blkid  
sudo vim /etc/fstab
#取消挂载
sudo umount /dev/sdb1


#显示文件和文件夹空间使用情况
du -sh ./ #显示当前文件夹的总大小
du -ah    #显示每一个文件的大小

#跨服务器拷贝
scp test sy1@XXX.XXX.XXX.XXX:/home/sy1  #将本地的test文件拷贝到另一台服务器的家目录

#登入另一台服务器
ssh -l 用户名 XXX.XXX.XXX.XXX

##vim编辑器
gg  #光标移动到文件头
yy  #复制
p   #粘贴
:%s/pattern/string  #全文中用pattern替换string





