import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            List(homeViewModel.cities) { city in
                NavigationLink(value: city) {
                    CityView(city)
                }
            }
            .listStyle(.plain)
            .navigationDestination(for: CityDetails.self) { cityDetails in
                CityDetailsView(cityDetails)
            }
        }
    }
}

#Preview {
    HomeView(homeViewModel: HomeViewModel())
}
