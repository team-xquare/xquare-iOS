import SwiftUI

import SemicolonDesign

struct SlidingTextView: View {
    @State private var animatedSliding: Bool = false
    let geometryProxy: GeometryProxy
    let timer = Timer.publish(every: 3, on: .current, in: .common).autoconnect()

    var body: some View {
        ZStack {
            VStack {
                Text("캡처 방지용 애니메이션 캡처 방지용 애니메이션 캡처 방지용 애니메이션 캡처 방지용 애니메이션 캡처 방지용 애니메이션")
                    .sdText(type: .body4, textColor: .GrayScale.gray400)
                    .fixedSize()
                    .frame(width: geometryProxy.size.width, alignment: animatedSliding ? .trailing : .leading)
                    .clipped()
                    .animation(.linear(duration: 3), value: animatedSliding)
                    .onReceive(timer) { _ in
                        self.animatedSliding.toggle()
                    }
                    .frame(height: 30)
            }
        }
        .frame(
            width: self.geometryProxy.size.width,
            height: self.geometryProxy.size.height
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1), execute: {
                self.animatedSliding.toggle()
            })
        }
    }
}
