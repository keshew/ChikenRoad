import SwiftUI

class ChikenSettingsViewModel: ObservableObject {
    let contact = ChikenSettingsModel()

    @Published var isNotif: Bool {
        didSet {
            UserDefaults.standard.set(isNotif, forKey: "isNotif")
        }
    }
    
    init() {
        self.isNotif = UserDefaults.standard.bool(forKey: "isNotif")
    }
}
