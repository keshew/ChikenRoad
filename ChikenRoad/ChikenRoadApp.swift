import SwiftUI

@main
struct ChikenRoadApp: App {
    var body: some Scene {
        WindowGroup {
            if UserDefaultsManager().isFirstLaunch() {
                ChikenOnboardingView()
            } else {
                ChikenMainView()
                    .onAppear() {
                        UserDefaultsManager().recordGameLaunchDate()
                    }
            }
        }
    }
}
