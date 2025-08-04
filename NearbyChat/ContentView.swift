import SwiftUI
import MultipeerConnectivity

struct ContentView: View {
    @EnvironmentObject var session: MultipeerSession
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0435 \u0443\u0441\u0442\u0440\u043e\u0439\u0441\u0442\u0432\u0430")) {
                  ForEach(session.foundPeers, id: \ .self) { peer in
                        Button(action: {
                            session.invite(peer)
                        }) {
                            Text(peer.displayName)
                        }
                    }
                }
                Section {
                    NavigationLink(
                        destination: ChatView().environmentObject(session),
                        isActive: Binding(
                            get: { session.connectedPeer != nil },
                            set: { _ in }
                        )
                    ) {
                        Text("\u041d\u0430\u0447\u0430\u0442\u044c \u0447\u0430\u0442")
                    }
                    .disabled(session.connectedPeer == nil)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("\u0420\u0430\u0434\u0430\u0440 \u0443\u0441\u0442\u0440\u043e\u0439\u0441\u0442\u0432")
        }
    }
}
