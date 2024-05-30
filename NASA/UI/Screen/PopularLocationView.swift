import SwiftUI

struct PopularLocationView: View {
    let location: Location
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                locationHeader(imageUrl: location.imageUrl)
                locationDetails(locationName: location.location, mainAttraction: location.name, description: location.description, rating: Double(location.rating) ?? 0.0)
                userReviews(reviews: location.reviews)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    @ViewBuilder
    private func locationHeader(imageUrl: String) -> some View {
        ZStack(alignment: .topLeading) {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 144)
            } placeholder: {
                Image(systemName: "photo.badge.arrow.down.fill")
            }
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.mint)
                    .clipShape(Circle())
                    .fontWeight(.bold)
            }
            .padding(.leading, 18)
        }
        .padding(.bottom, 48)
    }
    
    @ViewBuilder
    private func locationDetails(locationName: String, mainAttraction: String, description: String, rating: Double) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            locationHeaderDetails(locationName: locationName)
            Text(mainAttraction)
                .font(.title)
                .fontWeight(.bold)
            Text("“\(description)”")
                .font(.subheadline)
                .foregroundColor(.secondary)
            ratingStar(rating: rating)
            Divider()
                .padding(.top, 4)
        }
        .padding()
    }
    
    @ViewBuilder
    private func locationHeaderDetails(locationName: String) -> some View {
        HStack (alignment:.center, spacing: 8){
            Image(systemName: "location")
                .foregroundColor(.mint)
                .font(.system(size: 16))
            Text(locationName)
                .font(.headline)
                .fontWeight(.regular)
                .foregroundStyle(.mint)
        }
    }
    
    @ViewBuilder
    private func ratingStar(rating: Double) -> some View {
        HStack (alignment: .center, spacing: 8){
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Text("\(rating, specifier: "%.1f")")
                .fontWeight(.bold)
                .font(.system(size: 16))
        }
    }
    
    @ViewBuilder
    private func userReviews(reviews: [Review]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("What they are saying...")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.mint)
                .padding(.bottom, 4)
            ForEach(reviews, id: \.username) { review in
                userReview(username: review.username, comment: review.comment)
                Divider()
                    .padding(.vertical, 4)
            }
        }
        .padding()
    }
    
    // Single user review
    @ViewBuilder
    private func userReview(username: String, comment: String) -> some View {
        HStack (alignment:.top, spacing: 8){
            Image(systemName: "person.circle.fill")
                .font(.system(size: 28))
            VStack (alignment: .leading, spacing: 8) {
                Text(username)
                    .padding(.top, 4)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(comment)
                    .font(.subheadline)
            }
        }
    }
}

struct PlaceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularLocationView(
            location: Location(id: 9, name: "Ubud", location: "Gianyar, Bali", rating: "4.7", reviews: [
                Review(username: "Michael Thompson", comment: "Tranquil rice terraces and serene yoga retreats."),
                Review(username: "Sara Johnson", comment: "Artistic hub with vibrant galleries and traditional crafts."),
                Review(username: "Yuki Tanaka", comment: "Relaxing atmosphere and spiritual vibes.")
            ], imageUrl: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/54/f4/01/saraswati-temple-in-ubud.jpg?w=600&h=400&s=1", description: "lorem ipsum")
        )
    }
}
