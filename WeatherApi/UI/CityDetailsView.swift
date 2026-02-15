import SwiftUI

struct CityDetailsView: View {
    let details: CityDetails
    
    init(_ details: CityDetails) {
        self.details = details
    }
    
    var isBackgroundDark: Bool {
        switch details.weather {
        case "Clear": true
        default: false
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(details.weather)
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size: 48))
            Text(details.weatherDescription)
                .frame(maxWidth: .infinity, alignment: .center)
            
            HStack {
                Text("Tempurature")
                Spacer()
                Text("\(details.temperature) F")
            }
            Divider()
            HStack {
                Text("Feels Like")
                Spacer()
                Text("\(details.feelsLike) F")
            }
            Spacer()
        }
        .background(background)
        .foregroundColor(isBackgroundDark ? .white : .black)
        .padding()
        .navigationTitle(details.name)
    }
    
    @ViewBuilder
    var background: some View {
        let resource = switch details.weather {
        case "Clear": "clear"
        default: "clouds"
        }
        Image(resource)
            .ignoresSafeArea()
    }
}
