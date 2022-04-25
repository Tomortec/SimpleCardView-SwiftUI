//
//  CardView.swift
//  SimpleCardView
//
//  Created by Tomortec on 2022/4/23.
//  Copyright © 2022 Tomortec. All rights reserved.
//

import SwiftUI

/* MARK: - Detail View Type */
/// Defines how the Detail view will display
public enum CardDetailsViewType {
    case fullScreen
    /// default value is `popover(anchor: PopoverAttachmentAnchor = .rect(.bounds), arrowEdge: Edge = .top)`
    ///
    /// - note: the popover will be shown as `.sheet` on iPhones
    case popover(anchor: PopoverAttachmentAnchor = .rect(.bounds), arrowEdge: Edge = .top)
    /// Default
    case sheet
}

/**
 CardView with TitleView, Cover view and Detail view
 
 Simple Example:
 ``` swift
 CardView(
     size: CGSize(width: 150.0, height: 200.0),
     title: "Hello World",
     cover: {
         // place any view here to provide a cover
         Image(systemName: "leaf.fill")
             .resizable()
             .foregroundColor(.white)
             .frame(width: 100.0, height: 100.0)
     }, detail: {
         // place any view here to provide a detail view
         // which will display when the card is tapped
         Image(systemName: "moon.stars.fill")
             .resizable()
             .scaledToFit()
             .padding()
             .foregroundColor(.yellow)
             .frame(maxWidth: .infinity, maxHeight: .infinity)
             .background(.cyan)
 })
 .backgroundColor(top: .cyan, bottom: .blue)
 ```
 */
public struct CardView<Cover: View, Detail: View>: View {
    
    let detailViewType: CardDetailsViewType
    
    /* MARK: - Constraints */
    let size: CGSize
    let titleViewProportion: CGFloat
    let spacing: CGFloat
    
    /* MARK: - Private Components */
    var titleView: CardTitleView
    var backgroundView: CardBackgroundView
    
    /* MARK: - Exposed Components */
    let cover: Cover
    let detail: Detail
    
    /* MARK: - Handlers */
    let action: (() -> ())?
    
    /* MARK: - State */
    @State var isShowingDetailsViewAsFullScreen = false
    @State var isShowingDetailsViewAsPopover = false
    @State var isShowingDetailsViewAsSheet = false
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    // |||||||||||||||||||||||||||||||||||||||||||||||||
    // this two pile of codes need to be optimized later
    // |||||||||||||||||||||||||||||||||||||||||||||||||
    // vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    var detailsViewBindingForFullScreen: Binding<Bool>?
    var detailsViewBindingForPopover: Binding<Bool>?
    var detailsViewBindingForSheet: Binding<Bool>?
    
    /* MARK: - Requirements */
    
    /**
     Construct a CardView with must-have paras: `size`, `title`, `cover` and `detail`
     
     - parameters:
        - size: defines the size of the card. Required
        - title: the text shown on the top of the card. Note that this parameter makes no sense when `.replaceTitleView(with:)` is called. Required
        - titleViewProportion: determines the proportion (of height) of the title view. For example, if this parameters is set to `1 / 4`, the title view's height will be 1/4 of that of the card's while the cover view will be 3/4. Default is `1 / 4`
        - spacing: the space between the title view and the cover view. Default is `0.0`
        - detailViewType: determines how the detail view will display. Possible values include `.fullScreen`, `.sheet` and `.popover()`. Default is `.sheet`
        - detailViewBinding: this parameter enables you to add a `Bool` binding for `DetailView` to control the visibility of the DetailsView from the outside(even in the `DetailView`, therefore, this is the solution to creating a `close button` in the `DetailView`). Note that once you set this parameter, the tapping action on the card view will NOT show the detail view, however, you can modify you binding in the `onTap` closure to find it back. Default is `nil`
        - cover: the cover view. Required
        - detail: the view displaying after the card is tapped. Required
        - onTap: the action to do when the card is tapped. Default is `nil`
     
     - important: once `detailViewBinding` parameter is set, the DetailView will NOT be shown when the card is tapped. However, you can modify your binding in the `onTap` closure. Our `complete example` demonstrate this.
     - note: `title` parameter makes no sense when `.replaceTitleView(with:)` is called
     - note: the `.popover()` type of `detailViewType` will display as `.sheet` on iPhone.
     */
    public init(
        size: CGSize,
        title: String,
        titleViewProportion: CGFloat = 1 / 4,
        spacing: CGFloat = 0.0,
        detailViewType: CardDetailsViewType = .sheet,
        detailViewBinding: Binding<Bool>? = nil,
        
        @ViewBuilder cover: () -> Cover,
        @ViewBuilder detail: () -> Detail,
        onTap action: (() -> ())? = nil
    ) {
        self.size = size
        self.titleViewProportion = titleViewProportion
        self.spacing = spacing
        self.detailViewType = detailViewType
        
        self.titleView = CardTitleView(title: title)
        self.backgroundView = CardBackgroundView(backgroundColor: .blue)
        
        self.cover  = cover()
        self.detail = detail()
        self.action = action
        
        switch detailViewType {
        case .fullScreen:
            self.detailsViewBindingForFullScreen = detailViewBinding
        case .popover(_, _):
            self.detailsViewBindingForPopover = detailViewBinding
        case .sheet:
            self.detailsViewBindingForSheet = detailViewBinding
        }
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: spacing) {
            titleView
                .frame(height: titleViewProportion * size.height)
            
            cover
                .frame(height: (1 - titleViewProportion) * size.height)
        }
        .frame(width: size.width, height: size.height)
        .background(
            backgroundView
        )
        .fullScreenCover(isPresented: detailsViewBindingForFullScreen ?? $isShowingDetailsViewAsFullScreen) {
            CardDetailsView(displayType: detailViewType, flag: detailsViewBindingForFullScreen ?? $isShowingDetailsViewAsFullScreen) {
                detail
            }
        }
        .popover(isPresented: detailsViewBindingForPopover ?? $isShowingDetailsViewAsPopover) {
            CardDetailsView(displayType: detailViewType, flag: detailsViewBindingForPopover ?? $isShowingDetailsViewAsPopover) {
                detail
            }
        }
        .sheet(isPresented: detailsViewBindingForSheet ?? $isShowingDetailsViewAsSheet) {
            CardDetailsView(displayType: detailViewType, flag: detailsViewBindingForSheet ?? $isShowingDetailsViewAsSheet) {
                detail
            }
        }
        .onTapGesture {
            switch detailViewType {
            case .fullScreen:
                isShowingDetailsViewAsFullScreen = true
            case .popover:
                isShowingDetailsViewAsPopover = true
            case .sheet:
                isShowingDetailsViewAsSheet = true
            }
            action?()
        }
    }
}

