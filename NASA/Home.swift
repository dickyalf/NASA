import SwiftUI

struct Home: View {
    @State private var searchBarOffset: CGFloat = 200
    @State private var isSearchBarSticky: Bool = false

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            // Profile image on the left side
                            Image("anal")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .foregroundColor(.mint)
                                .clipShape(Circle())
                                .padding(.leading)

                            VStack(alignment: .leading, spacing: 2) {
                                Text("Selamat pagi")
                                    .font(.subheadline)
                                    .fontWeight(.medium)

                                Text("Halo, Ana")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                            .padding(.leading)

                            Spacer()

                            // Notification bell icon on the right side
                            ZStack {
                                Image(systemName: "bell.circle.fill")
                                    .symbolRenderingMode(.hierarchical)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 36, height: 36)
                                    .foregroundColor(.mint)
                            }
                            .padding(.trailing)
                        }
                        .padding(.bottom, 20)
                        .padding([.top, .horizontal])
                        // SearchBar with GeometryReader for position tracking
                        SearchBar()
                            .background(GeometryReader { geometry in
                                Color.clear
                                    .preference(key: ViewOffsetKey.self, value: geometry.frame(in: .global).minY)
                            })
                            .onPreferenceChange(ViewOffsetKey.self) { offset in
                                withAnimation {
                                    self.searchBarOffset = offset
                                    self.isSearchBarSticky = offset < 0
                                }
                            }

                        MenuIcons()
                        PopularLocations()
                    }
                }
                
                // Sticky search bar
                if isSearchBarSticky {
                    SearchBar()
                        .background(Color.white)
                        .shadow(radius: 2)
                        .transition(.move(edge: .top))
                        .animation(.easeInOut)
                        .zIndex(1) // Ensure the sticky search bar is above other content
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct SearchBar: View {
    @State private var searchText = ""

    var body: some View {
        HStack {
            TextField("Cari", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if !searchText.isEmpty {
                            Button(action: {
                                self.searchText = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                        Image(systemName: "line.3.horizontal.decrease.circle.fill")
                        .foregroundColor(.mint)
                        .symbolRenderingMode(.hierarchical)
                        .padding()
                    }
                )
                .padding(.horizontal, 10)
        }
        .padding(.horizontal)
    }
}

struct MenuIcons: View {
    let icons = ["fork.knife", "cup.and.saucer", "leaf", "sportscourt", "bicycle"]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(icons, id: \.self) { icon in
                    VStack {
                        Image(systemName: icon)
                            .font(.title3)
                            .foregroundColor(.mint)
                            .padding(20)
                        Text(icon.capitalized)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct PopularLocations: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Lokasi Terpopuler")
                .font(.headline)
                .fontWeight(.bold)
                .padding()

            LazyVGrid(columns: columns, spacing: 20) {
                LocationView(name: "Milano Park", location: "Sant Paulo, Milan, Italy", rating: "4.7", reviewCount: "1.720")
                LocationView(name: "Milano Mountains", location: "Sant Paulo, Milan, Italy", rating: "4.9", reviewCount: "3.127")
                LocationView(name: "Milano Park", location: "Sant Paulo, Milan, Italy", rating: "4.7", reviewCount: "1.720")
                LocationView(name: "Milano Mountains", location: "Sant Paulo, Milan, Italy", rating: "4.9", reviewCount: "3.127")
                LocationView(name: "Milano Park", location: "Sant Paulo, Milan, Italy", rating: "4.7", reviewCount: "1.720")
                LocationView(name: "Milano Mountains", location: "Sant Paulo, Milan, Italy", rating: "4.9", reviewCount: "3.127")
                // Add more locations as needed
            }
            .padding(.horizontal)
        }
    }
}

struct LocationView: View {
    var name: String
    var location: String
    var rating: String
    var reviewCount: String

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(.bold)
                Text(location)
                    .font(.footnote)
                    .foregroundColor(.gray)
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("\(rating) (\(reviewCount) Ulasan)")
                        .font(.caption)
                }
            }
            .padding(10)
            .background(Color.white)
            .cornerRadius(12)
            .padding(.top, 144)
        }
        .padding(5)
        .background(Image("anal"))
        .cornerRadius(16)
    }
}


//@main
//struct MyApp: App {
//    var body: some Scene {
//        WindowGroup {
//            Home()
//        }
//    }
//}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    Home()
        .modelContainer(for: Item.self, inMemory: true)
}
