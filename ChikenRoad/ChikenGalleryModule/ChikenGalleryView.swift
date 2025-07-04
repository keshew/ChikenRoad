import SwiftUI

struct ChikenGalleryView: View {
    @StateObject var chikenGalleryModel = ChikenGalleryViewModel()
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
                        
                        Text("Care Gallery")
                            .Alata(size: 24)
                        Spacer()
                    }
                    .padding(.leading)
                    
                    VStack(spacing: 15) {
                        ForEach(Array(chikenGalleryModel.arrayOfGallery.enumerated()), id: \.element.id) { index, item in
                            Rectangle()
                                .fill(Color(red: 61/255, green: 67/255, blue: 95/255))
                                .overlay(
                                    HStack(alignment: .top) {
                                        VStack(alignment: .leading) {
                                            Text(item.title)
                                                .Alata(size: 18)
                                                .minimumScaleFactor(0.8)
                                            Spacer()
                                            Text(item.text)
                                                .Alata(size: 14, color: Color(red: 163/255, green: 167/255, blue: 174/255))
                                                .minimumScaleFactor(0.8)
                                        }
                                        .padding(.leading)
                                        .padding(.vertical)
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .leading) {
                                            Circle()
                                                .fill(Color(red: 224/255, green: 187/255, blue: 75/255))
                                                .opacity(0.15)
                                                .overlay(
                                                    Image(systemName: item.isDone ? "bookmark.fill" : "bookmark")
                                                        .font(.system(size: 20))
                                                        .foregroundStyle(Color(red: 224/255, green: 187/255, blue: 75/255))
                                                        .onTapGesture {
                                                            chikenGalleryModel.toggleDone(for: index)
                                                        }
                                                )
                                                .frame(width: 48, height: 48)
                                        }
                                        .padding(.trailing)
                                        .padding(.vertical)
                                    }
                                )
                                .frame(height: 108)
                                .cornerRadius(16)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }
            }
        }
        .onAppear() {
            UserDefaultsManager().markAchievement2Done()
        }
    }
}

#Preview {
    ChikenGalleryView()
}

