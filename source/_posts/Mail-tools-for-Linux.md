---
layout: Mutt
title: 1
date: 2017-06-22 16:46:44
tags: Linux,mutt
---
# 从Linux发送邮件说起
##  运维之道

没有绝对稳定的系统，能在第一时间发现故障并解决它，就是一个合格的运维工程师。
如何第一时间发现故障，甚至防患于未然，本文不做讨论。
今天要说的是，如何把故障消息迅速传送给一线的运维工程师。
发邮件、发短信、打电话，最基础的当然是发邮件。

##  Linux邮件之旅
最早的Linux老鸟，应该都熟悉mail/mailx;
### mail/mailx 老牌的信使
mail／mailx这是Linux发行版标配的邮件客户端
mailx [-BDdEFintv~] [-s subject] [-a attachment ] [-c cc-addr] [-b bcc-addr] [-r from-addr] [-h hops] [-A account] [-S variable[=value]] to-addr . . .
eg：echo "Email text" | mail -s "Test Subject" user@example.com
-s后面注明主题
echo “Body with attachment "| mail -a foo.tar.gz -s "attached file" user@example.com
-a用来制定附件路径
mail -s "message send from file" user@example.com < /path/to/file
也可以读取文件作为邮件内容。

### Mutt 邮件利器
mutt在Unix上历史悠久，Linux也是声名远扬。
相对mail/mailx来说，它甚至不依赖sendmail服务。
命令格式与mail基本相同
echo "This is the body" | mutt -s "Testing" user@example.com -a foo.tar.gz –a bar.tar.gz
mutt以来postfix,要求这个服务必须开启。
另外如果安装后，后来又修改了主机名hostname也是会出问题的。
---------------
邮件传输系统设计之初用于传送7位编码（类似ASCII）的文本内容，对于8位的二进制内容（如程序文件或者图片）必须借助一个uuencode的工具完成。
eg：uuencode example.jpeg example.jpeg | mutt user@example.com