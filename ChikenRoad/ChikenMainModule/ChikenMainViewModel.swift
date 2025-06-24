import SwiftUI

class ChikenMainViewModel: ObservableObject {
    let contact = ChikenMainModel()
    @Published var currentIndex: Int = 0
    @Published var isProgress = false
    @Published var isGallery = false
    @Published var isQuiz = false
    @Published var isProfile = false
    private let indexKey = "DailyTipIndex"
    private let dateKey = "DailyTipDate"
    
    func updateTipIfNeeded() {
        let defaults = UserDefaults.standard
        
        let now = Date()
        let calendar = Calendar.current
        
        if let savedDate = defaults.object(forKey: dateKey) as? Date,
           let savedIndex = defaults.object(forKey: indexKey) as? Int {
            
            if let nextUpdate = calendar.date(byAdding: .hour, value: 24, to: savedDate),
               now < nextUpdate {
                currentIndex = savedIndex
                return
            }
        }
        
        currentIndex = Int.random(in: 0..<contact.chickenCareTips.count)
        
        defaults.set(currentIndex, forKey: indexKey)
        defaults.set(now, forKey: dateKey)
    }
}
