import SwiftUI

@main
struct NearbyChatApp: App {
    @StateObject private var session = MultipeerSession()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(session)
        }
    }
}
