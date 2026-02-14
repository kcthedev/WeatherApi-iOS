import SwiftUI

struct CityView: View {
    let cityDetails: CityDetails
    
    init(_ cityDetails: CityDetails) {
        self.cityDetails = cityDetails
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(cityDetails.name)
                Text(cityDetails.weather)
            }
            Spacer()
            Text("\(cityDetails.temperature) F")
        }
    }
}

//#Preview {
//    CityView(.losAngeles)
//}
