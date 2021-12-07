# 哨兵EMAIL申请

## Git 用法：

第一步：FORK:)

第二步：克隆代码到本地

`git clone https://github.com/${your-name}/Mail-Action.git`

第三步：切换到`SCS-1.0-dev`远程分支（远程库默认名字为origin）

`git checkout SCS-1.0-dev`

第四步：在该分支提交你的更改，然后提交

```bash
$ git add .
$ (linux & mac) git commit -m "[`date +%Y/%m/%d/%T`]<调试::ACTION>: commit by `git config --global --list|grep user.name|awk -F"=" '{print $2}'`"
> (推荐windows Git Bash) git commit -m "[`date +%Y/%m/%d/%T`]<测试::GitBash on MSWin>: commit by `git config --global --list|grep user.name|awk -F"=" '{print $2}'`"
$ git push origin SCS-1.0-dev
```

第五步：推送本地分支到自己的fork库

```bash
git remote add upstream git@github.com:sentryCyberSec/Mail-Action.git

git fetch origin
git merge SCS-1.0-dev
git push upstream SCS-1.0-dev
```

第六步：点击上面的`pull request`就可以推送请求了，确认无误后填写`pull request`的标题和具体内容，点击`create pull request`绿色按钮推送

## 手动触发

- [git@github.com: Permission denied (publickey). 解决github Permission denied (publickey)问题](https://www.jianshu.com/p/f22d02c7d943)


# Email Action

*GithubAction发送邮件样例，仅仅只是一个测试demo*

*example of action to send an email. Just a test:)*

- **基于Github Action的Bash自动邮件脚本**
	- **邮件网页模版设计;**
	- **邮件HTML格式`html_body: file://result.html`;**
	- **抄送`cc`.**

## 效果

<img src="/assets/IMG_E169327EB634-1.jpeg" width="50%" height="50%"> 

## 下一步计划

- 加入关注点细节，如突出关注点、上次运行是的关注点内容对比；
- 现HTML模版过于简单，计划添加复杂HTML模版。


## 拓展阅读

- 现成的mail api aciton
	- [dawidd6/action-send-mail](https://github.com/dawidd6/action-send-mail)
- 参考demo代码
	- [ruanyf/weather-action](https://github.com/ruanyf/weather-action)
- 相关官方文档
	- [Github Actions.](https://github.com/features/actions)

## 参考文献/代码

- [crontab执行时间计算](https://tool.lu/crontab/)
- [bash-use-printf-for-comma-seperated-columns](https://stackoverflow.com/questions/51578299/bash-use-printf-for-comma-seperated-columns)
- [sed相关用法]
	- [sed在行首（行尾）添加字符串；在某行后添加多行字符串](https://blog.csdn.net/qianlong4526888/article/details/8669935)
	- [sed当中使用变量替换以及执行外部命令](https://blog.csdn.net/linwhwylb/article/details/7184748)

## 致谢:)

感谢以上所有链接文章的作者以及开源代码:)