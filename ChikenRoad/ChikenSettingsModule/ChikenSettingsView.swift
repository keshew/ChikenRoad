import SwiftUI

struct ChikenSettingsView: View {
    @StateObject var chikenSettingsModel =  ChikenSettingsViewModel()
    @State var isMenu = false
    @Environment(\.presentationMode) var presentationMode
    var userDefaultsManager = UserDefaultsManager()
    @State var showResetAlert = false
    
    var body: some View {
        ZStack {
            Color(red: 22/255, green: 24/255, blue: 34/255)
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        HStack {
                            Circle()
                                .fill(Color(red: 43/255, green: 46/255, blue: 65/255))
                                .overlay {
                                    Image(systemName: "arrow.left")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundStyle(.white)
                                }
                                .frame(width: 48, height: 48)
                                .onTapGesture {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            
                            Text("Settings")
                                .Alata(size: 24)
                        }
                        .padding(.leading)
                        
                        Spacer()
                    }
                    
                    Rectangle()
                        .fill(Color(red: 43/255, green: 46/255, blue: 65/255))
                        .overlay {
                            VStack(spacing: 18) {
                                HStack {
                                    Text("Level Progress")
                                        .Alata(size: 18)
                                    
                                    Spacer()
                                    
                                    Text("Level 1")
                                        .Alata(size: 14, color: Color(red: 224/255, green: 187/255, blue: 75/255))
                                }
                                .padding(.horizontal)
                                
                                ProgressBarView2(currentValue: CGFloat(UserDefaultsManager().getPoints()))
                                
                                HStack {
                                    Text("\(UserDefaultsManager().getPoints()) / 500 XP")
                                        .Alata(size: 12, color: Color(red: 163/255, green: 167/255, blue: 174/255))
                                    
                                    Spacer()
                                    
                                    XPTextView()
                                }
                                .padding(.horizontal)
                            }
                        }
                        .frame(height: 112)
                        .cornerRadius(16)
                        .padding(.horizontal)
                    
                    HStack {
                        Text("Settings")
                            .Alata(size: 18)
                        
                        Spacer()
                    }
                    .padding(.leading)
                    .padding(.top)
                    
                    VStack(spacing: 15) {
                        Rectangle()
                            .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                            .overlay {
                                HStack {
                                    VStack(alignment: .leading, spacing: 15) {
                                        Circle()
                                            .fill(Color(red: 67/255, green: 74/255, blue: 106/255))
                                            .overlay {
                                                Image(systemName: "bell.fill")
                                                    .font(.system(size: 20))
                                                    .foregroundStyle(Color(red: 224/255, green: 187/255, blue: 75/255))
                                            }
                                            .frame(width: 48, height: 48)
                                        
                                    }
                                    .padding(.leading)
                                    
                                    VStack(alignment: .leading) {
                                        Text("Notifications")
                                            .Alata(size: 14)
                                        
                                        Text("Daily reminders & tips")
                                            .Alata(size: 12, color: Color(red: 163/255, green: 167/255, blue: 174/255))
                                    }
                                    .padding(.leading, 5)
                                    
                                    Spacer()
                                    
                                    Toggle("", isOn: $chikenSettingsModel.isNotif)
                                        .toggleStyle(CustomToggleStyle())
                                }
                            }
                            .frame(height: 72)
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
                                                Image(systemName: "tray.and.arrow.down.fill")
                                                    .font(.system(size: 20))
                                                    .foregroundStyle(Color(red: 248/255, green: 113/255, blue: 113/255))
                                            }
                                            .frame(width: 48, height: 48)
                                        
                                    }
                                    .padding(.leading)
                                    
                                    Text("Reset progress")
                                        .Alata(size: 14, color: Color(red: 248/255, green: 113/255, blue: 113/255))
                                        .padding(.leading, 5)
                                        .onTapGesture {
                                            showResetAlert = true
                                        }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 20))
                                        .foregroundStyle(Color(red: 248/255, green: 113/255, blue: 113/255))
                                        .padding(.trailing)
                                }
                            }
                            .frame(height: 72)
                            .cornerRadius(16)
                            .padding(.horizontal)
                    }
                    .padding(.top)
                }
            }
            .scrollDisabled(UIScreen.main.bounds.width > 380  ? true : false)
        }
        .fullScreenCover(isPresented: $isMenu, content: {
            ChikenMainView()
        })
        .alert("Are you sure?", isPresented: $showResetAlert) {
                 Button("Cancel", role: .cancel) { }
                 Button("Reset", role: .destructive) {
                     userDefaultsManager.clearAllKeys()
                     isMenu = true
                 }
             } message: {
                 Text("Do you want to clear all progress?")
             }
    }
}

#Preview {
    ChikenSettingsView()
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            RoundedRectangle(cornerRadius: 16)
                .fill(configuration.isOn ? Color(red: 224/255, green: 187/255, blue: 75/255) : Color(red: 118/255, green: 122/255, blue: 144/255))
                .frame(width: 48, height: 24)
                .overlay(
                    Circle()
                        .fill(configuration.isOn ? Color(red: 22/255, green: 24/255, blue: 34/255) : Color(red: 224/255, green: 187/255, blue: 75/255))
                        .frame(width: 20, height: 20)
                        .offset(x: configuration.isOn ? 11 : -11)
                        .animation(.easeInOut, value: configuration.isOn)
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
        .padding()
    }
}

struct XPTextView: View {
    let maxXP = 500
    let manager = UserDefaultsManager()
    
    var body: some View {
        let currentPoints = manager.getPoints()
        let xpToNextLevel = max(0, maxXP - currentPoints)
        
        Text("\(xpToNextLevel) XP to next level")
            .Alata(size: 12, color: Color(red: 163/255, green: 167/255, blue: 174/255))
    }
}

struct ProgressBarView2: View {
    let maxWidth: CGFloat = UIScreen.main.bounds.width > 900 ? 960 : (UIScreen.main.bounds.width > 600 ? 760 : 340)
    let maxValue: CGFloat = 500
    var currentValue: CGFloat

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color(red: 33/255, green: 37/255, blue: 54/255))
                .frame(width: maxWidth, height: 10)
                .cornerRadius(10)
                .padding(.horizontal)

            Rectangle()
                .fill(Color(red: 224/255, green: 187/255, blue: 75/255))
                .frame(width: (currentValue / maxValue) * maxWidth, height: 10)
                .cornerRadius(10)
                .padding(.horizontal)
                .animation(.easeInOut, value: currentValue)
        }
    }
}
