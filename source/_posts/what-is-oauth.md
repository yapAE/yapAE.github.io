---
title: what is oauth
date: 2017-12-01 16:44:30
tags: [Oauth]
---
## Oauth介绍
在Web应用中，我们习惯了使用Session来识别用户的登录状态.
http协议本无状态(stateless),如何跳出Session来解决这个问题？
Oauth2.0的认证就是用来解决这个问题的。
### 术语单词
熟悉以下术语单词，对深入了解Oauth很有必要。
 1. Resource
 2. Resource Server
 3. Resource Owner
 4. User Agent
 5. Client
 6. Authorization Server
 7. Access Token
 8. Bearer Token

### 流程

  Resource Owner ----> Resource
最简单的理解，就是用户获取资源，加入权限管理后就稍稍复杂了

    ------                               ----------------------
   |客户端|--A--Authorization Request-->| Resource Owner      |
   |Client|<-B--Authorization Grant-----| Resource Owner      |
   |CLient|--C--Authorization Grant---->| Authorization Server|
   |CLient|<-D--Access Token------------| Authorization Server|
   |Client|--E--Access Token----------->| Resource Server     |
   |Client|<-F--Protected Rource--------| Resource Server     |
