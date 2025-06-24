import SwiftUI

struct ChikenKnowledgeView: View {
    @StateObject var chikenKnowledgeModel =  ChikenKnowledgeViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color(red: 22/255, green: 24/255, blue: 34/255)
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        Circle()
                            .fill(Color(red: 43/255, green: 46/255, blue: 65/255))
                            .overlay(
                                Image(systemName: "arrow.left")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundStyle(.white)
                            )
                            .frame(width: 48, height: 48)
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                        
                        VStack(alignment: .leading) {
                            Text("Chicken Knowledge Quiz")
                                .Alata(size: 24)
                            
                            Text("Test your chicken care knowledge")
                                .Alata(size: 14, color: Color(red: 178/255, green: 181/255, blue: 182/255))
                        }
                        .padding(.leading, 5)
                        
                        Spacer()
                    }
                    .padding(.leading)
                    
                    Rectangle()
                        .fill(Color(red: 43/255, green: 46/255, blue: 65/255))
                        .overlay {
                            VStack(spacing: 20) {
                                HStack {
                                    Circle()
                                        .fill(Color(red: 224/255, green: 187/255, blue: 75/255))
                                        .opacity(0.2)
                                        .frame(width: 48, height: 48)
                                        .overlay {
                                            Image(.champ)
                                                .resizable()
                                                .frame(width: 22, height: 28)
                                        }
                                    
                                    
                                    VStack(alignment: .leading) {
                                        Text("Your Progress")
                                            .Alata(size: 18)
                                        
                                        Text("Level 1 - New to the Chicken Coop")
                                            .Alata(size: 13, color: Color(red: 178/255, green: 181/255, blue: 182/255))
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .leading) {
                                        Text("\(String(describing: UserDefaultsManager().getPoints()))")
                                            .Alata(size: 24, color: Color(red: 224/255, green: 187/255, blue: 75/255))
                                        
                                        Text("XP Points")
                                            .Alata(size: 12, color: Color(red: 178/255, green: 181/255, blue: 182/255))
                                    }
                                    .padding(.trailing)
                                }
                                .padding(.leading)
                            }
                        }
                        .frame(height: 88)
                        .cornerRadius(16)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    HStack {
                        Text("Choose a Category")
                            .Alata(size: 18)
                            .padding(.leading)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    VStack(spacing: 15) {
                        Rectangle()
                            .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                            .overlay {
                                HStack  {
                                    Image(.category1)
                                        .resizable()
                                        .frame(width: 56, height: 56)
                                    
                                    Text("Cleanliness — Pack\nHealth")
                                        .Alata(size: 16)
                                        .padding(.leading, 10)
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Circle()
                                            .fill(Color(red: 224/255, green: 187/255, blue: 75/255))
                                            .overlay {
                                                Image(systemName: "play.fill")
                                            }
                                            .frame(width: 32, height: 32)
                                        
                                        Text("Start")
                                            .Alata(size: 12, color: Color(red: 224/255, green: 187/255, blue: 75/255))
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.trailing, 15)
                            }
                            .frame(height: 104)
                            .cornerRadius(16)
                            .padding(.horizontal)
                            .onTapGesture {
                                chikenKnowledgeModel.isQuiz = true
                                UserDefaultsManager().saveBoolValue1(true)
                            }
                        
                        Rectangle()
                            .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                            .overlay {
                                HStack  {
                                    Image(.category2)
                                        .resizable()
                                        .frame(width: 56, height: 56)
                                    
                                    Text("Food and water")
                                        .Alata(size: 16)
                                        .padding(.leading, 10)
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Circle()
                                            .fill(Color(red: 224/255, green: 187/255, blue: 75/255))
                                            .overlay {
                                                Image(systemName: "play.fill")
                                            }
                                            .frame(width: 32, height: 32)
                                        
                                        Text("Start")
                                            .Alata(size: 12, color: Color(red: 224/255, green: 187/255, blue: 75/255))
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.trailing, 15)
                            }
                            .frame(height: 104)
                            .cornerRadius(16)
                            .padding(.horizontal)
                            .onTapGesture {
                                chikenKnowledgeModel.isQuiz = true
                                UserDefaultsManager().saveBoolValue2(true)
                            }
                        
                        Rectangle()
                            .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                            .overlay {
                                HStack  {
                                    Image(.category3)
                                        .resizable()
                                        .frame(width: 56, height: 56)
                                    
                                    Text("Prevention")
                                        .Alata(size: 16)
                                        .padding(.leading, 10)
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Circle()
                                            .fill(Color(red: 224/255, green: 187/255, blue: 75/255))
                                            .overlay {
                                                Image(systemName: "play.fill")
                                            }
                                            .frame(width: 32, height: 32)
                                        
                                        Text("Start")
                                            .Alata(size: 12, color: Color(red: 224/255, green: 187/255, blue: 75/255))
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.trailing, 15)
                            }
                            .frame(height: 104)
                            .cornerRadius(16)
                            .padding(.horizontal)
                            .onTapGesture {
                                chikenKnowledgeModel.isQuiz = true
                                UserDefaultsManager().saveBoolValue3(true)
                            }
                        
                        Rectangle()
                            .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                            .overlay {
                                HStack  {
                                    Image(.category4)
                                        .resizable()
                                        .frame(width: 56, height: 56)
                                    
                                    Text("Farmer-pro")
                                        .Alata(size: 16)
                                        .padding(.leading, 10)
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Circle()
                                            .fill(Color(red: 224/255, green: 187/255, blue: 75/255))
                                            .overlay {
                                                Image(systemName: "play.fill")
                                            }
                                            .frame(width: 32, height: 32)
                                        
                                        Text("Start")
                                            .Alata(size: 12, color: Color(red: 224/255, green: 187/255, blue: 75/255))
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.trailing, 15)
                            }
                            .frame(height: 104)
                            .cornerRadius(16)
                            .padding(.horizontal)
                            .onTapGesture {
                                chikenKnowledgeModel.isQuiz = true
                                UserDefaultsManager().saveBoolValue4(true)
                            }
                    }
                    .padding(.top, 5)
                }
            }
        }
        .fullScreenCover(isPresented: $chikenKnowledgeModel.isQuiz) {
            ChikenQuizView()
        }
    }
}

#Preview {
    ChikenKnowledgeView()
}

