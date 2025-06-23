import SwiftUI

extension Text {
    func Alata(size: CGFloat,
            color: Color = .white)  -> some View {
        self.font(.custom("Alata-Regular", size: size))
            .foregroundColor(color)
    }
}
