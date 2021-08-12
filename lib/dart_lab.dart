void main() {
  print('Hello Dart!');
  helloDart();
  collectionType();
}

// 没返回值时, void可以省略
helloDart() {
  print('Hello Dart!');
}

/// 变量: dart是脚本类语言, 可以不预先定义变量类型, 自动会类型推断
/// 定义变量可以通过`var`关键字, 也可以通过类型声明
defVar() {
  var str = 'this is var';
  var i = 1;
  String str2 = 'this is var';
  int i2 = 1;
}

/// 常量: `final` 和 `const` 修饰符
/// const: 值不变, 一开始就得赋值
/// final: 可以开始不赋值, 只能赋值一次
/// final不仅有const编译常量的特性, 最重要的它是运行时常量, 既在运行时第一次使用前才初始化
defConstant() {
  // const PI; // error
  const PI = 3.14159;
  final PI2;
  PI2 = 3.14159;
  // PI2 = 3.14159; // error

  final time = DateTime.now();
  // const time2 = DateTime.now(); // error
}

/// 字符串类型
stringType() {
  var str = '''
  line1
  line2
  linen
  ''';
  var str2 = "str = $str";
  print(str2);
}

/// 布尔值类型, 在Dart中, 关键字是`bool`, 而在Java中, 是`boolean`
booleanType() {
  bool flag = true;
  flag = false;
  if (flag) {
    print("true");
  } else {
    print("false");
  }
}

/// 集合类型
collectionType() {
  // 不指定类型
  var list = ['张三', 20, true];
  print("${list[0]} -> ${list[1]} -> ${list[2]}");
  // 指定类型
  var list2 = <String>['张三', '20', 'true'];
  // 操作集合
  var list3 = [];
  list3.add('张三');
  // 创建固定长度的集合
  var list4 = List.filled(2, '');
}

// 方法内可以定义方法, 只是作用域被限制在所定义的方法内
void nestedMethod() {
  int getNum() {
    int nested() {
      return 1;
    }

    var num = nested();
    return num;
  }

  print(getNum());
}

// 可选参数方法, 使用[]括起来即可, 同时注意null-safe配置
void optionalParamMethod(String name, [String? sex, int? age]) {
  print("name = $name, sex = ${sex ?? "unknown"}, age = ${age ?? "unknown"}");
}

void optionalParamWithDefaultValueMethod(String name,
    [String sex = "unknown", int? age]) {
  print("name = $name, sex = $sex, age = ${age ?? "unknown"}");
}

void invokeOptionalParamMethod() {
  optionalParamMethod('Mark');
  optionalParamWithDefaultValueMethod('Mark');
}

// 定义一个命名参数方法
void namedMethod(String name, {String sex = "unknown", int? age}) {
  print("name = $name, sex = $sex, age = ${age ?? "unknown"}");
}

void invokeNamedMethod() {
  namedMethod('Mark', age: 18);
  namedMethod('Mark', sex: '男', age: 18);
  namedMethod('Mark', age: 18, sex: '男');
}

// 方法作为参数
void methodParamMethod(fnParam) {
  fnParam();
}

void fn() {
  print("我是一个方法");
}

void invokeMethodParamMethod() {
  methodParamMethod(fn);
  methodParamMethod(() {
    print("我是一个方法");
  });
}

void functions() {
  List list = [1, 2, 3, 4];
  // 箭头函数
  list.map((e) => print(e));
  list.map((e) {
    print(e);
  });

  bool isEvenNum(int i) {
    return i % 2 == 0;
  }

  printNum(int n) {
    for (var i = 1; i < n; i++) {
      if (isEvenNum(i)) {
        print(i);
      }
    }
  }

  printNum(10);

  // 匿名方法
  var printNumVar = () {
    print(123);
  };
  printNumVar();

  // 自执行方法
  (() {
    print("我是自执行方法");
  })();
}

// 全局变量的特点: 全局变量常驻内存, 会污染全局
// 局部变量的特点: 不会常驻内存, 会被垃圾机制回收, 不会污染全局
// 既想要常驻内存, 又不会污染全局, 这就是闭包产生的缘由
// 闭包: 函数嵌套函数, 内部函数会调用外部函数的变量或者参数,变量或者参数不会被系统回收
// 闭包的写法: 函数嵌套函数, 并return里面的函数, 这样就形成了闭包
int globalNum = 1;

void closureLab() {
  print(globalNum);
  void printGlobalNum() {
    globalNum++;
    print(globalNum);
  }

  void printMyNum() {
    int myNum = 10;
    print(myNum);
  }
  // print(myNum); // error

  closureNum() {
    int closureNum = 100;
    return () {
      closureNum++;
      print(closureNum);
    };
  }

  var closure = closureNum();
  closure();
  closure();
  closure();
}

// 面向对象: 封装 / 继承 / 多态
class ObjectClass {
  String tag = "tag";
  void printTag() {
    print(tag);
  }
}
