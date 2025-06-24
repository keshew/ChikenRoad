import SwiftUI

struct ChikenProgressView: View {
    @StateObject var chikenProgressModel =  ChikenProgressViewModel()
    @Environment(\.presentationMode) var presentationMode
    let manager = UserDefaultsManager()
    let achievementsDone = [UserDefaultsManager().isAchievement1Done(), UserDefaultsManager().isAchievement2Done(), UserDefaultsManager().isAchievement3Done(), UserDefaultsManager().isAchievement4Done()]
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
                        
                        Text("Care Progress")
                            .Alata(size: 24)
                        
                        Spacer()
                    }
                    .padding(.leading)
                    
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
                           
                            
                            VStack {
                                Text("Your Chicken Journey")
                                    .Alata(size: 18)
                                
                                Text("Complete tasks to level up!")
                                    .Alata(size: 14, color: Color(red: 178/255, green: 181/255, blue: 182/255))
                            }
                            
                            Spacer()
                        }
                        .padding(.leading)
                        
                        VStack {
                            let completedCount = achievementsDone.filter { $0 }.count
                            AchievementProgressBar(completedCount: completedCount)
                            
                            HStack {
                                Text("Level 1")
                                    .Alata(size: 12, color: Color(red: 178/255, green: 181/255, blue: 182/255))
                                    .padding(.horizontal, 25)
                                Spacer()
                                
                                Text("Level 4")
                                    .Alata(size: 12, color: Color(red: 178/255, green: 181/255, blue: 182/255))
                                    .padding(.horizontal, 35)
                            }
                            
                            
                            
                        }
                    }
                    .padding(.top)
                    
                    //MARK: - 1
                    VStack {
                        HStack {
                            Circle()
                                .fill(Color(red: 224/255, green: 187/255, blue: 75/255))
                                .frame(width: 48, height: 48)
                                .overlay {
                                    Text("1")
                                        .Alata(size: 24)
                                }
                                .padding(.leading)
                            
                            Text("New to the Chicken Coop")
                                .Alata(size: 16)
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            Rectangle()
                                .fill(Color(red: 100/255, green: 186/255, blue: 100/255))
                                .overlay {
                                    Text("Current")
                                        .Alata(size: 12)
                                }
                                .frame(width: 55, height: 24)
                                .cornerRadius(16)
                                .padding(.trailing)
                        }
                        
                        VStack(spacing: 15) {
                            let achievementsDone: [Bool] = [
                                manager.isAchievement1Done(),
                                manager.isAchievement2Done(),
                                manager.isAchievement3Done(),
                                manager.isAchievement4Done(),
                                manager.isAchievement5Done()
                            ]
                            ForEach(0..<chikenProgressModel.contact.arrayOfAchiev.count, id: \.self) { index in
                                HStack {
                                    Rectangle()
                                        .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                                        .overlay {
                                            HStack(alignment: .top) {
                                                Image(chikenProgressModel.contact.arrayOfAchiev[index].image)
                                                    .resizable()
                                                    .frame(width: index > 2 ? 15 : (index == 0 ? 14 : 18), height: 28)
                                                
                                                VStack(alignment: .leading, spacing: 7) {
                                                    Text(chikenProgressModel.contact.arrayOfAchiev[index].title)
                                                        .Alata(size: 16)
                                                    
                                                    Text(chikenProgressModel.contact.arrayOfAchiev[index].subtitle)
                                                        .Alata(size: 14, color: Color(red: 190/255, green: 193/255, blue: 200/255))
                                                }
                                                
                                                Spacer()
                                                
                                                if achievementsDone[index] {
                                                    Circle()
                                                        .fill(Color(red: 100/255, green: 186/255, blue: 100/255))
                                                        .overlay(content: {
                                                            Image(systemName: "checkmark")
                                                                .font(.system(size: 12))
                                                        })
                                                        .frame(width: 24, height: 24)

                                                } else {
                                                    Circle()
                                                        .fill(Color(red: 43/255, green: 46/255, blue: 65/255))
                                                        .overlay(content: {
                                                            Image(systemName: "lock.fill")
                                                                .font(.system(size: 12))
                                                                .foregroundStyle(Color(red: 122/255, green: 124/255, blue: 131/255))
                                                        })
                                                        .frame(width: 24, height: 24)
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                        .frame(height: 80)
                                        .cornerRadius(16)
                                        .padding(.horizontal)
                                        .padding(.leading, 60)
                                }
                            }
                        }
                    }
                    .padding(.top)
                    
                    //MARK: - 2
                    
                    VStack {
                        HStack {
                            Circle()
                                .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                                .frame(width: 48, height: 48)
                                .overlay {
                                    Text("2")
                                        .Alata(size: 24, color: Color(red: 178/255, green: 181/255, blue: 183/255))
                                }
                                .padding(.leading)
                            
                            Text("Pack Master")
                                .Alata(size: 16, color: Color(red: 178/255, green: 181/255, blue: 183/255))
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            Rectangle()
                                .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                                .overlay {
                                    Text("Locked")
                                        .Alata(size: 12, color: Color(red: 190/255, green: 193/255, blue: 200/255))
                                }
                                .frame(width: 55, height: 24)
                                .cornerRadius(16)
                                .padding(.trailing)
                        }
                        
                        VStack(spacing: 15) {
                            ForEach(0..<chikenProgressModel.contact.arrayOfAchiev2.count, id: \.self) { index in
                                HStack {
                                    Rectangle()
                                        .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                                        .overlay {
                                            HStack(alignment: .top) {
                                                Image(chikenProgressModel.contact.arrayOfAchiev2[index].image)
                                                    .resizable()
                                                    .frame(width: 18, height: 28)
                                                
                                                VStack(alignment: .leading, spacing: 7) {
                                                    Text(chikenProgressModel.contact.arrayOfAchiev2[index].title)
                                                        .Alata(size: 16)
                                                    
                                                    Text(chikenProgressModel.contact.arrayOfAchiev2[index].subtitle)
                                                        .Alata(size: 14, color: Color(red: 190/255, green: 193/255, blue: 200/255))
                                                }
                                                
                                                Spacer()
                                                
                                                Circle()
                                                    .fill(Color(red: 43/255, green: 46/255, blue: 65/255))
                                                    .overlay(content: {
                                                        Image(systemName: "lock.fill")
                                                            .font(.system(size: 12))
                                                            .foregroundStyle(Color(red: 122/255, green: 124/255, blue: 131/255))
                                                    })
                                                    .frame(width: 24, height: 24)
                                            }
                                            .padding(.horizontal)
                                        }
                                        .frame(height: 80)
                                        .cornerRadius(16)
                                        .padding(.horizontal)
                                        .padding(.leading, 60)
                                }
                            }
                        }
                        .opacity(0.5)
                    }
                    .padding(.top)
                    
                    //MARK: - 3
                    
                    VStack {
                        HStack {
                            Circle()
                                .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                                .frame(width: 48, height: 48)
                                .overlay {
                                    Text("3")
                                        .Alata(size: 24, color: Color(red: 178/255, green: 181/255, blue: 183/255))
                                }
                                .padding(.leading)
                            
                            Text("Expert Farmer")
                                .Alata(size: 16, color: Color(red: 178/255, green: 181/255, blue: 183/255))
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            Rectangle()
                                .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                                .overlay {
                                    Text("Locked")
                                        .Alata(size: 12, color: Color(red: 190/255, green: 193/255, blue: 200/255))
                                }
                                .frame(width: 55, height: 24)
                                .cornerRadius(16)
                                .padding(.trailing)
                        }
                        
                        VStack(spacing: 15) {
                            ForEach(0..<chikenProgressModel.contact.arrayOfAchiev3.count, id: \.self) { index in
                                HStack {
                                    Rectangle()
                                        .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                                        .overlay {
                                            HStack(alignment: .top) {
                                                Image(chikenProgressModel.contact.arrayOfAchiev3[index].image)
                                                    .resizable()
                                                    .frame(width: 18, height: 28)
                                                
                                                VStack(alignment: .leading, spacing: 7) {
                                                    Text(chikenProgressModel.contact.arrayOfAchiev3[index].title)
                                                        .Alata(size: 16)
                                                    
                                                    Text(chikenProgressModel.contact.arrayOfAchiev3[index].subtitle)
                                                        .Alata(size: 14, color: Color(red: 190/255, green: 193/255, blue: 200/255))
                                                }
                                                
                                                Spacer()
                                                
                                                Circle()
                                                    .fill(Color(red: 43/255, green: 46/255, blue: 65/255))
                                                    .overlay(content: {
                                                        Image(systemName: "lock.fill")
                                                            .font(.system(size: 12))
                                                            .foregroundStyle(Color(red: 122/255, green: 124/255, blue: 131/255))
                                                    })
                                                    .frame(width: 24, height: 24)
                                            }
                                            .padding(.horizontal)
                                        }
                                        .frame(height: 80)
                                        .cornerRadius(16)
                                        .padding(.horizontal)
                                        .padding(.leading, 60)
                                }
                            }
                        }
                        .opacity(0.5)
                    }
                    .padding(.top)
                    
                    //MARK: - 4
                    
                    VStack {
                        HStack {
                            Circle()
                                .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                                .frame(width: 48, height: 48)
                                .overlay {
                                    Text("4")
                                        .Alata(size: 24, color: Color(red: 178/255, green: 181/255, blue: 183/255))
                                }
                                .padding(.leading)
                            
                            Text("Guru of Chickens")
                                .Alata(size: 16, color: Color(red: 178/255, green: 181/255, blue: 183/255))
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            Rectangle()
                                .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                                .overlay {
                                    Text("Locked")
                                        .Alata(size: 12, color: Color(red: 190/255, green: 193/255, blue: 200/255))
                                }
                                .frame(width: 55, height: 24)
                                .cornerRadius(16)
                                .padding(.trailing)
                        }
                        
                        VStack(spacing: 15) {
                            ForEach(0..<chikenProgressModel.contact.arrayOfAchiev4.count, id: \.self) { index in
                                HStack {
                                    Rectangle()
                                        .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                                        .overlay {
                                            HStack(alignment: .top) {
                                                Image(chikenProgressModel.contact.arrayOfAchiev4[index].image)
                                                    .resizable()
                                                    .frame(width: 18, height: 28)
                                                
                                                VStack(alignment: .leading, spacing: 7) {
                                                    Text(chikenProgressModel.contact.arrayOfAchiev4[index].title)
                                                        .Alata(size: 16)
                                                    
                                                    Text(chikenProgressModel.contact.arrayOfAchiev4[index].subtitle)
                                                        .Alata(size: 14, color: Color(red: 190/255, green: 193/255, blue: 200/255))
                                                }
                                                
                                                Spacer()
                                                
                                                Circle()
                                                    .fill(Color(red: 43/255, green: 46/255, blue: 65/255))
                                                    .overlay(content: {
                                                        Image(systemName: "lock.fill")
                                                            .font(.system(size: 12))
                                                            .foregroundStyle(Color(red: 122/255, green: 124/255, blue: 131/255))
                                                    })
                                                    .frame(width: 24, height: 24)
                                            }
                                            .padding(.horizontal)
                                        }
                                        .frame(height: 80)
                                        .cornerRadius(16)
                                        .padding(.horizontal)
                                        .padding(.leading, 60)
                                }
                            }
                        }
                        .opacity(0.5)
                    }
                    .padding(.top)
                }
            }
        }
    }
}

#Preview {
    ChikenProgressView()
}

struct AchievementProgressBar: View {
    let completedCount: Int
    let maxCount: Int = 10
    let fullWidth: CGFloat = UIScreen.main.bounds.width > 900 ? 960 : (UIScreen.main.bounds.width > 600 ? 760 : 340)
    let pointsPerAchievement: CGFloat = 10
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color(red: 33/255, green: 37/255, blue: 54/255))
                .frame(width: fullWidth, height: 10)
                .cornerRadius(10)
                .padding(.horizontal)
            
            Rectangle()
                .fill(Color(red: 224/255, green: 187/255, blue: 75/255))
                .frame(width: min(fullWidth, CGFloat(completedCount) * pointsPerAchievement), height: 10)
                .cornerRadius(10)
                .padding(.horizontal, 5)
                .animation(.easeInOut, value: completedCount)
        }
    }
}
