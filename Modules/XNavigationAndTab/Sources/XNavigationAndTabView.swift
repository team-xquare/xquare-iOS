import SwiftUI
import UIKit

import SemicolonDesign

// swiftlint:disable large_tuple
public struct XNavigationAndTabView: View {

    @State private var tabViewSelection: Int = 0
    private var bindedTabViewSelection: Binding<Int>?

    @State private var defaultTabBarHidden: Bool = false

    private var contents: [AnyView] = []
    private var tabInfosPerContents: [TabInformation] = []

    public init<C0>(
        selection: Binding<Int>? = nil,
        _ contents: () -> C0
    ) where C0: View & XNavigationAndTabContent {
        self.bindedTabViewSelection = selection
        self.contents.append(contents().toAnyView())
        self.tabInfosPerContents.append(contents().tabInformation)
    }

    public init<C0, C1>(
        selection: Binding<Int>? = nil,
        _ contents: () -> (C0, C1)
    ) where C0: View & XNavigationAndTabContent,
            C1: View & XNavigationAndTabContent {
        self.init(selection: selection) {( contents().0 )}
        self.contents.append(contents().1.toAnyView())
        self.tabInfosPerContents.append(contents().1.tabInformation)
    }

    public init<C0, C1, C2>(
        selection: Binding<Int>? = nil,
        _ contents: () -> (C0, C1, C2)
    ) where C0: View & XNavigationAndTabContent,
            C1: View & XNavigationAndTabContent,
            C2: View & XNavigationAndTabContent {
        self.init(selection: selection) {( contents().0, contents().1 )}
        self.contents.append(contents().2.toAnyView())
        self.tabInfosPerContents.append(contents().2.tabInformation)
    }

    public init<C0, C1, C2, C3>(
        selection: Binding<Int>? = nil,
        _ contents: () -> (C0, C1, C2, C3)
    ) where C0: View & XNavigationAndTabContent,
            C1: View & XNavigationAndTabContent,
            C2: View & XNavigationAndTabContent,
            C3: View & XNavigationAndTabContent {
        self.init(selection: selection) {( contents().0, contents().1, contents().2 )}
        self.contents.append(contents().3.toAnyView())
        self.tabInfosPerContents.append(contents().3.tabInformation)
    }

    public init<C0, C1, C2, C3, C4>(
        selection: Binding<Int>? = nil,
        _ contents: () -> (C0, C1, C2, C3, C4)
    ) where C0: View & XNavigationAndTabContent,
            C1: View & XNavigationAndTabContent,
            C2: View & XNavigationAndTabContent,
            C3: View & XNavigationAndTabContent,
            C4: View & XNavigationAndTabContent {
        self.init(selection: selection) {( contents().0, contents().1, contents().2, contents().3 )}
        self.contents.append(contents().4.toAnyView())
        self.tabInfosPerContents.append(contents().4.tabInformation)
    }

    public var body: some View {
        ZStack {
            ForEach(contents.indices, id: \.self) { index in
                NavigationView {
                    VStack(spacing: 0) {
                        contents[index]
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        tabview
                    }
                }
                .opacity(index == getTabViewSelection() ? 1 : 0)
                .accentColor(.GrayScale.gray800)
            }
        }
    }

    var tabview: some View {
        HStack(alignment: .top) {
            Spacer()
            ForEach(contents.indices, id: \.self) { index in
                Button(action: {
                    self.tabViewSelection = index
                    self.bindedTabViewSelection?.wrappedValue = index
                }, label: {
                    VStack(alignment: .center, spacing: 0) {
                        Spacer().frame(height: 6)
                        tabInfosPerContents[index].tabItemImage
                            .resizable()
                            .frame(width: 21, height: 21)
                        Spacer().frame(height: 6)
                        Text(tabInfosPerContents[index].tabItemText)
                            .font(.system(size: 10, weight: .medium))
                    }
                    .frame(width: 70)
                    .tint(index == getTabViewSelection() ? .GrayScale.gray800 : .GrayScale.gray300)
                })
                Spacer()
            }
        }
        .frame(height: 49)
        .frame(maxWidth: .infinity)
        .background(tabInfosPerContents[getTabViewSelection()].backgroundColor)
    }

    private func getTabViewSelection() -> Int {
        bindedTabViewSelection?.wrappedValue ?? tabViewSelection
    }

}
