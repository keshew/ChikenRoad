import SwiftUI

class ChikenQuizViewModel: ObservableObject {
    @Published var questions: [QuizQuestion] = []
    @Published var currentQuestionIndex: Int = 0
    @Published var selectedOptionIndex: Int? = nil
    @Published var answerState: QuizAnswerState = .notAnswered
    @Published var showExplanation: Bool = false
    @Published var showResult: Bool = false
    @Published var correctAnswers: Int = 0
    
    var totalQuestions: Int { questions.count }
    var currentQuestion: QuizQuestion { questions[currentQuestionIndex] }
    var progress: Double { Double(currentQuestionIndex) / Double(totalQuestions) }
    var scorePercent: Int { Int((Double(correctAnswers) / Double(totalQuestions)) * 100) }
    var isGoodResult: Bool { scorePercent >= 60 }
    
    init() {
        startNewQuiz()
    }
    
    func startNewQuiz() {
        // Просто случайные 9 вопросов, варианты всегда идут A, B, C, правильный индекс указывает на правильную букву
        questions = Array(ChikenQuizModel.allQuestions.shuffled().prefix(9))
        currentQuestionIndex = 0
        selectedOptionIndex = nil
        answerState = .notAnswered
        showExplanation = false
        showResult = false
        correctAnswers = 0
    }
    
    func selectOption(_ index: Int) {
        guard answerState == .notAnswered else { return }
        selectedOptionIndex = index
        if index == currentQuestion.correctIndex {
            answerState = .correct
            correctAnswers += 1
        } else {
            answerState = .incorrect
        }
        showExplanation = true
    }
    
    func nextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            selectedOptionIndex = nil
            answerState = .notAnswered
            showExplanation = false
        } else {
            showResult = true
        }
    }
    
    func previousQuestion() {
        if currentQuestionIndex > 0 {
            currentQuestionIndex -= 1
            selectedOptionIndex = nil
            answerState = .notAnswered
            showExplanation = false
        }
    }
    
    func restartQuiz() {
        startNewQuiz()
    }
}
