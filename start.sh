#!/bin/bash

# created by pdc

function help(){
	echo -e "\033[31m其他：\033[0m"
	echo -e "\033[31mhelp          帮助\033[0m"
	echo -e "\033[31medit          编辑\033[0m"
	echo -e "\033[31musage         更方便的使用\033[0m"
	echo -e "\033[31mexplain       简介\033[0m"
	echo -e "\033[31mcolor         字体颜色例子\033[0m"
	echo -e "\033[31mfunny         有趣的字符图画，随机显示\033[0m"
	echo ''
	echo -e "\033[34m文档、代理等服务(根据个人修改)：\033[0m"
	echo -e "\033[34mef-java8         effective-java on java8本地中文文档。gitee在线文档地址：https://lingcoder.gitee.io/onjava8\033[0m"
	echo -e "\033[34myapi             yapi文档、测试管理工具，替换swagger-ui。注：需要依赖mongodb。github：https://github.com/YMFE/yapi\033[0m"
	echo -e "\033[34mproxy            启动goproxy相关代理\033[0m"
	echo -e "\033[34mcht              简易在线查找文档。可带参数，如：start.sh cht python。github：https://github.com/chubin/cheat.sh\033[0m"
	echo -e "\033[34mactivemq         启动activemq，需带参数。如：start.sh activemq start, start.sh activemq stop\033[0m"
	echo -e "\033[34mmycat            启动mycat，可带参数。如：start.sh mycat console\033[0m"
	echo -e "\033[34mnacos            启动nacos，需带参数。如：start.sh nacos start, start.sh nacos stop\033[0m"
	echo -e "\033[34mseata            启动seata，可带参数。注：需要启动mysql。\033[0m"
	echo -e "\033[34mhadoop           启动virtualbox headless hadoop节点，参数为start、stop。\033[0m"
	echo ''
	echo -e "\033[33m安装的app（根据个人安装app修改）：\033[0m"
	echo -e "\033[33mdocker        打开docker\033[0m"
	echo -e "\033[33midea          打开idea，可带参数。如：start.sh idea ./pom.xml\033[0m"
	echo -e "\033[33mv2ray         打开v2ray\033[0m"
	echo -e "\033[33mpostman       打开postman\033[0m"
	echo -e "\033[33msublime       打开sublime。可带参数。如：start.sh sublime ./xxx.txt\033[0m"
	echo -e "\033[33mtypora        打开typora。可带参数。如：start.sh typora ./xxx.txt\033[0m"
	echo -e "\033[33mvbox          打开vbox\033[0m"
	echo -e "\033[33mxl            打开迅雷\033[0m"
	echo -e "\033[33mvscode        打开vscode。可带参数。如：start.sh vscode ./xxx.txt\033[0m"
	echo -e "\033[33mdd            打开钉钉\033[0m"
	echo -e "\033[33mqq            打开qq\033[0m"
	echo -e "\033[33msafari        打开safari\033[0m"
	echo -e "\033[33mwechat        打开wechat\033[0m"
	echo -e "\033[33mgoland        打开goland。可带参数。如：start.sh goland ./\033[0m"
	echo -e "\033[33mhbuilder      打开hbuilder。可带参数。如：start.sh hbuilder ./xxx.txt\033[0m"
	echo -e "\033[33mchrome        打开chrome\033[0m"
	echo -e "\033[33mpycharm       打开PyCharm。可带参数。如：start.sh pycharm ./xxx.py\033[0m"
	echo -e "\033[33mkeym          打开证书管理工具KeyManager\033[0m"
	echo -e "\033[33mcharles       打开青花瓷代理抓包工具\033[0m"
	echo -e "\033[33mtm            打开transmit 2\033[0m"
	echo -e "\033[33mxcode         打开xcode。可带参数。如：start.sh xcode ./xxx.c\033[0m"
	echo -e "\033[33mdatagrip      打开数据库管理工具datagrip。可带参数。如：start.sh datagrip ./xxx.sql\033[0m"
	echo -e "\033[33mwebstorm      打开webstorm。可带参数。如：start.sh pycharm ./xxx.html\033[0m"
}

svc=$1
# 去掉第一个参数，重新组合参数
shift

