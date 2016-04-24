# go_anywhere
Linux多服务器多项目下，迅速切换目录小工具

####1.修改`.local.txt.example`为`local.txt`
```
mv .local.txt.example local.txt
```
####2.修改`.servers.txt.example`为`servers.txt`
```
mv .servers.txt.example servers.txt
```
####3.配置软链接(别名)，在`.bash_profile`中添加如下代码
```
alias go="sh ~/work/ztcbin/towhere.sh"
alias lc="source ~/work/ztcbin/tolocal.sh"
```
####4.刷新环境变量,使其立即生效
```
sh ~/.bash_profile
```
####5.修改`tolocal.sh`中line17为自己电脑路径
####6.修改`towhere.sh`中line7为自己电脑路径

####7.效果图
![go_anywhere](http://7xslzg.com2.z0.glb.clouddn.com/go_anywhere.png)