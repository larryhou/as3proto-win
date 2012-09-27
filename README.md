# as3proto-win
****************************

### protobuf for Actionscript 3 on Windows
================================================================
该项目搭建了AS3 protobuf所需的Windows运行环境以及AS3类库，整合了Google [protobuf][1]和[protoc-gen-as3][2]第三方插件资源
[1]: http://code.google.com/p/protobuf/ "http://code.google.com/p/protobuf/"
[2]: https://code.google.com/p/protoc-gen-as3/ "https://code.google.com/p/protoc-gen-as3/"

### 目录说明
===================
1. src目录包含了protobuf编解码所需要的AS3代码库，需要导入项目
2. lib目录包含了AS3代码库的SWC版本
3. proto目录有一个简单的hello.proto文件，仅用作测试用途

### 快速熟悉
===================
进入sdk目录运行protobuf.bat，输入hello并回车，这时会生成output目录，这个目录包含了生成的AS3代码

### NOTE
================
proto、output两个目录是可配置的，详情查看**sdk/README.md**文件
