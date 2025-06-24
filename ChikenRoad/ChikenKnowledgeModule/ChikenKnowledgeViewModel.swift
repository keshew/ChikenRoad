import SwiftUI

class ChikenKnowledgeViewModel: ObservableObject {
    let contact = ChikenKnowledgeModel()
    @Published var isQuiz = false
}
