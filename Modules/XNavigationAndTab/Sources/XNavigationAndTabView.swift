import SwiftUI

// swiftlint:disable large_tuple
public struct XNavigationAndTabView: View {

    @State private var navigationTitle: String = .init()
    @State private var toolBar: Toolbar = .init()
    @State private var tabViewSelection: Int = 0
    private var bindedTabViewSelection: Binding<Int>?

    private var contents: [AnyView] = []
    private var tabInfosPerContents: [TabInformation] = []
    private var toolbarPerContents: [Toolbar] = []

    private var navigationBarTitleDisplayMode: NavigationBarItem.TitleDisplayMode {
        navigationTitle != "" ? .automatic : .inline
    }

    public init<C0>(
        selection: Binding<Int>? = nil,
        _ contents: () -> C0
    ) where C0: View & XNavigationAndTabContent {
        self.bindedTabViewSelection = selection
        self.contents.append(contents().toAnyView())
        self.tabInfosPerContents.append(contents().tabInformation)
        self.toolbarPerContents.append(contents().toolBar)
    }

    public init<C0, C1>(
        selection: Binding<Int>? = nil,
        _ contents: () -> (C0, C1)
    ) where C0: View & XNavigationAndTabContent,
            C1: View & XNavigationAndTabContent {
        self.init(selection: selection) {( contents().0 )}
        self.contents.append(contents().1.toAnyView())
        self.tabInfosPerContents.append(contents().1.tabInformation)
        self.toolbarPerContents.append(contents().1.toolBar)
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
        self.toolbarPerContents.append(contents().2.toolBar)
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
        self.toolbarPerContents.append(contents().3.toolBar)
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
        self.toolbarPerContents.append(contents().4.toolBar)
    }

    public var body: some View {
        NavigationView {
            TabView(selection: bindedTabViewSelection ?? $tabViewSelection) {
                ForEach(contents.indices, id: \.self) { index in
                    contents[index]
                        .tag(index)
                        .tabItem {
                            Text(tabInfosPerContents[index].getTabItemText())
                            tabInfosPerContents[index].tabItemImage
                        }
                        .onAppear {
                            navigationTitle = tabInfosPerContents[index].getNavigationTitle()
                            toolBar = toolbarPerContents[index]
                        }
                }
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(navigationBarTitleDisplayMode)
            .toolbar {
                ToolbarItemGroup(placement: toolBar.placement) {
                    ForEach(toolBar.contents.indices, id: \.self) { index in
                        toolBar.contents[index]
                    }
                }
            }
            .environment(\.tabBarSelection, bindedTabViewSelection ?? $tabViewSelection)
        }
    }

}
