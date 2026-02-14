import SwiftUI

@main
struct WeatherApiApp: App {
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView(homeViewModel: homeViewModel)
        }
    }
}
