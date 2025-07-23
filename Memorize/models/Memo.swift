import Foundation

struct MemoModel<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCardsIndices = cards.indices.filter { cards[$0].isFaceUp }
            return faceUpCardsIndices.count == 1 ? faceUpCardsIndices[0] : nil
        }
        
        set {
            cards.indices.forEach { cards[$0].isFaceUp = $0 == newValue }
        }
    }
    
    mutating func choose(_ card: Card) {
        guard let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) else { return }
        
        if cards[chosenIndex].isFaceUp || cards[chosenIndex].isMatched { return }
        
        if let potentionMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
            if cards[chosenIndex].content == cards[potentionMatchIndex].content {
                cards[chosenIndex].isMatched = true
                cards[potentionMatchIndex].isMatched = true
            }
        } else {
            indexOfTheOneAndOnlyFaceUpCard = chosenIndex
        }
        cards[chosenIndex].isFaceUp = true
    }
    
    struct Card: Equatable, Identifiable, CustomStringConvertible {
        var id = UUID()
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var description: String {
            return "\(id): \(content) \(isFaceUp ? "👁️" : "🙈") \(isMatched ? "✅" : "🚫"))"
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
}
