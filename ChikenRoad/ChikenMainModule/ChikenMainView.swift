import SwiftUI

struct ChikenMainView: View {
    @StateObject var chikenMainModel =  ChikenMainViewModel()
    
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
                                    
                                    Text("2/4 Tasks")
                                        .Alata(size: 14, color: Color(red: 224/255, green: 187/255, blue: 75/255))
                                }
                                .padding(.horizontal)
                                
                                ZStack(alignment: .leading) {
                                    Rectangle()
                                        .fill(Color(red: 33/255, green: 37/255, blue: 54/255))
                                        .frame(width: 340, height: 10)
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                    
                                    Rectangle()
                                        .fill(Color(red: 224/255, green: 187/255, blue: 75/255))
                                        .frame(width: 140, height: 10)
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                }
                                
                                HStack {
                                    HStack {
                                        if 1 == 1 {
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
                                        if 1 == 1 {
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
                                        if 1 == 1 {
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
                                        if 1 == 1 {
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
                                            
                                            Text("Adding crushed eggshells to chicken feed provides extra calcium for stronger eggshells.")
                                                .Alata(size: 14)
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
    }
}

#Preview {
    ChikenMainView()
}