/* MARK: - Config for BackgroundView */
extension CardView {
    /// Set the background color of the card
    ///
    /// Originally, the card's background is set to `Color.blue`
    public func backgroundColor(_ color: Color) -> Self {
        var copied = self
        copied.backgroundView = backgroundView.backgroundColor(color)
        return copied
    }
    
    /// Set the background color of the card as linear gradient
    ///
    /// Originally, the card's background is set to `Color.blue`
    ///
    /// - note: the same syntax as `LinearGradient(colors:startPoint:endPoint:)`
    public func backgroundColor(colors: [Color], startPoint: UnitPoint = .top, endPoint: UnitPoint = .bottom) -> Self {
        var copied = self
        copied.backgroundView = backgroundView.backgroundColor(colors: colors, startPoint: startPoint, endPoint: endPoint)
        return copied
    }
    
    /// Set the corner radius of the card
    ///
    /// Originally, the card's corner radius is set to `12.0`
    public func cardCornerRadius(_ radius: CGFloat) -> Self {
        var copied = self
        copied.backgroundView = backgroundView.cardCornerRadius(radius)
        return copied
    }
    
    /// Set the shadow of the card
    ///
    /// Originally, the card's shadow is set to `color: .gray, radius: 12.0, xOffset: 0.0, yOffset: 0.0`
    public func cardShadow(
        color: Color? = nil,
        radius: CGFloat,
        xOffset: CGFloat? = nil,
        yOffset: CGFloat? = nil
    ) -> CardView {
        var copied = self
        copied.backgroundView = backgroundView.cardShadow(radius: radius, color: color, xOffset: xOffset, yOffset: yOffset)
        return copied
    }
}

/* MARK: - Cofig for TitleView */
extension CardView {
    /// Replace the default title view with a new `AnyView`
    ///
    /// Example:
    /// ``` swift
    /// // use `AnyView(_:)` to wrap the new view
    /// .replaceTitleView(with: AnyView(
    ///     HStack {
    ///         Image(systemName: "heart")
    ///         Text("AnyView")
    ///     }
    /// ))
    /// ```
    ///
    /// - attention: the `title` property of the card will be erased after this method is called
    ///
    public func replaceTitleView(with alternativeView: AnyView) -> Self {
        var copied = self
        copied.titleView = titleView.replaceTitleView(with: alternativeView)
        return copied
    }
    
    /// Set the title string of the title view
    ///
    /// - attention: calling this method will hide the view you create with `.replaceTitle(with:)`
    public func title(_ title: String) -> Self {
        var copied = self
        copied.titleView = titleView.title(title)
        return copied
    }
    
    /// Set the font of the title
    ///
    /// Originally, the font is set to `Font.title3().bold()`
    public func titleFont(_ font: Font) -> Self {
        var copied = self
        copied.titleView = titleView.titleFont(font)
        return copied
    }
    
    /// Set the text color of the title
    ///
    /// Originally, the color is set to `Color.white`
    public func titleColor(_ color: Color) -> Self {
        var copied = self
        copied.titleView = titleView.titleColor(color)
        return copied
    }
    
    /// Set the alignment of the title
    ///
    /// Originally, the alignment is set to `.center`
    public func titleAlignment(_ alignment: HorizontalAlignment) -> Self {
        var copied = self
        copied.titleView = titleView.titleAlignment(Alignment(horizontal: alignment, vertical: .center))
        return copied
    }
    
    /// Set the truncation mode of the title
    ///
    /// Originally, the truncation mode is set to `.tail`
    public func titleTruncationMode(_ mode: Text.TruncationMode) -> Self {
        var copied = self
        copied.titleView = titleView.titleTruncationMode(mode)
        return copied
    }
}
