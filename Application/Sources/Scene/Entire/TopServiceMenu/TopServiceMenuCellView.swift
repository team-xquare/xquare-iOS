import SwiftUI

struct TopServiceMenuCellView: View {

    var image: Image
    var text: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(alignment: .center, spacing: 6) {
                image
                    .resizable()
                    .frame(width: 24, height: 24)
                Text(text)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.entireTabTopMenuTextColor)
            }
            .frame(height: 74)
            .frame(maxWidth: .infinity)
            .background(Color.entireTabTopMenuBackgroundColor)
            .cornerRadius(8)
        }
    }

}
