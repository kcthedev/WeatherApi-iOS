protocol CityData {
    var data: (name: String, lat: Double, lon: Double) { get }
}

enum City: CityData, Identifiable, CaseIterable {
    case losAngeles
    case newYork
    case sanFranciso
    case seattle

    var data: (name: String, lat: Double, lon: Double) {
        switch self {
        case .losAngeles: return ("Los Angeles", 34.05, 118.24)
        case .newYork: return ("New York", 40.77, 73.97)
        case .sanFranciso: return ("San Franciso", 37.47, 122.25)
        case .seattle: return ("Seattle", 47.61, 122.33)
        }
    }

    var id: String {
        self.data.name
    }

    // Convenience computed properties
    var friendlyName: String { data.name }
    var lat: Double { data.lat }
    var lon: Double { data.lon }
}
