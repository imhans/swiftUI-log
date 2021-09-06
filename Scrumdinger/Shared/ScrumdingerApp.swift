
import SwiftUI

@main
struct ScrumdingerApp: App {
    @ObservedObject private var data = ScrumData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $data.scrums) {
                    data.save()
                }
            }
            //The method below prevents the error: "displayModeButtonItem is internally managed" for building iPhone App
            .navigationViewStyle(StackNavigationViewStyle())
            .onAppear {
                data.load()
            }
        }
    }
}
