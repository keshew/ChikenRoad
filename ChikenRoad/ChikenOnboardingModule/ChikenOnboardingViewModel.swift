import SwiftUI

class ChikenOnboardingViewModel: ObservableObject {
    let contact = ChikenOnboardingModel()
    @Published var currentIndex = 0
    @Published var isNext = false
}
