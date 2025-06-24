import SwiftUI

struct ChikenMainView: View {
    @StateObject var chikenMainModel =  ChikenMainViewModel()
    let manager = UserDefaultsManager()
    
    var body: some View {
        ZStack {
            Color(red: 22/255, green: 24/255, blue: 34/255)
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Good morning!")
                                .Alata(size: 24)
                            
                            Text("Let's check on your chickens")
                                .Alata(size: 14, color: Color(red: 178/255, green: 181/255, blue: 183/255))
                        }
                        .padding(.leading)
                        
                        Spacer()
                    }
                    
                    Rectangle()
                        .fill(Color(red: 43/255, green: 46/255, blue: 65/255))
                        .overlay {
                            VStack(spacing: 25) {
                                HStack {
                                    Text("Today's Progress")
                                        .Alata(size: 18)
                                    
                                    Spacer()
                                    
                                    TasksProgressView()
                                }
                                .padding(.horizontal)
                                
                                ProgressBarView()
                                
                                HStack {
                                    HStack {
                                        if manager.readBoolValue1() {
                                            Image(systemName: "checkmark")
                                                .font(.system(size: 16))
                                                .foregroundStyle(Color(red: 100/255, green: 186/255, blue: 100/255))
                                        } else {
                                            Image(systemName: "allergens.fill")
                                                .font(.system(size: 16))
                                                .foregroundStyle(Color(red: 113/255, green: 117/255, blue: 127/255))
                                        }
                                        
                                        Text("Feeding")
                                            .Alata(size: 12)
                                    }
                                    
                                    Spacer()
                                    
                                    HStack {
                                        if  manager.readBoolValue2() {
                                            Image(systemName: "checkmark")
                                                .font(.system(size: 16))
                                                .foregroundStyle(Color(red: 100/255, green: 186/255, blue: 100/255))
                                        } else {
                                            Image(systemName: "drop.fill")
                                                .font(.system(size: 16))
                                                .foregroundStyle(Color(red: 113/255, green: 117/255, blue: 127/255))
                                        }
                                        Text("Water")
                                            .Alata(size: 12)
                                    }
                                    
                                    Spacer()
                                    
                                    HStack {
                                        if manager.readBoolValue3() {
                                            Image(systemName: "checkmark")
                                                .font(.system(size: 16))
                                                .foregroundStyle(Color(red: 100/255, green: 186/255, blue: 100/255))
                                        } else {
                                            Image(.broom2)
                                                .resizable()
                                                .frame(width: 13, height: 16)
                                        }
                                        Text("Cleaning")
                                            .Alata(size: 12)
                                    }
                                    
                                    Spacer()
                                    
                                    HStack {
                                        if manager.readBoolValue4() {
                                            Image(systemName: "checkmark")
                                                .font(.system(size: 16))
                                                .foregroundStyle(Color(red: 100/255, green: 186/255, blue: 100/255))
                                        } else {
                                            Image(.egg)
                                                .resizable()
                                                .frame(width: 9, height: 16)
                                        }
                                        
                                        Text("Eggs")
                                            .Alata(size: 12)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        .frame(height: 142)
                        .cornerRadius(16)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        HStack(spacing: -10) {
                            Rectangle()
                                .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                                .overlay {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 15) {
                                            Circle()
                                                .fill(Color(red: 67/255, green: 74/255, blue: 106/255))
                                                .overlay {
                                                    Image(systemName: "chart.line.uptrend.xyaxis")
                                                        .font(.system(size: 20))
                                                        .foregroundStyle(Color(red: 224/255, green: 187/255, blue: 75/255))
                                                }
                                                .frame(width: 48, height: 48)
                                            
                                            VStack(alignment: .leading, spacing: 10) {
                                                Text("🐔 Care Progress")
                                                    .Alata(size: 16)
                                                
                                                Text("Track your daily tasks")
                                                    .Alata(size: 12, color: Color(red: 171/255, green: 175/255, blue: 186/255))
                                            }
                                        }
                                        .padding(.leading)
                                        
                                        Spacer()
                                    }
                                }
                                .frame(height: 148)
                                .cornerRadius(16)
                                .padding(.horizontal)
                                .onTapGesture {
                                    chikenMainModel.isProgress = true
                                }
                            
                            Rectangle()
                                .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                                .overlay {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 15) {
                                            Circle()
                                                .fill(Color(red: 67/255, green: 74/255, blue: 106/255))
                                                .overlay {
                                                    Image("egg2")
                                                        .resizable()
                                                        .frame(width: 20, height: 28)
                                                }
                                                .frame(width: 48, height: 48)
                                            
                                            VStack(alignment: .leading, spacing: 10) {
                                                Text("📅 Care Gallery")
                                                    .Alata(size: 16)
                                                
                                                Text("Your tips")
                                                    .Alata(size: 12, color: Color(red: 171/255, green: 175/255, blue: 186/255))
                                            }
                                        }
                                        .padding(.leading)
                                        
                                        Spacer()
                                    }
                                }
                                .frame(height: 148)
                                .cornerRadius(16)
                                .padding(.horizontal)
                                .onTapGesture {
                                    chikenMainModel.isGallery = true
                                }
                        }
                        
