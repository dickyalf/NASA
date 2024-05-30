import SwiftUI

struct HomeScreen: View {
    @Binding var path: [Screen]
    @State private var searchBarOffset: CGFloat = 200
    @State private var isSearchBarSticky: Bool = false

    var body: some View {
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

                    MenuIcons().zIndex(1)
                    Button(action: {
                        path.append(.search)
                    }) {
                        Text("Mulai")
                            .font(.headline).foregroundColor(.init(uiColor: .systemGray6))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.mint)
                            .cornerRadius(12)
                    }
                    .zIndex(1)
                    .padding(.horizontal, 30)
                    .zIndex(1)
                    .padding(.top, 10)
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
    let icons = ["fork.knife", "cup.and.saucer", "leaf", "sportscourt", "bicycle", "map"]

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
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let locations: [Location] = [
        Location(id: 1, name: "Labuan Bajo", location: "Manggarai Barat, NTT", rating: "4.9", reviews: [
                Review(username: "Julius Wuwung", comment: "Loved this place! The staffs were friendly as well."),
                Review(username: "Maria Lopez", comment: "Amazing views, will definitely come back next year!"),
                Review(username: "An Nguyen", comment: "A bit crowded but worth the visit for the scenery.")
            ], imageUrl: "https://awsimages.detik.net.id/community/media/visual/2021/07/05/wisata-super-prioritas-labuan-bajo_169.jpeg?w=600&q=90",
                 description: "Labuan Bajo is a charming fishing town located at the western end of Flores in the Nusa Tenggara region of east Indonesia. It's the gateway to Komodo National Park, known for its population of Komodo dragons and underwater wonders."),
            Location(id: 2, name: "Borobudur Temple", location: "Magelang, Central Java", rating: "4.8", reviews: [
                Review(username: "John Doe", comment: "A must-visit destination for history enthusiasts!"),
                Review(username: "Emma Smith", comment: "Incredible architecture and serene atmosphere."),
                Review(username: "Ahmad Abdullah", comment: "A cultural treasure of Indonesia.")
            ], imageUrl: "https://lp-cms-production.imgix.net/2019-06/f4024c571e5e09ce5e4049bc181500b1-borobudur-temple.jpg", description: "lorem ipsum"),
            Location(id: 3, name: "Bali", location: "Various Locations, Bali", rating: "4.7", reviews: [
                Review(username: "Sophia Johnson", comment: "Paradise on Earth! Stunning beaches and vibrant culture."),
                Review(username: "David Kim", comment: "Great destination for surfing and relaxation."),
                Review(username: "Lina Chen", comment: "Lovely place to explore temples and enjoy local cuisine.")
            ], imageUrl: "https://international.unud.ac.id/protected/storage/file_summernote/4a0885ebc3c02b217cbf6c079eca6b37.jpg", description: "lorem ipsum"),
            Location(id: 4, name: "Raja Ampat Islands", location: "West Papua", rating: "4.9", reviews: [
                Review(username: "Maxwell Brown", comment: "Unbelievable marine biodiversity! Perfect for diving."),
                Review(username: "Nadia Patel", comment: "Crystal clear waters and pristine coral reefs."),
                Review(username: "Hiroshi Tanaka", comment: "A hidden gem of Indonesia. Must-visit for nature lovers.")
            ], imageUrl: "https://indonesiad.com/wp-content/uploads/2013/07/raja-ampat-islands.jpg", description: "lorem ipsum"),
            Location(id: 5, name: "Komodo National Park", location: "East Nusa Tenggara", rating: "4.8", reviews: [
                Review(username: "Elena Garcia", comment: "Fascinating wildlife and beautiful landscapes."),
                Review(username: "Ryan Miller", comment: "Seeing Komodo dragons up close was an unforgettable experience!"),
                Review(username: "Chen Wei", comment: "Great hiking trails and breathtaking views.")
            ], imageUrl: "https://balistarisland.com/wp-content/uploads/2016/10/komodonationalpark.jpg", description: "lorem ipsum"),
            Location(id: 6, name: "Yogyakarta", location: "Special Region of Yogyakarta", rating: "4.7", reviews: [
                Review(username: "Anna Wilson", comment: "Rich cultural heritage and warm hospitality."),
                Review(username: "Miguel Hernandez", comment: "Exploring ancient temples and enjoying traditional performances."),
                Review(username: "Aisha Khan", comment: "A perfect blend of history, art, and delicious food.")
            ], imageUrl: "https://investasiproperti.id/wp-content/uploads/2023/03/wisata-di-kota-yogyakarta-800x500.jpg", description: "lorem ipsum"),
            Location(id: 7, name: "Tana Toraja", location: "South Sulawesi", rating: "4.6", reviews: [
                Review(username: "Daniel Lee", comment: "Unique funeral rituals and traditional architecture."),
                Review(username: "Laila Rahman", comment: "Stunning landscapes and friendly locals."),
                Review(username: "Alexandre Dubois", comment: "A cultural journey into the heart of Sulawesi.")
            ], imageUrl: "https://akcdn.detik.net.id/visual/2020/10/24/patung-yesus-buntu-burake_169.jpeg?w=650", description: "lorem ipsum"),
            Location(id: 8, name: "Bromo Tengger Semeru National Park", location: "East Java", rating: "4.8", reviews: [
                Review(username: "Sophie Anderson", comment: "Mesmerizing sunrise views over the volcanic landscape."),
                Review(username: "Muhammad Ali", comment: "Challenging trekking trails and adventurous jeep rides."),
                Review(username: "Eva Müller", comment: "Breath-taking panoramas and a sense of awe-inspiring nature.")
            ], imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Taman_Nasional_Bromo_Tengger_Semeru_Yang_Indah.jpg/1280px-Taman_Nasional_Bromo_Tengger_Semeru_Yang_Indah.jpg", description: "lorem ipsum"),
            Location(id: 9, name: "Ubud", location: "Gianyar, Bali", rating: "4.7", reviews: [
                Review(username: "Michael Thompson", comment: "Tranquil rice terraces and serene yoga retreats."),
                Review(username: "Sara Johnson", comment: "Artistic hub with vibrant galleries and traditional crafts."),
                Review(username: "Yuki Tanaka", comment: "Relaxing atmosphere and spiritual vibes.")
            ], imageUrl: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/54/f4/01/saraswati-temple-in-ubud.jpg?w=600&h=400&s=1", description: "lorem ipsum")
    ]


    var body: some View {
        VStack(alignment: .leading) {
            Text("Lokasi Terpopuler")
                .font(.headline)
                .fontWeight(.bold)
                .padding()

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20){
                ForEach(locations, id: \.id) { location in
                    NavigationLink(destination: {
                        PopularLocationView(location: location)
                    }){
                        LocationView(name: location.name, location: location.location, rating: location.rating, reviewCount: String(location.reviews.count), imageUrl: location.imageUrl)
                    }
                    
                }
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
    var imageUrl: String

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
        .frame(maxWidth: .infinity)
        .padding(5)
        .background(
            AsyncImage(url: URL(string: imageUrl)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .clipped()
                } else if phase.error != nil {
                    Image(systemName: "photo.badge.arrow.down.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .clipped()
                } else {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        )
        .cornerRadius(16)
        .frame(height: 250)
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    HomeScreen(path: .constant([]))
        .modelContainer(for: Item.self, inMemory: true)
}
