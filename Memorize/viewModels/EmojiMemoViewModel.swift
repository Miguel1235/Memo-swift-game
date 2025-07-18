import SwiftUI

class EmojiMemoViewModel: ObservableObject {
    private static let emojis = ["👻", "🎃","💀", "🕷️", "👹", "😈", "🍭", "🙀"]
    private static func createMemoGame() -> MemoModel<String> {
        MemoModel(numberOfPairsOfCards: 4) {
            emojis.indices.contains( $0 ) ?  emojis[$0] : "⁉️"
        }
    }
    
    @Published private var model = createMemoGame()
    
    // this is to protect the model from the view
    var cards: Array<MemoModel<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoModel<String>.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
