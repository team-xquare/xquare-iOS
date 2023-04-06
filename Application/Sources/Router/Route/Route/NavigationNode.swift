import SwiftUI

indirect enum NavigationNode<Screen: ScreenProtocol, ScreenView: View>: View {
    case view(
        ScreenView, context: RouterContext<Screen>,
        pushing: NavigationNode<Screen, ScreenView>,
        stack: Binding<[RouterContext<Screen>]>,
        index: Int
    )
    case end

    private var isActiveBinding: Binding<Bool> {
      switch self {
      case .end, .view(_, _, pushing: .end, _, _):
        return .constant(false)
      case .view(_, _, .view, let allRoutes, let index):
        return Binding(
          get: {
            allRoutes.wrappedValue.count > index + 1
          },
          set: { isShowing in
            guard !isShowing else { return }
            guard allRoutes.wrappedValue.count > index + 1 else { return }
            allRoutes.wrappedValue = Array(allRoutes.wrappedValue.prefix(index + 1))
          }
        )
      }
    }

    private var pushedNode: NavigationNode? {
      switch self {
      case .end:
        return nil
      case .view(_, _, let pushedNode, _, _):
        return pushedNode
      }
    }

    private var routerContext: RouterContext<Screen>? {
        switch self {
        case .view(_, let context, _, _, _):
            return context
        case .end:
            return nil
        }
    }

    private var sheetBinding: Binding<Bool> {
      switch pushedNode {
      case .view(_, let context, _, _, _):
          return context.presentationType == .modal ? isActiveBinding : .constant(false)
      default:
        return .constant(false)
      }
    }

    private var fullCoverBinding: Binding<Bool> {
      switch pushedNode {
      case .view(_, let context, _, _, _):
          return context.presentationType == .fullScreen ? isActiveBinding : .constant(false)
      default:
        return .constant(false)
      }
    }

    private var pushBinding: Binding<Bool> {
      switch pushedNode {
      case .view(_, let context, _, _, _):
          return context.presentationType == .push ? isActiveBinding : .constant(false)
      default:
        return .constant(false)
      }
    }

    @ViewBuilder var viewBody: some View {
        let asSheet = pushedNode?.routerContext?.presentationType == .modal
        if case .view(let view, _, let pushedNode, _, _) = self {
            view
                .background(
                    NavigationLink(
                        destination: pushedNode,
                        isActive: pushBinding,
                        label: EmptyView.init
                    )
                    .hidden()
                )
                .present(
                    asSheet: asSheet,
                    isPresented: asSheet ? sheetBinding : fullCoverBinding,
                    content: { pushedNode }
                )
        } else {
            EmptyView()
        }
    }

    var body: some View {
        if routerContext?.screen.embedInNavigationView ?? false {
            NavigationView {
                viewBody
            }
            .navigationViewStyle(.stack)
        } else {
            viewBody
        }
    }
}
