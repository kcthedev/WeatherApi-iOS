import SwiftUI

struct CityDetailsView: View {
    let details: CityDetails
    
    init(_ details: CityDetails) {
        self.details = details
    }
    
    var body: some View {
        Text("Hello world")
            .navigationTitle(details.name)
    }
}
