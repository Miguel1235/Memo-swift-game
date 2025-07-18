import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        @StateObject var viewModel = EmojiMemoViewModel()
        
        WindowGroup {
            EmojiMemoryGameView(viewModel: viewModel)
        }
    }
}
