import SwiftUI

struct AchievModel {
    var image: String
    var title: String
    var subtitle: String
    var status: Status
    var isCompleted: Bool
}

enum Status: String {
    case inProgress
    case completed
    case locked
}

struct ChikenProgressModel {
    let arrayOfAchiev = [AchievModel(image: "egg3", title: "First egg", subtitle: "Add the first chicken", status: Status.inProgress, isCompleted: false),
                         AchievModel(image: "1level2", title: "First cleaning", subtitle: "Read the cleaning instructions", status: Status.inProgress, isCompleted: false),
                         AchievModel(image: "1level3", title: "Test biting", subtitle: "Answer 3 questions", status: Status.inProgress, isCompleted: false),
                         AchievModel(image: "1level4", title:  "3 days on the bird wave", subtitle: "Go to the app", status: Status.inProgress, isCompleted: false),
                         AchievModel(image: "1level5", title: "Clean beak — healthy chicken", subtitle: "Pass the hygiene card", status: Status.inProgress, isCompleted: false)]
    
    let arrayOfAchiev2 = [AchievModel(image: "2level1", title: "Eating without mistakes", subtitle: "Learn feeding", status: Status.locked, isCompleted: false),
                         AchievModel(image: "2level2", title: "5 cards in a row", subtitle: "Read", status: Status.locked, isCompleted: false),
                         AchievModel(image: "2level3", title: "Daily routine", subtitle: "Set up a care schedule", status: Status.locked, isCompleted: false),
                         AchievModel(image: "2level4", title:  "Fluffy Pride", subtitle: "Upload a photo of the chicken coop", status: Status.locked, isCompleted: false),
                         AchievModel(image: "2level5", title: "4/4 — productive flock", subtitle: "Pass 4 quiz questions", status: Status.locked, isCompleted: false)]
    
    let arrayOfAchiev3 = [AchievModel(image: "2level1", title: "Herbs and supplements", subtitle: "Pass the card", status: Status.locked, isCompleted: false),
                         AchievModel(image: "2level5", title: "8 correct answers", subtitle: "Pass the quiz", status: Status.locked, isCompleted: false),
                         AchievModel(image: "2level3", title: "10 completed cards", subtitle: "Successfully", status: Status.locked, isCompleted: false),
                         AchievModel(image: "2level4", title:  "Week with chickens", subtitle: "Enter 7 days", status: Status.locked, isCompleted: false),
                         AchievModel(image: "2level5", title: "Repeated care", subtitle: "Mark 3 actions again", status: Status.locked, isCompleted: false)]
    
    let arrayOfAchiev4 = [AchievModel(image: "4level1", title: "No mistakes", subtitle: "Pass the quiz for 100%", status: Status.locked, isCompleted: false)]
}
