import SwiftUI

struct ChikenQuizView: View {
    @StateObject var viewModel = ChikenQuizViewModel()
    
    var body: some View {
        ZStack {
            Color(red: 22/255, green: 24/255, blue: 38/255)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                QuizHeaderView()
                    .padding(.horizontal)
                    .padding(.top, 24)
                if viewModel.showResult {
                    ScrollView {
                        VStack(spacing: 24) {
                            QuizResultCardView(viewModel: viewModel)
                                .padding(.horizontal, 16)
                                .padding(.top)
                        }
                        .padding(.top, 8)
                        .frame(maxWidth: .infinity)
                        Spacer()
                    }
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Rectangle()
                            .fill(Color(red: 35/255, green: 37/255, blue: 54/255))
                            .frame(height: 1)
                        
                        QuizResultButtons(viewModel: viewModel)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 24)
                    }
                } else {
                    QuizHeaderProgress(current: viewModel.currentQuestionIndex + 1, total: viewModel.totalQuestions)
                        .padding(.horizontal)
                        .padding(.top, 25)
                    QuizQuestionView(viewModel: viewModel)
                        .padding(.horizontal)
                        .padding(.top, 30)
                    if viewModel.showExplanation {
                        ExplanationView(text: viewModel.currentQuestion.explanation)
                            .padding(.horizontal)
                            .padding(.top, 12)
                    }
                    Spacer()
                    
                    VStack(spacing: 15) {
                        Rectangle()
                            .fill(Color(red: 35/255, green: 37/255, blue: 54/255))
                            .frame(height: 1)
                        
                        QuizNavigationView(viewModel: viewModel)
                            .padding(.horizontal)
                            .padding(.bottom, 24)
                    }
                }
            }
        }
    }
}

struct QuizHeaderView: View {
    @State var isMenu = false
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color(red: 52/255, green: 54/255, blue: 78/255))
                    .frame(width: 40, height: 40)
                    .shadow(color: Color.black.opacity(0.18), radius: 4, x: 0, y: 2)
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
            }
            .onTapGesture {
                isMenu = true
            }
            Text("Quiz")
                .Alata(size: 24)
                .foregroundColor(.white)
                .padding(.leading, 2)
            Spacer()
        }
        .fullScreenCover(isPresented: $isMenu) {
            ChikenMainView()
        }
    }
}

struct QuizHeaderProgress: View {
    let current: Int
    let total: Int
    var progress: Double { Double(current) / Double(total) }
    var body: some View {
        ProgressView(value: progress)
            .accentColor(Color(red: 255/255, green: 204/255, blue: 82/255))
            .scaleEffect(x: 1, y: 2, anchor: .center)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color(red: 52/255, green: 54/255, blue: 78/255))
                    .frame(height: 8)
            )
    }
}

struct QuizResultCardView: View {
    @ObservedObject var viewModel: ChikenQuizViewModel

    var body: some View {
        let isGood = viewModel.isGoodResult
        let mainColor = isGood ? Color.green : Color.red
        let title = isGood ? "Great Job!" : "Try again!"
        VStack(spacing: 18) {
            ZStack {
                Circle()
                    .stroke(mainColor, lineWidth: 5)
                    .frame(width: 90, height: 90)
                Image(systemName: "trophy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .foregroundColor(mainColor)
            }
            Text(title)
                .Alata(size: 24, color: mainColor)

            Text("Score: \(viewModel.correctAnswers)/\(viewModel.totalQuestions)")
                .Alata(size: 18)
                
            Text("\(viewModel.scorePercent)% Correct")
                .Alata(size: 14, color: Color.white.opacity(0.7))
                
            QuizResultProgressBar(value: Double(viewModel.correctAnswers), total: Double(viewModel.totalQuestions), color: mainColor)
                .padding(.top, 8)
        }
        .padding(.vertical, 28)
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [mainColor.opacity(0.13), Color(red: 52/255, green: 54/255, blue: 78/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(mainColor.opacity(0.4), lineWidth: 1.5)
                )
        )
        .onAppear() {
            UserDefaultsManager().markAchievement3Done()
            if isGood {
                UserDefaultsManager().addTenPoints()
            }
        }
    }
}

struct QuizResultProgressBar: View {
    let value: Double
    let total: Double
    let color: Color
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color(red: 52/255, green: 54/255, blue: 78/255))
                    .frame(height: 10)
                RoundedRectangle(cornerRadius: 6)
                    .fill(color)
                    .frame(width: CGFloat(value/total) * geo.size.width, height: 10)
            }
        }
        .frame(height: 10)
    }
}

struct QuizResultButtons: View {
    @ObservedObject var viewModel: ChikenQuizViewModel
    @State var isMenu = false
    var body: some View {
        VStack(spacing: 16) {
            Button(action: {
                viewModel.restartQuiz()
            }) {
                Text("Retake Quiz")
                    .Alata(size: 16, color: .black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color(red: 255/255, green: 204/255, blue: 82/255))
                    .cornerRadius(18)
            }
            Button(action: {
                isMenu = true
            }) {
                Text("Menu")
                    .Alata(size: 16)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color(red: 69/255, green: 71/255, blue: 110/255))
                    .cornerRadius(18)
            }
        }
        .fullScreenCover(isPresented: $isMenu) {
            ChikenMainView()
        }
    }
}

