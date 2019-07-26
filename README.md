# LuaJava

一款使 `Lua` 可以方便的调用 `Java` 的工具.

## 介绍
LuaJava is a scripting tool for Java. The goal of this tool is to allow scripts written in Lua to manipulate components developed in Java.

It allows Java components to be accessed from Lua using the same syntax that is used for accessing Lua`s native objects, without any need
for declarations or any kind of preprocessing.  LuaJava also allows Java to implement an interface using Lua. This way any interface can be
implemented in Lua and passed as parameter to any method, and when called, the equivalent function will be called in Lua, and it's result
passed back to Java.

## 与原 luajava 项目变化

* 适配 LuaJava 至 lua5.3.5 版本
* Lua 源码升级至 5.3.5 版本
* Windows 下一键编译
* 其他系统请自行编译

## 编译

### Windows 一键编译

1. 配置 java 环境.

2. 运行 `OneKeyCompile.bat`.

3. 编译完成,可在项目根目录中看到 **luajava-1.0.dll**、**luajava-1.0.jar** 2个文件.


若需编译好的文件,直接到 [**release**](https://github.com/haikejishu/LuaJava/releases) 下载


![编译选项截图](https://s2.ax1x.com/2019/07/26/em4bad.jpg)
### 其他系统,自行编译测试


## 测试

1. 交互方式执行 lua
`java -cp luajava-1.0.jar org/keplerproject/luajava/Console`

2. 直接执行 lua 文件
`java -cp luajava-1.0.jar org/keplerproject/luajava/Console  xxx.lua`

3. 部分例子
	```
	java -cp luajava-1.0.jar org/keplerproject/luajava/Console ./test/awtTest.lua

	java -cp luajava-1.0.jar org/keplerproject/luajava/Console ./test/simpleLuaFile.lua

	java -cp luajava-1.0.jar org/keplerproject/luajava/Console ./test/testMap.lua

	java -cp luajava-1.0.jar org/keplerproject/luajava/Console ./test/swingTest.lua

	java -cp luajava-1.0.jar org/keplerproject/luajava/Console
	```

![例子截图](https://s2.ax1x.com/2019/07/25/eeZKde.jpg)

## 其它
- 如果你有好的建议或者发现bug，欢迎给我提 **issue**.
- 如果该repo对大家有帮助，给个 **star** 鼓励鼓励吧.

## 常见问题

1.  Can't load AMD 64-bit .dll on a IA 32-bit platform
答:这个是由于 JAVA 虚拟机版本和 DLL 位数不一致,比如 64 位虚拟机配 64 位 DLL.


## 致谢

- [原 luajva 项目](https://github.com/jasonsantos/luajava)

- [Lua 仓库](https://github.com/lua/lua)