case "$svc" in

	# ------- 自定义服务 -------
	'ef-java8')
		cd ~/data/book/java/OnJava8 
		gitbook serve
		;;
	'yapi')
		cd ~/data/doc/yapi/my-yapi
		node vendors/server/app.js
		;;
	'proxy')
		~/shell/sh/start_goproxy.sh
		;;
	'cht')
		~/cht.sh $@
		;;
	'activemq')
		cd ~/data/tools/apache-activemq-5.16.0/bin
		./activemq $@
		;;
	'mycat')
		cd ~/data/tools/mycat/bin
		./mycat $@
		;;
	'nacos')
		cd ~/data/tools/nacos/bin
		if [[ $1 = 'start' ]]; then
			./startup.sh
		elif [[ $1 = 'stop' ]]; then
			#statements
			./shutdown.sh
		else
			echo '请输入start或者stop。'
		fi
		;;
	'seata')
		cd ~/data/tools/seata/bin
		./seata-server.sh $@
		;;
	'hadoop')
		if [[ $1 = 'start' ]]; then
		  for i in {0..3}; do VBoxManage startvm "node0${i}-hadoop$((i+1))" --type headless; done
		elif [[ $1 = 'stop' ]]; then
		  for i in {0..3}; do VBoxManage controlvm "node0${i}-hadoop$((i+1))" acpipowerbutton; done
		else
			echo '请输入start或者stop。'
		fi
		;;

	# ------- 以下为mac app -------
	'docker')
		open -a docker
		;;
	'idea')
		open -a intellij\ idea $@
		;;
	'v2ray')
		open -a v2ray
		;;
	'postman')
		open -a postman
		;;
	'sublime')
		open -a sublime\ text $@
		;;
	'typora')
		open -a typora $@
		;;
	'vbox')
		open -a virtualbox
		;;
	'xl')
		open -a thunder
		;;
	'vscode')
		open -a visual\ studio\ code $@
		;;
	'dd')
		open -a dingtalk
		;;
	'qq')
		open -a qq
		;;
	'safari')
		open -a safari
		;;
	'wechat')
		open -a wechat
		;;
	'goland')
		open -a goland $@
		;;
	'hbuilder')
		open -a hbuilderx $@
		;;
	'chrome')
		open -a google\ chrome
		;;
	'keym')
		open -a keymanager
		;;
	'charles')
		open -a charles
		;;
	'tm')
		open -a transmit\ 2
		;;
	'xcode')
		open -a xcode $@
		;;
	'datagrip')
		open -a datagrip $@
		;;
	'webstorm')
		open -a webstorm $@
		;;

	# ------- other --------
	'help')
		help
		;;
	'edit')
		vi $0
		;;
	'usage')
		echo -e '1、进入此shell所在目录'
		echo -e '2、执行\033[35mchmod +x ./start.sh\033[0m添加可执行权限'
		echo -e '3、如果安装了zsh：\033[35mvi ~/.zshrc\033[0m(未安装：\033[35mvi /etc/profile\033[0m)'
		echo -e '4、把shell脚本作为别名start。如：\033[35malias start="~/data/shell/start.sh\033[0m"'
		echo -e '5、保存退出新开命令行窗口（未安装zsh无需新开，执行\033[35msource /etc/profile\033[0m即可）。则可以使用start命令启动相关程序。如：'
		echo -e '           \033[35mstart docker\033[0m'
		echo -e '           \033[35mstart idea\033[0m'
		echo -e '           \033[35mstart idea ./\033[0m'
		;;
	'explain')
		echo -e '\033[31m此脚本很简单，没什么技术含量。可以自己修改脚本文件增加自己的功能，此脚本只是方便在命令行下方便打开某些app或者服务。特别是某些服务或者本地在线文档，一多就容易忘记服务在哪里、怎么起，所以整合了这个脚本，统一进行管理，方便忘记时查询跟启动。\033[0m'
		;;
	'color')
		echo -e "\033[30m 黑色字 \033[0m" "echo -e \"\\\033[30m 黑色字 \\\033[0m\""
		echo -e "\033[31m 红色字 \033[0m" "echo -e \"\\\033[31m 红色字 \\\033[0m\""
		echo -e "\033[32m 绿色字 \033[0m" "echo -e \"\\\033[32m 绿色字 \\\033[0m\"" 
		echo -e "\033[33m 黄色字 \033[0m" "echo -e \"\\\033[33m 黄色字 \\\033[0m\"" 
		echo -e "\033[34m 蓝色字 \033[0m" "echo -e \"\\\033[34m 蓝色字 \\\033[0m\"" 
		echo -e "\033[35m 紫色字 \033[0m" "echo -e \"\\\033[35m 紫色字 \\\033[0m\"" 
		echo -e "\033[36m 天蓝字 \033[0m" "echo -e \"\\\033[36m 天蓝字 \\\033[0m\"" 
		echo -e "\033[37m 白色字 \033[0m" "echo -e \"\\\033[37m 白色字 \\\033[0m\""
		;;
	'funny')
		rand=$(($RANDOM % 4))
		echo '------------------------------------------------------------------------'
		if [[ $rand = 0 ]]; then
			echo -e '\033[32m	                          ########                  #
	                      #################            #
	                   ######################         #
	                  #########################      #
	                ############################
	               ##############################
	               ###############################
	              ###############################
	              ##############################\033[0m
	                              #    ########   #
	                 \033[31m##        ###\033[0m        ####   ##
	                                      ###   ###
	                                    ####   ###
	               ####          ##########   ####
	               #######################   ####
	                 ####################   ####
	                  \033[33m##################  ####
	                    ############      ##
	                       ########        ###
	                      #########        #####
	                    ############      ######\033[0m
	                   ########      #########
	                     #####       ########
	                       ###       #########
	                      ######    ############
	                     #######################
	                     \033[36m#   #   ###  #   #   ##
	                     ########################
	                      ##     ##   ##     ##\033[0m'
	    elif [[ $rand = 1 ]]; then
	    	echo -e '           ,__,
           (\033[33moo\033[0m)____
           (__)    )\
              ||--|| *'
		elif [[ $rand = 2 ]]; then
			echo -e '\033[34m     o O o             
              o O          
                 o         
 |^^^^^^^^^^^^^^|l___      
 |    PAYLOAD     |""\___, 
 |________________|__|)__| 
 |(@)(@)"""**|(@)(@)**|(@) \033[0m'
		else
			echo -e '\033[35m  |""""""""""""|======[***  
  |  EXPLOIT   \            
  |_____________\_______    
  |==[msf >]============\   
  |______________________\  
   \(@)(@)(@)(@)(@)(@)(@)/   
    *********************    \033[0m'
		fi
		;;
	*)
		echo -e "参数不能识别，请重新输入。或者输入help获取帮助，如：\033[35m./start.sh help\033[0m"
		;;
esac