struct QuizQuestionView: View {
    @ObservedObject var viewModel: ChikenQuizViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(viewModel.currentQuestion.text)
                .Alata(size: 18)
                .padding(.bottom, 8)
            ForEach(Array(viewModel.currentQuestion.options.enumerated()), id: \ .element.id) { idx, option in
                Button(action: {
                    viewModel.selectOption(idx)
                }) {
                    HStack {
                        Text(option.letter)
                            .Alata(size: 14)
                            .frame(width: 32, height: 32)
                            .background(optionBackground(idx: idx))
                            .foregroundColor(optionForeground(idx: idx))
                            .clipShape(Circle())
                        Text(option.text)
                            .Alata(size: 16)
                            .foregroundColor(optionForeground(idx: idx))
                        Spacer()
                        if viewModel.selectedOptionIndex == idx && viewModel.answerState != .notAnswered {
                            Image(systemName: viewModel.answerState == .correct && idx == viewModel.currentQuestion.correctIndex ? "checkmark" : "xmark")
                                .foregroundColor(viewModel.answerState == .correct && idx == viewModel.currentQuestion.correctIndex ? Color.green : Color.red)
                        }
                    }
                    .padding()
                    .background(optionRowBackground(idx: idx))
                    .cornerRadius(10)
                }
                .disabled(viewModel.answerState != .notAnswered)
            }
        }
        .padding()
        .background(Color(red: 36/255, green: 37/255, blue: 50/255))
        .cornerRadius(16)
    }
    
    func optionBackground(idx: Int) -> Color {
        if viewModel.selectedOptionIndex == idx {
            if viewModel.answerState == .correct && idx == viewModel.currentQuestion.correctIndex {
                return Color.green.opacity(0.7)
            } else if viewModel.answerState == .incorrect && idx == viewModel.selectedOptionIndex {
                return Color.red.opacity(0.7)
            }
            return Color(red: 255/255, green: 204/255, blue: 82/255)
        }
        return Color(red: 52/255, green: 54/255, blue: 78/255)
    }
    
    func optionForeground(idx: Int) -> Color {
        if viewModel.selectedOptionIndex == idx {
            if viewModel.answerState == .correct && idx == viewModel.currentQuestion.correctIndex {
                return .white
            } else if viewModel.answerState == .incorrect && idx == viewModel.selectedOptionIndex {
                return .white
            }
            return .black
        }
        return .white
    }
    
    func optionRowBackground(idx: Int) -> Color {
        if viewModel.selectedOptionIndex == idx {
            if viewModel.answerState == .correct && idx == viewModel.currentQuestion.correctIndex {
                return Color.green.opacity(0.15)
            } else if viewModel.answerState == .incorrect && idx == viewModel.selectedOptionIndex {
                return Color.red.opacity(0.15)
            }
            return Color(red: 255/255, green: 204/255, blue: 82/255).opacity(0.15)
        }
        return Color(red: 52/255, green: 54/255, blue: 78/255)
    }
}

struct ExplanationView: View {
    let text: String
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
           Circle()
                .fill(Color(red: 255/255, green: 204/255, blue: 82/255).opacity(0.3))
                .frame(width: 32, height: 32)
                .overlay {
                    Image(systemName: "lightbulb.fill")
                        .foregroundColor(Color(red: 255/255, green: 204/255, blue: 82/255))
                        .font(.system(size: 14))
                        .padding(.top, 2)
                }
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Explanation:")
                    .Alata(size: 16, color: Color(red: 255/255, green: 204/255, blue: 82/255))
                
                Text("\"\(text)\"")
                    .Alata(size: 14)
            }
            
            Spacer()
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color(red: 255/255, green: 204/255, blue: 82/255).opacity(0.15))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(red: 255/255, green: 204/255, blue: 82/255), lineWidth: 1.2)
        )
        .cornerRadius(12)
    }
}

struct QuizNavigationView: View {
    @ObservedObject var viewModel: ChikenQuizViewModel

    var body: some View {
        HStack(spacing: 16) {
            Button(action: {
                viewModel.previousQuestion()
            }) {
                HStack {
                    Image(systemName: "arrow.left")
                    Text("Previous")
                        .Alata(size: 16)
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(red: 52/255, green: 54/255, blue: 78/255))
                .cornerRadius(12)
            }
            .disabled(viewModel.currentQuestionIndex == 0)
            
            Spacer()
            
            Button(action: {
                viewModel.nextQuestion()
            }) {
                HStack {
                    Text("Next")
                        .Alata(size: 16, color: .black)
                    
                    Image(systemName: "arrow.right")
                }
                .font(.headline)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(red: 255/255, green: 204/255, blue: 82/255))
                .cornerRadius(12)
            }
            .disabled(viewModel.answerState == .notAnswered)
        }
    }
}

#Preview {
    ChikenQuizView()
}
