import SwiftUI

class ChikenGalleryViewModel: ObservableObject {
    @Published var arrayOfGallery: [Gallery] = [] {
        didSet {
            saveToUserDefaults()
        }
    }

    private let userDefaultsKey = "GalleryState"

    init() {
        loadFromUserDefaults()
    }

    func toggleDone(for index: Int) {
        guard arrayOfGallery.indices.contains(index) else { return }
        arrayOfGallery[index].isDone.toggle()
    }

    private func saveToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(arrayOfGallery) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }

    private func loadFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decoded = try? JSONDecoder().decode([Gallery].self, from: data) {
            arrayOfGallery = decoded
        } else {
            arrayOfGallery = [
                Gallery(title: "How to clean a chicken coop", text: "📘 Clean 1-2 times a week. Remove the litter, wash the feeders, and ventilate the room.", isDone: false),
                Gallery(title: "Prevention of lice and mites", text: "Sand baths with wood ash and dry cleaning are the best protection against parasites.", isDone: false),
                Gallery(title: "How to feed chickens properly", text: "Basic food + greens, grains, calcium (chalk, shell). Avoid mold and sweets.", isDone: false),
                Gallery(title: "How to care for egg production", text: "📘 Add light in winter, shade in summer. Water and peace are the key to stable masonry.", isDone: false),
                Gallery(title: "When to call a veterinarian", text: "Lethargy, lack of appetite, diarrhea, rare cackling-alarm signals.", isDone: false),
                Gallery(title: "How to collect eggs", text: "📘 2 times a day, morning and evening. Use a soft container and store at +10 ... +15°C.", isDone: false),
                Gallery(title: "Disinfection of the chicken coop", text: "📘 Once a month-treatment with safe means. Remove everything organic before doing so.", isDone: false),
                Gallery(title: "What to do with molting", text: "📘 Add protein and vitamins. The chickens are recovering, don't panic.", isDone: false),
                Gallery(title: "Safety from predators", text: "📘 Check the fence, netting, locks. Let them out in the morning and lock them up at night.", isDone: false)
            ]
        }
    }
}