                        HStack(spacing: -10) {
                            Rectangle()
                                .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                                .overlay {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 15) {
                                            Circle()
                                                .fill(Color(red: 67/255, green: 74/255, blue: 106/255))
                                                .overlay {
                                                    Image(systemName: "brain")
                                                        .font(.system(size: 20))
                                                        .foregroundStyle(Color(red: 224/255, green: 187/255, blue: 75/255))
                                                }
                                                .frame(width: 48, height: 48)
                                            
                                            VStack(alignment: .leading, spacing: 10) {
                                                Text("🧠 Knowledge Quiz")
                                                    .Alata(size: 16)
                                                
                                                Text("Test your knowledge")
                                                    .Alata(size: 12, color: Color(red: 171/255, green: 175/255, blue: 186/255))
                                            }
                                        }
                                        .padding(.leading)
                                        
                                        Spacer()
                                    }
                                }
                                .frame(height: 148)
                                .cornerRadius(16)
                                .padding(.horizontal)
                                .onTapGesture {
                                    chikenMainModel.isQuiz = true
                                }
                            
                            Rectangle()
                                .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                                .overlay {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 15) {
                                            Circle()
                                                .fill(Color(red: 67/255, green: 74/255, blue: 106/255))
                                                .overlay {
                                                    Image(systemName: "person.fill")
                                                        .font(.system(size: 20))
                                                        .foregroundStyle(Color(red: 224/255, green: 187/255, blue: 75/255))
                                                }
                                                .frame(width: 48, height: 48)
                                            
                                            VStack(alignment: .leading, spacing: 10) {
                                                Text("⚙️ Profile")
                                                    .Alata(size: 16)
                                                
                                                Text("Your settings & progress")
                                                    .Alata(size: 12, color: Color(red: 171/255, green: 175/255, blue: 186/255))
                                            }
                                        }
                                        .padding(.leading)
                                        
                                        Spacer()
                                    }
                                }
                                .frame(height: 148)
                                .cornerRadius(16)
                                .padding(.horizontal)
                                .onTapGesture {
                                    chikenMainModel.isProfile = true
                                }
                        }
                    }
                    .padding(.top)
                    
                    Rectangle()
                        .fill(Color(red: 224/255, green: 187/255, blue: 75/255))
                        .opacity(0.1)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color(red: 224/255, green: 187/255, blue: 75/255), lineWidth: 1)
                                .overlay {
                                    HStack(alignment: .top) {
                                        Circle()
                                            .fill(Color(red: 224/255, green: 187/255, blue: 75/255))
                                            .opacity(0.2)
                                            .overlay {
                                                Image(systemName: "lightbulb.fill")
                                                    .foregroundStyle(Color(red: 224/255, green: 187/255, blue: 75/255))
                                            }
                                            .frame(width: 48, height: 48)
                                        
                                        VStack(alignment: .leading, spacing: 10) {
                                            Text("Tip of the Day")
                                                .Alata(size: 16, color: Color(red: 224/255, green: 187/255, blue: 75/255))
                                            
                                            Text(chikenMainModel.contact.chickenCareTips[chikenMainModel.currentIndex])
                                                .Alata(size: 14, color: .white.opacity(0.7))
                                                .minimumScaleFactor(0.8)
                                                .lineLimit(4)
                                                .onAppear {
                                                    chikenMainModel.updateTipIfNeeded()
                                                }
                                        }
                                        .padding(.horizontal)
                                    }
                                    .padding(.horizontal)
                                }
                        }
                        .frame(height: 130)
                        .cornerRadius(16)
                        .padding(.horizontal)
                        .padding(.top)
                }
            }
            .scrollDisabled(UIScreen.main.bounds.width > 380  ? true : false)
        }
        .fullScreenCover(isPresented: $chikenMainModel.isProgress) {
            ChikenProgressView()
        }
        .fullScreenCover(isPresented: $chikenMainModel.isGallery) {
            ChikenGalleryView()
        }
        .fullScreenCover(isPresented: $chikenMainModel.isQuiz) {
            ChikenKnowledgeView()
        }
        .fullScreenCover(isPresented: $chikenMainModel.isProfile) {
            ChikenSettingsView()
        }
    }
}

#Preview {
    ChikenMainView()
}

struct ProgressBarView: View {
    @State var boolValues: [Bool] = [UserDefaultsManager().readBoolValue1(), UserDefaultsManager().readBoolValue2(), UserDefaultsManager().readBoolValue3(), UserDefaultsManager().readBoolValue4()]
    
    let maxWidth: CGFloat = UIScreen.main.bounds.width > 900 ? 960 : (UIScreen.main.bounds.width > 600 ? 760 : 340)
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color(red: 33/255, green: 37/255, blue: 54/255))
                .frame(width: maxWidth, height: 10)
                .cornerRadius(10)
                .padding(.horizontal)
            
            let trueCount = boolValues.filter { $0 }.count
            let progressWidth = maxWidth * CGFloat(trueCount) / 4.0
            
            Rectangle()
                .fill(Color(red: 224/255, green: 187/255, blue: 75/255))
                .frame(width: progressWidth, height: 10)
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
}

struct TasksProgressView: View {
    @State var tasks: [Bool] = [UserDefaultsManager().readBoolValue1(), UserDefaultsManager().readBoolValue2(), UserDefaultsManager().readBoolValue3(), UserDefaultsManager().readBoolValue4()]
    
    var body: some View {
        let completedCount = tasks.filter { $0 }.count
        let totalCount = tasks.count
        
        Text("\(completedCount)/\(totalCount) Tasks")
            .Alata(size: 14, color: Color(red: 224/255, green: 187/255, blue: 75/255))
    }
}
