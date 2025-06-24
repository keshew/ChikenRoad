import SwiftUI

struct ChikenQuizView: View {
    @StateObject var chikenQuizModel =  ChikenQuizViewModel()

    var body: some View {
        Text("Hey, Genius")
    }
}

#Preview {
    ChikenQuizView()
}
