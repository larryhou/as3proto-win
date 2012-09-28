# as3proto-win
****************************

### protobuf for Actionscript 3 on Windows
================================================================
该项目搭建了**AS3 protobuf**所需的**Windows**运行环境以及**AS3**类库，整合了**Google [protobuf][1]**和**[protoc-gen-as3][2]**第三方插件资源
[1]: http://code.google.com/p/protobuf/ "http://code.google.com/p/protobuf/"
[2]: https://code.google.com/p/protoc-gen-as3/ "https://code.google.com/p/protoc-gen-as3/"

### 目录说明
===================
1. **src**目录包含了**protobuf**编解码所需要的**AS3**代码库，需要导入项目
2. **lib**目录包含了**AS3**代码库的**SWC**版本
3. **proto**目录有一个简单的**hello.proto**文件，仅用作测试用途

### protobuf使用帮助
===================
进入**sdk**目录，打开**setup.bat**文件，初始化一下配置
* 把**PROTO_DIR**修改为\*.proto文件的存储目录
* 把**OUTPUT_DIR**修改为生成**AS3**代码的输出目录

其实在默认配置下，直接运行**protobuf.bat**输入hello既可以在**OUTPUT_DIR**目录生成实例代码
```
----------------------------
Type proto file name:
hello

... ... ...

C:\Users\larryhou\Downloads\protobuf\protobuf\sdk>.\framework\protoc.exe --proto
_path="..\proto" --plugin=protoc-gen-as3=".\framework\protoc-gen-as3.bat" --as3_
out="..\output" "..\proto\hello.proto"

DONE! Press any key to process another proto file...
```

**hello.proto**文件内容  
```
message HelloWorld{
    optional int32 code = 1;
    optional string name = 2;
    optional Info info = 3;

    message Info{
        optional string version = 1;
    }
}
```

**HelloWorld.as**代码内容   
```actionscript
package  {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import HelloWorld.Info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class HelloWorld extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CODE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("HelloWorld.code", "code", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var code$field:int;

		private var hasField$0:uint = 0;

		public function clearCode():void {
			hasField$0 &= 0xfffffffe;
			code$field = new int();
		}

		public function get hasCode():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set code(value:int):void {
			hasField$0 |= 0x1;
			code$field = value;
		}

		public function get code():int {
			return code$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("HelloWorld.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("HelloWorld.info", "info", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return HelloWorld.Info; });

		private var info$field:HelloWorld.Info;

		public function clearInfo():void {
			info$field = null;
		}

		public function get hasInfo():Boolean {
			return info$field != null;
		}

		public function set info(value:HelloWorld.Info):void {
			info$field = value;
		}

		public function get info():HelloWorld.Info {
			return info$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCode) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, code$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			if (hasInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, info$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var code$count:uint = 0;
			var name$count:uint = 0;
			var info$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (code$count != 0) {
						throw new flash.errors.IOError('Bad data format: HelloWorld.code cannot be set twice.');
					}
					++code$count;
					this.code = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: HelloWorld.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (info$count != 0) {
						throw new flash.errors.IOError('Bad data format: HelloWorld.info cannot be set twice.');
					}
					++info$count;
					this.info = new HelloWorld.Info();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.info);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}

```

**Info.as**代码内容
```actionscript
package  {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import HelloWorld.Info;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class HelloWorld extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CODE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("HelloWorld.code", "code", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var code$field:int;

		private var hasField$0:uint = 0;

		public function clearCode():void {
			hasField$0 &= 0xfffffffe;
			code$field = new int();
		}

		public function get hasCode():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set code(value:int):void {
			hasField$0 |= 0x1;
			code$field = value;
		}

		public function get code():int {
			return code$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("HelloWorld.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("HelloWorld.info", "info", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return HelloWorld.Info; });

		private var info$field:HelloWorld.Info;

		public function clearInfo():void {
			info$field = null;
		}

		public function get hasInfo():Boolean {
			return info$field != null;
		}

		public function set info(value:HelloWorld.Info):void {
			info$field = value;
		}

		public function get info():HelloWorld.Info {
			return info$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCode) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, code$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			if (hasInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, info$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var code$count:uint = 0;
			var name$count:uint = 0;
			var info$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (code$count != 0) {
						throw new flash.errors.IOError('Bad data format: HelloWorld.code cannot be set twice.');
					}
					++code$count;
					this.code = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: HelloWorld.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (info$count != 0) {
						throw new flash.errors.IOError('Bad data format: HelloWorld.info cannot be set twice.');
					}
					++info$count;
					this.info = new HelloWorld.Info();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.info);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}

```

