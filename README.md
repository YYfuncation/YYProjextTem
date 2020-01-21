# ZFJProjectTem

#### 介绍
ZFJProjectTem，iOS应用类型项目基础MVC框架，当然也可以根据自己的需求自行扩展，比如添加ViewModel！
需要表明的是本人喜欢纯代码开发、不喜欢Xib和Storyboard，他们的缺点有很多我也就不说了！🤡还有就是是组件化开发我也不是很喜欢，最主要的就是太麻烦了！🤓
PS：关于MVC和MVVM的优缺点，可以更加项目实际情况修改，至于二者的优缺点，如果不了解的小伙伴自行百度吧，这里就不过多赘述了！

[![Fork me on Gitee](https://gitee.com/zfj1128/ZFJProjectTem/widgets/widget_3.svg)](https://gitee.com/zfj1128/ZFJProjectTem)

#### 软件架构
ZFJProjectTem是一个常用的应用类型项目的框架，框架已经通过Pods集成了AFNetworking（网络框架）、MJRefresh（刷新）、SDWebImage（图片缓存）、MBProgressHUD（加载视图）、YYModel（JSON模型框架）、TTTAttributedLabel（富文本）、WHC_AutoLayoutKit（约束）、MGJRouter（路由转发）、IQKeyboardManager（键盘管理）、ReactiveObjC（RAC）；这这里集成的库如果有没有用过的小伙伴可以自行百度吧！需要说明的是，现在前端有很多用H5混编的，这里可以推荐WebViewJavascriptBridge，这也是我经常用的，大家可以自行集成！

工程结构目录有Controllers（控制器）、Views（视图）、Models（数据模型）、Vendor（第三方库）、Resources（资源文件）、Util（工具类），小伙伴也可以根据自己的习惯自行修改！

工程目录视图如下：

![mahua](https://img-blog.csdnimg.cn/2019062016320355.png)<br>

从上面的配置可以看出，项目的网络框架是AFNetworking，小伙伴可以在自己的基础上封装请求头、API管理类和网络传输加密方法类（如果有这个需求）；在请求头里面我们可以配置一些通用的东西，比如版本号、设备号、时间戳、Token、设备系统版本等等。

关于数据持久化，需要说名的是，ZFJProjectTem并没有设置缓存框架或者缓存方式，我比较喜欢的是SQLite，我也写过一个基于FMDB的工具类，可以移步 https://zfj1128.blog.csdn.net/article/details/78189927 👉《iOS-基于FMDB的操作封装，模型对象的增删改查》👈
查看！

至于UIKit层面上，开发中无非就是控制器UIViewController和视图UIView了，当然还有UINavigationController和UITabBarController，UITabBarController没啥好说的，基本上是应用类APP的通用模式，UIViewController想提到的就是基类了BaseViewController；UIView所说的东西就太多了，比如相同模块封装、相同功能封装、视图重用等等，好的封装可以使你的项目看起来更简单易读而且更容易进行以后的版本迭代和更新，比如我在开发游戏直播间的时候，整个游戏直播间控制器才1200行，当然还可以更精简，还可以把“匹配房间”给提出来。。。
关于UINavigationController可以说的很多，笔者在项目中用的比较多就是设置通用样式和设置自定义转场动画了！

最后要说的就是ReactiveObjC，也就是大家口中的RAC（注意区分ARC😂）；ReactiveObjC是ReactiveCocoa系列的一个OC方面用得很多的响应式编程三方框架，通过这个框架你可以做很多事，真的非常牛逼，用过了你就会深深的爱上它了，具体如何使用建议自行学习！

#### 使用说明

1. BaseViewController：控制器基类，写一些通用的方法或者设置，比如设置统一的背景色；
2. GlobalModuleRouter：新建控制器一定要到这个类里面注册路由；MGJRouter+openURL为路由跳转的类别，方便使用，暴露主要参数；
3. ZFJPersoninfo：工程单利；
4. AppDelegateTool：AppDelegate工具类，这个类主要是为了简化AppDelegate里面的内容的；
5. ZFJTransition：侧滑手势管理设置；
6. OcssNavViewController：自定义的UINavigationController类，通过这个类可以设置自定义转场动画，动画是在OcssNavAnimation里面实现的；
7. OcssTools工具类；
8. ......

#### 相关说明

1. 项目： https://gitee.com/zfj1128/ZFJProjectTem.git
2. 博客 ：https://zfj1128.blog.csdn.net
3. 重点：开发的过程中一定要注释详细，不写注释的程序员都不是好程序员！

#### 结束语

作者开发过六七个正式项目，水平能力有限，不足的地方欢迎大家留言指出，也欢迎大家提供好的解决方案，更欢迎大家进群交流学习！
群：365152048
