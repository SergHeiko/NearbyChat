import SwiftUI

struct ChatView: View {
    @EnvironmentObject var session: MultipeerSession
    @State private var message: String = ""
    
    var body: some View {
        VStack {
            List(session.messages, id: \.self) { msg in
                Text(msg)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .animation(.default, value: session.messages)
            HStack {
                TextField("\u0421\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u0435", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("\u041e\u0442\u043f\u0440\u0430\u0432\u0438\u0442\u044c") {
                    let trimmed = message.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard !trimmed.isEmpty else { return }
                    session.send(trimmed)
                    message = ""
                }
                .disabled(session.connectedPeer == nil)
            }
            .padding()
        }
        .navigationTitle(session.connectedPeer?.displayName ?? "\u0427\u0430\u0442")
        .navigationBarTitleDisplayMode(.inline)
    }
}
