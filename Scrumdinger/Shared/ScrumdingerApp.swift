
import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.data
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
            //The method below prevents the error: "displayModeButtonItem is internally managed" for building iPhone App
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
