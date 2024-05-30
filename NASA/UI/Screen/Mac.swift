import SwiftUI

struct MacPopularLocationView: View {
    var imageName: String = "milan"
    var locationName: String = "Milan, Italy"
    var mainAttraction: String = "Milano Mountains"
    var description: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae sapien viverra laoreet fusce cras nibh."
    var rating: Double = 4.0
    var reviews: [Review] = [
        Review(username: "Julius Wuwung", comment: "Loved this place! The staffs were friendly as well."),
        Review(username: "Maria Lopez", comment: "Amazing views, will definitely come back next year!"),
        Review(username: "An Nguyen", comment: "A bit crowded but worth the visit for the scenery.")
    ]

    var body: some View {
        NavigationView {
            HStack (alignment: .top){
                Button(action: {
                    
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.mint)
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.leading, 14)
                .padding(.top, 16)
                locationDetailsPanel()
                    .frame(width: 600)
                Divider()
                reviewsPanel()
                    .frame(maxWidth: .infinity)
            }
            .padding(.vertical, 24)
        }
    }

    @ViewBuilder
    private func locationDetailsPanel() -> some View {
        ScrollView {
            VStack(alignment: .leading) {
                locationHeader(imageName: imageName)
                locationDetails(locationName: locationName, mainAttraction: mainAttraction, description: description, rating: rating)
            }
            .padding()
        }
    }

    @ViewBuilder
    private func reviewsPanel() -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text("Apa kata mereka?")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 8)
                    .padding(.horizontal)
                    .foregroundColor(.mint)
                ForEach(reviews, id: \.username) { review in
                    userReview(username: review.username, comment: review.comment)
                        .padding(.horizontal)
                        .padding(.top, 8)
                }
            }
        }
    }

    @ViewBuilder
    private func locationHeader(imageName: String) -> some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity, maxHeight: 400)
            .clipped()
    }

    @ViewBuilder
    private func locationDetails(locationName: String, mainAttraction: String, description: String, rating: Double) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            locationHeaderDetails(locationName: locationName)
            Text(mainAttraction)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("“\(description)”")
                .font(.title3)
                .foregroundColor(.secondary)
            ratingView(rating: rating)
        }
    }

    @ViewBuilder
    private func locationHeaderDetails(locationName: String) -> some View {
        HStack {
            Image(systemName: "location")
                .foregroundColor(.mint)
                .font(.system(size: 20))
            Text(locationName)
                .fontWeight(.regular)
                .foregroundStyle(.mint)
                .font(.system(size: 20))
        }
        .padding(.top, 2)
    }

    @ViewBuilder
    private func ratingView(rating: Double) -> some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Text("\(rating, specifier: "%.1f")")
                .fontWeight(.bold)
                .font(.system(size: 16))
        }
    }

    @ViewBuilder
    private func userReview(username: String, comment: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 40))
                VStack(alignment: .leading) {
                    Text(username)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(comment)
                        .font(.body)
                }
            }
            Divider()
        }
    }
}

struct MacPopularLocationPreview: PreviewProvider {
    static var previews: some View {
        MacPopularLocationView()
    }
}
