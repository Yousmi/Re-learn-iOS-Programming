App Thinning in Xcode

如何进行高效的APP切割 减少内存占用率

Advantages:
Support devices with constrained storage

这里需要重点强调一下 为了能利用应用简化功能 你的资源必须处于资源目录内才行 我们无法处理松散资源 这不能限制这项强大功能 以后我们会进行改善 需要重点说明

资源目录里又有哪些内容呢:
Image
- 特别是位图资源和载体类型 你的图片可以是 png jpg或者pdf的格式 这些会先压缩以节省空间 编译成最佳的传送格式 然后通过 UI工具包的API传送到你应用
  
在资源目录中随意放入文件 并根据硬件水平进行分类 正如我之前提到的
然后 在运行时 可以使用OS X系统UI工具包 新的NSDataAsset 类别在app内进行内容检索

新的数据类型 就是Sprite地图集 这意味资源目录 和SpriteKit已经实现整合
