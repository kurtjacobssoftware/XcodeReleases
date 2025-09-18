import SwiftUI

struct ChipView: View {
    
    var title: String
    var chipColor: Color = .black
    var textColor: Color = .white
    
    var body: some View {
        Text(title)
            .foregroundStyle(textColor)
            .fontWeight(.bold)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(chipColor)
                    
            )
    }
}

#Preview {
    ChipView(title: "Text")
}
