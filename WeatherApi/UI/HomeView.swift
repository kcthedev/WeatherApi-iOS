import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        List(homeViewModel.cities) { city in
            CityView(city)
        }
        .listStyle(.plain)
    }
}

#Preview {
    HomeView(homeViewModel: HomeViewModel())
}
