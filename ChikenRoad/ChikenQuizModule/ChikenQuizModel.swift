import SwiftUI

struct QuizQuestion: Identifiable {
    let id = UUID()
    let text: String
    let options: [QuizOption]
    let correctIndex: Int
    let explanation: String
}

struct QuizOption: Identifiable {
    let id = UUID()
    let text: String
    let letter: String
}

enum QuizAnswerState {
    case notAnswered
    case correct
    case incorrect
}

struct ChikenQuizModel {
    static let allQuestions: [QuizQuestion] = [
        QuizQuestion(
            text: "How often should you provide fresh water to chickens?",
            options: [
                QuizOption(text: "Only in summer", letter: "A"),
                QuizOption(text: "Every day", letter: "B"),
                QuizOption(text: "Once a week", letter: "C")
            ],
            correctIndex: 1,
            explanation: "Chickens need access to clean, fresh water every day."
        ),
        QuizQuestion(
            text: "What is the best bedding for a chicken coop?",
            options: [
                QuizOption(text: "Sand or straw", letter: "A"),
                QuizOption(text: "Plastic sheets", letter: "B"),
                QuizOption(text: "Carpet", letter: "C")
            ],
            correctIndex: 1,
            explanation: "Sand or straw absorbs moisture and is easy to clean."
        ),
        QuizQuestion(
            text: "How often should you clean the chicken coop?",
            options: [
                QuizOption(text: "Every week", letter: "A"),
                QuizOption(text: "Once a month", letter: "B"),
                QuizOption(text: "Only in winter", letter: "C")
            ],
            correctIndex: 0,
            explanation: "Regular cleaning prevents disease and keeps chickens healthy."
        ),
        QuizQuestion(
            text: "What should you feed chickens for strong eggshells?",
            options: [
                QuizOption(text: "Sugar", letter: "A"),
                QuizOption(text: "Only corn", letter: "B"),
                QuizOption(text: "Calcium-rich food", letter: "C")
            ],
            correctIndex: 2,
            explanation: "Calcium is essential for strong eggshells."
        ),
        QuizQuestion(
            text: "Why is it important to collect eggs daily?",
            options: [
                QuizOption(text: "To prevent breakage and dirt", letter: "A"),
                QuizOption(text: "No reason", letter: "B"),
                QuizOption(text: "To make chickens happy", letter: "C")
            ],
            correctIndex: 0,
            explanation: "Collecting eggs daily keeps them clean and reduces breakage."
        ),
        QuizQuestion(
            text: "What is a sign of a healthy chicken?",
            options: [
                QuizOption(text: "Bright eyes and active", letter: "A"),
                QuizOption(text: "Sleeping all day", letter: "B"),
                QuizOption(text: "Missing feathers", letter: "C")
            ],
            correctIndex: 0,
            explanation: "Healthy chickens are alert, active, and have bright eyes."
        ),
        QuizQuestion(
            text: "How can you prevent mites in chickens?",
            options: [
                QuizOption(text: "Feeding only bread", letter: "A"),
                QuizOption(text: "Never cleaning", letter: "B"),
                QuizOption(text: "Regular dust baths", letter: "C")
            ],
            correctIndex: 2,
            explanation: "Dust baths help chickens keep mites away."
        ),
        QuizQuestion(
            text: "What should you do if a chicken looks sick?",
            options: [
                QuizOption(text: "Ignore it", letter: "A"),
                QuizOption(text: "Isolate and observe", letter: "B"),
                QuizOption(text: "Let it roam", letter: "C")
            ],
            correctIndex: 1,
            explanation: "Isolate sick chickens to prevent spreading illness."
        ),
        QuizQuestion(
            text: "How much space does one chicken need in a coop?",
            options: [
                QuizOption(text: "At least 0.2 sq. meters", letter: "A"),
                QuizOption(text: "No space needed", letter: "B"),
                QuizOption(text: "As much as a cat", letter: "C")
            ],
            correctIndex: 0,
            explanation: "Each chicken needs enough space to move and stay healthy."
        ),
        QuizQuestion(
            text: "What is the best way to introduce new chickens to a flock?",
            options: [
                QuizOption(text: "Gradually, in a separate pen", letter: "A"),
                QuizOption(text: "Throw them in", letter: "B"),
                QuizOption(text: "All at once", letter: "C")
            ],
            correctIndex: 0,
            explanation: "Gradual introduction reduces stress and fighting."
        ),
        QuizQuestion(
            text: "Why do chickens need grit?",
            options: [
                QuizOption(text: "For fun", letter: "A"),
                QuizOption(text: "To help digest food", letter: "B"),
                QuizOption(text: "To lay eggs", letter: "C")
            ],
            correctIndex: 1,
            explanation: "Grit helps chickens grind and digest their food."
        ),
        QuizQuestion(
            text: "What time of day is best to feed chickens?",
            options: [
                QuizOption(text: "Noon", letter: "A"),
                QuizOption(text: "Morning", letter: "B"),
                QuizOption(text: "Night", letter: "C")
            ],
            correctIndex: 1,
            explanation: "Feeding in the morning gives chickens energy for the day."
        ),
        QuizQuestion(
            text: "How can you keep water from freezing in winter?",
            options: [
                QuizOption(text: "Use a heated waterer", letter: "A"),
                QuizOption(text: "Add salt", letter: "B"),
                QuizOption(text: "Do nothing", letter: "C")
            ],
            correctIndex: 0,
            explanation: "A heated waterer keeps water liquid and accessible."
        ),
        QuizQuestion(
            text: "What is a safe treat for chickens?",
            options: [
                QuizOption(text: "Chocolate", letter: "A"),
                QuizOption(text: "Vegetable scraps", letter: "B"),
                QuizOption(text: "Chips", letter: "C")
            ],
            correctIndex: 1,
            explanation: "Vegetable scraps are healthy treats for chickens."
        ),
        QuizQuestion(
            text: "How do you keep predators away from chickens?",
            options: [
                QuizOption(text: "Feed outside", letter: "A"),
                QuizOption(text: "Secure fencing", letter: "B"),
                QuizOption(text: "Leave coop open", letter: "C")
            ],
            correctIndex: 1,
            explanation: "Secure fencing protects chickens from predators."
        ),
        QuizQuestion(
            text: "Why do chickens need perches?",
            options: [
                QuizOption(text: "To sleep off the ground", letter: "A"),
                QuizOption(text: "To play", letter: "B"),
                QuizOption(text: "To eat", letter: "C")
            ],
            correctIndex: 0,
            explanation: "Perches keep chickens safe and comfortable at night."
        ),
        QuizQuestion(
            text: "What is a sign of dehydration in chickens?",
            options: [
                QuizOption(text: "Pale comb", letter: "A"),
                QuizOption(text: "Loud clucking", letter: "B"),
                QuizOption(text: "More eggs", letter: "C")
            ],
            correctIndex: 0,
            explanation: "A pale comb can indicate dehydration."
        ),
        QuizQuestion(
            text: "How often should you check for eggs in the coop?",
            options: [
                QuizOption(text: "Every day", letter: "A"),
                QuizOption(text: "Once a week", letter: "B"),
                QuizOption(text: "Never", letter: "C")
            ],
            correctIndex: 0,
            explanation: "Checking daily keeps eggs clean and safe."
        ),
        QuizQuestion(
            text: "What is the best way to keep a coop dry?",
            options: [
                QuizOption(text: "Good ventilation", letter: "A"),
                QuizOption(text: "Close all windows", letter: "B"),
                QuizOption(text: "Add water", letter: "C")
            ],
            correctIndex: 0,
            explanation: "Ventilation prevents moisture and mold."
        ),
        QuizQuestion(
            text: "Why should you trim a chicken's nails?",
            options: [
                QuizOption(text: "To prevent injury", letter: "A"),
                QuizOption(text: "For fun", letter: "B"),
                QuizOption(text: "To make them run", letter: "C")
            ],
            correctIndex: 0,
            explanation: "Long nails can cause injury to chickens and others."
        ),
        QuizQuestion(
            text: "What is a broody hen?",
            options: [
                QuizOption(text: "A hen that wants to hatch eggs", letter: "A"),
                QuizOption(text: "A noisy hen", letter: "B"),
                QuizOption(text: "A sick hen", letter: "C")
            ],
            correctIndex: 0,
            explanation: "Broody hens want to sit on eggs to hatch them."
        ),
        QuizQuestion(
            text: "How do you help chickens stay cool in summer?",
            options: [
                QuizOption(text: "Provide shade and water", letter: "A"),
                QuizOption(text: "No food", letter: "B"),
                QuizOption(text: "Keep them inside", letter: "C")
            ],
            correctIndex: 0,
            explanation: "Shade and water help chickens avoid heat stress."
        ),
        QuizQuestion(
            text: "What is the main reason to quarantine new chickens?",
            options: [
                QuizOption(text: "Prevent disease spread", letter: "A"),
                QuizOption(text: "To make friends", letter: "B"),
                QuizOption(text: "For fun", letter: "C")
            ],
            correctIndex: 0,
            explanation: "Quarantine prevents new diseases from entering the flock."
        ),
        QuizQuestion(
            text: "What is the best way to dispose of old bedding?",
            options: [
                QuizOption(text: "Compost it", letter: "A"),
                QuizOption(text: "Burn it", letter: "B"),
                QuizOption(text: "Throw in water", letter: "C")
            ],
            correctIndex: 0,
            explanation: "Composting bedding is eco-friendly and safe."
        ),
        QuizQuestion(
            text: "How often should you check chickens for signs of illness?",
            options: [
                QuizOption(text: "Once a month", letter: "A"),
                QuizOption(text: "Every day", letter: "B"),
                QuizOption(text: "Only in winter", letter: "C")
            ],
            correctIndex: 1,
            explanation: "Daily checks help catch illness early."
        ),
        QuizQuestion(
            text: "What is the best way to keep a chicken coop warm in winter?",
            options: [
                QuizOption(text: "Use a space heater", letter: "A"),
                QuizOption(text: "Close all vents", letter: "B"),
                QuizOption(text: "Add extra bedding", letter: "C")
            ],
            correctIndex: 2,
            explanation: "Extra bedding insulates without fire risk."
        ),
        QuizQuestion(
            text: "What should you do with a broody hen?",
            options: [
                QuizOption(text: "Remove her from the nest", letter: "A"),
                QuizOption(text: "Feed her less", letter: "B"),
                QuizOption(text: "Let her sit on eggs", letter: "C")
            ],
            correctIndex: 2,
            explanation: "Broody hens want to hatch eggs."
        ),
        QuizQuestion(
            text: "What is a safe way to introduce treats to chickens?",
            options: [
                QuizOption(text: "As much as they want", letter: "A"),
                QuizOption(text: "Small amounts, rarely", letter: "B"),
                QuizOption(text: "Only at night", letter: "C")
            ],
            correctIndex: 1,
            explanation: "Treats should be limited and healthy."
        ),
        QuizQuestion(
            text: "How do you prevent egg eating in chickens?",
            options: [
                QuizOption(text: "Feed more corn", letter: "A"),
                QuizOption(text: "Add more roosters", letter: "B"),
                QuizOption(text: "Collect eggs often", letter: "C")
            ],
            correctIndex: 2,
            explanation: "Frequent collection prevents egg eating."
        ),
        QuizQuestion(
            text: "What is the best way to keep water clean for chickens?",
            options: [
                QuizOption(text: "Add sugar", letter: "A"),
                QuizOption(text: "Use a bowl", letter: "B"),
                QuizOption(text: "Change daily", letter: "C")
            ],
            correctIndex: 2,
            explanation: "Fresh water daily prevents disease."
        ),
        QuizQuestion(
            text: "How do you help chickens during a molt?",
            options: [
                QuizOption(text: "Give less food", letter: "A"),
                QuizOption(text: "Feed extra protein", letter: "B"),
                QuizOption(text: "Add more light", letter: "C")
            ],
            correctIndex: 1,
            explanation: "Extra protein helps feather regrowth."
        ),
        QuizQuestion(
            text: "What is the best way to prevent boredom in chickens?",
            options: [
                QuizOption(text: "Feed only grain", letter: "A"),
                QuizOption(text: "Provide enrichment", letter: "B"),
                QuizOption(text: "Keep them inside", letter: "C")
            ],
            correctIndex: 1,
            explanation: "Enrichment keeps chickens active and happy."
        ),
        QuizQuestion(
            text: "How do you keep a chicken run dry?",
            options: [
                QuizOption(text: "Water it daily", letter: "A"),
                QuizOption(text: "Add gravel or sand", letter: "B"),
                QuizOption(text: "Cover with plastic", letter: "C")
            ],
            correctIndex: 1,
            explanation: "Gravel or sand improves drainage."
        )
    ]
}


