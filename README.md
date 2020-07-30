# useful
### 1、start.sh

> 仅mac使用，可以自定义修改shell，添加自己的app或者服务。

使用前需要给satrt.sh添加可执行权限：`chmod +x ./start.sh`

##### 示例：

```shell
# 获取帮助
./start.sh help

其他：
help          帮助
edit          编辑
usage         更方便的使用
explain       简介
color         字体颜色例子
funny         有趣的字符图画，随机显示

文档、代理等服务(根据个人修改)：
ef-java8         effective-java on java8本地中文文档。gitee在线文档地址：https://lingcoder.gitee.io/onjava8
yapi             yapi文档、测试管理工具，替换swagger-ui。注：需要依赖mongodb。github：https://github.com/YMFE/yapi
proxy            启动goproxy相关代理
cht              简易在线查找文档。可带参数，如：start.sh cht python。github：https://github.com/chubin/cheat.sh
activemq         启动activemq，需带参数。如：start.sh activemq start, start.sh activemq stop
mycat            启动mycat，需带参数。如：start.sh mycat console
nacos            启动nacos，需带参数。如：start.sh nacos start, start.sh nacos stop
seata            启动seata。注：需要启动mysql。

安装的app（根据个人安装app修改）：
docker        打开docker
idea          打开idea，可带参数。如：start.sh idea ./pom.xml
v2ray         打开v2ray
postman       打开postman
sublime       打开sublime。可带参数。如：start.sh sublime ./xxx.txt
typora        打开typora。可带参数。如：start.sh typora ./xxx.txt
vbox          打开vbox
xl            打开迅雷
vscode        打开vscode。可带参数。如：start.sh vscode ./xxx.txt
dd            打开钉钉
qq            打开qq
safari        打开safari
wechat        打开wechat
goland        打开goland。可带参数。如：start.sh goland ./
hbuilder      打开hbuilder。可带参数。如：start.sh hbuilder ./xxx.txt
chrome        打开chrome
pycharm       打开PyCharm。可带参数。如：start.sh pycharm ./xxx.py
keym          打开证书管理工具KeyManager
charles       打开青花瓷代理抓包工具
tm            打开transmit 2
xcode         打开xcode。可带参数。如：start.sh xcode ./xxx.c
datagrip      打开数据库管理工具datagrip。可带参数。如：start.sh pycharm ./xxx.sql
webstorm      打开webstorm。可带参数。如：start.sh pycharm ./xxx.html
```



```shell
# 获取更简便使用方式
./start.sh usage

1、进入此shell所在目录
2、执行chmod +x ./start.sh添加可执行权限
3、如果安装了zsh：vi ~/.zshrc(未安装：vi /etc/profile)
4、把shell脚本作为别名start。如：alias start="~/data/shell/start.sh"
5、保存退出新开命令行窗口（未安装zsh无需新开，执行source /etc/profile即可）。则可以使用start命令启动相关程序。如：
           start docker
           start idea
           start idea ./
```



```shell
# 打开idea

./start.sh idea

# idea打开某个文件夹或者某个文件

./start.sh idea xxx/
./start.sh idea xx/pom.xml

# 打开 docker

./start.sh docker
```



