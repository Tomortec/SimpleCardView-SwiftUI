# SimpleCardView-SwiftUI

[![Version](https://img.shields.io/cocoapods/v/SimpleCardView-SwiftUI.svg?style=flat)](https://cocoapods.org/pods/SimpleCardView-SwiftUI)
[![License](https://img.shields.io/cocoapods/l/SimpleCardView-SwiftUI.svg?style=flat)](https://cocoapods.org/pods/SimpleCardView-SwiftUI)
[![Platform](https://img.shields.io/cocoapods/p/SimpleCardView-SwiftUI.svg?style=flat)](https://cocoapods.org/pods/SimpleCardView-SwiftUI)

`SimpleCardView-SwiftUI` 是用 SwiftUI 写的小卡片视图

![ScreenShot](./screenshot.png)
![Demo](./demo.gif)

## CardView 的结构
![Structure](./pic-structure.png)

## 小示例

``` Swift
CardView(
    size: CGSize(width: 150.0, height: 200.0),
    title: "Hello World",
    cover: {
        Image(systemName: "leaf.fill")
            .resizable()
            .foregroundColor(.white)
            .frame(width: 100.0, height: 100.0)
    }, detail: {
        VStack(spacing: 20.0) {
            Text("Sheet")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Image(systemName: "moon.stars.fill")
                .resizable()
                .scaledToFit()
                .padding()
                .foregroundColor(.yellow)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
})
.backgroundColor(colors: [.cyan, .blue])
```

克隆本仓库，在 `Example` 文件夹执行 `pod install` 后在 `Xcode` 运行示例项目来查看 demo

## 接口

### 初始化
```swift 
init(
    size: CGSize, 
    title: String, 
    titleViewProportion: CGFloat = 1 / 4, // TitleView 的高占 卡片的高 的比例
    spacing: CGFloat = 0.0, 
    detailViewType: CardDetailsViewType = .sheet, // DetailView 展示的样式
    cover: () -> Cover, 
    detail: () -> Detail, 
    onTap action: (() -> ())? = nil
)
```

### `BackgroundView` 的方法
``` swift
// 设置背景颜色
func backgroundColor(_ color: Color) 

// 设置背景的线性渐变颜色
func backgroundColor(colors: [Color], startPoint: UnitPoint = .top, endPoint: UnitPoint = .bottom) 

// 设置卡片圆角
func cardCornerRadius(_ radius: CGFloat)

// 设置卡片阴影
func cardShadow(color: Color? = nil, radius: CGFloat, xOffset: CGFloat? = nil, yOffset: CGFloat? = nil)
```

### `TitleView` 的方法
```swift
// 用 `AnyView` 替换 TitleView
func replaceTitleView(with alternativeView: AnyView)

// 设置标题
func title(_ title: String)

// 设置标题字体
func titleFont(_ font: Font)

// 设置标题文本颜色
func titleColor(_ color: Color)

// 设置标题对齐方式
func titleAlignment(_ alignment: HorizontalAlignment)

// 设置标题截取方式
func titleTruncationMode(_ mode: Text.TruncationMode)
```

执行 Xcode 的 `Product > Build Documentation` 并前往文档中心来查看 `SimpleCardView-SwiftUI` 的更多接口细节

## Swift 版本

Swift >= 5.0

## 安装方法

`SimpleCardView-SwiftUI` 已在 [CocoaPods](https://cocoapods.org)发布。添加下列命令到你的 `Podfile` 来安装 `SimpleCardView-SwiftUI`:

```ruby
pod 'SimpleCardView-SwiftUI'

# 注意：如果您下载的是 0.0.2 版本, 请使用下面的命令重试
# pod 'SimpleCardView-SwiftUI', :git => 'https://github.com/Tomortec/SimpleCardView-SwiftUI.git'
```

## 作者

Tomortec, everything@tomortec.com

## License

SimpleCardView-SwiftUI is available under the MIT license. See the LICENSE file for more info.
