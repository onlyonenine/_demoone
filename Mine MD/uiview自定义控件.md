#UIView自定义控件


##layoutSubviews
1. 这个方法是用来布局子控件,设置自控件的frame
2. 当控件本身的尺寸发生改变的时候,系统会自动调用这个方法

##layoutSubviews以下情况会被调用
- 直接调用
- addSubview的时候
- 当view的frame发生改变的时候
- 滑动UIScrollView的时候
- 旋转Screen会触发父UIview上的layoutSubviews事件
- 改变UIview大小的时候也会触发父UIview上的layoutSubviews事件
- ##Xib的简单使用 
 - /Users/bwf/Pictures/Snip20160319_2.png