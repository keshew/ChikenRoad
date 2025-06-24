import SwiftUI

struct ChikenOnboardingView: View {
    @StateObject var chikenOnboardingModel =  ChikenOnboardingViewModel()
    
    var body: some View {
        ZStack {
            Color(red: 22/255, green: 24/255, blue: 34/255)
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    if chikenOnboardingModel.currentIndex == 0 {
                        Image(.chikenOnb)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width > 900 ? 430 : (UIScreen.main.bounds.width > 600 ? 430 : 257), height: UIScreen.main.bounds.width > 900 ? 430 : (UIScreen.main.bounds.width > 600 ? 430 : 260))
                    } else if chikenOnboardingModel.currentIndex == 1 {
                        HStack(spacing: 40) {
                            Circle()
                                .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                                .overlay {
                                    Image(systemName: "fork.knife")
                                        .font(.system(size: 34, weight: .bold))
                                        .foregroundStyle(Color(red: 224/255, green: 187/255, blue: 75/255))
                                }
                                .frame(width: 100, height: 100)
                            
                            Circle()
                                .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                                .overlay {
                                    Image("broom")
                                        .resizable()
                                        .frame(width: 37, height: 50)
                                }
                                .frame(width: 100, height: 100)
                        }
                        .padding(.top, UIScreen.main.bounds.width > 900 ? 330 : (UIScreen.main.bounds.width > 600 ? 330 : 169))
                    } else {
                        Circle()
                            .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                            .overlay {
                                Image(systemName: "house.fill")
                                    .font(.system(size: 34, weight: .bold))
                                    .foregroundStyle(Color(red: 224/255, green: 187/255, blue: 75/255))
                            }
                            .frame(width: 100, height: 100)
                            .padding(.top, UIScreen.main.bounds.width > 900 ? 330 : (UIScreen.main.bounds.width > 600 ? 330 : 169))
                    }
                    
                    VStack(spacing: 20) {
                        Text(chikenOnboardingModel.contact.arrayTitle[chikenOnboardingModel.currentIndex])
                            .Alata(size: 24, color: Color(red: 224/255, green: 187/255, blue: 75/255))
                        
                        Text(chikenOnboardingModel.contact.arrayText[chikenOnboardingModel.currentIndex])
                            .Alata(size: 16)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                    .padding(.top)
                    
                    VStack(spacing: 20) {
                        Rectangle()
                            .fill(Color(red: 224/255, green: 187/255, blue: 75/255))
                            .overlay {
                                HStack {
                                    Text("Next")
                                        .Alata(size: 16, color: Color(red: 22/255, green: 24/255, blue: 34/255))
                                    
                                    Image(systemName: "arrow.right")
                                }
                            }
                            .frame(height: 56)
                            .cornerRadius(12)
                            .padding(.horizontal)
                            .onTapGesture {
                                if chikenOnboardingModel.currentIndex <= 1 {
                                    withAnimation {
                                        chikenOnboardingModel.currentIndex += 1
                                    }
                                } else {
                                    chikenOnboardingModel.isNext = true
                                }
                            }
                            .padding(.top, UIScreen.main.bounds.width > 900 ? 390 : (UIScreen.main.bounds.width > 600 ? 250 : 0))
                        
                        HStack {
                            Circle()
                                .fill(chikenOnboardingModel.currentIndex == 0 ? Color(red: 224/255, green: 187/255, blue: 75/255) : Color(red: 61/255, green: 67/255, blue: 95/255))
                                .frame(width: 10, height: 10)
                            
                            Circle()
                                .fill(chikenOnboardingModel.currentIndex == 1 ? Color(red: 224/255, green: 187/255, blue: 75/255) : Color(red: 61/255, green: 67/255, blue: 95/255))
                                .frame(width: 10, height: 10)
                            
                            Circle()
                                .fill(chikenOnboardingModel.currentIndex == 2 ? Color(red: 224/255, green: 187/255, blue: 75/255) : Color(red: 61/255, green: 67/255, blue: 95/255))
                                .frame(width: 10, height: 10)
                        }
                    }
                    .padding(.top, 270)
                }
            }
            .scrollDisabled(UIScreen.main.bounds.width > 380  ? true : false)
        }
        .fullScreenCover(isPresented: $chikenOnboardingModel.isNext) {
            ChikenMainView()
        }
    }
}

#Preview {
    ChikenOnboardingView()
}

