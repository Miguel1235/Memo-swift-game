import SwiftUI

struct EmojiMemoryGameView: View
{
    @StateObject var viewModel: EmojiMemoViewModel
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 10) {
                    ForEach(viewModel.cards.indices, id: \.self) {
                        CardView(viewModel.cards[$0])
                            .aspectRatio(2/3, contentMode: .fit)
                            .padding(4)
                    }
                }
                .padding()
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
            .navigationTitle("Memo game")
        }
    }
}


struct CardView: View {
    let card: MemoModel<String>.Card
    
    init(_ card: MemoModel<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let rectangle = RoundedRectangle(cornerRadius: 12)
            if card.isFaceUp {
                rectangle.fill(.background)
                rectangle.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            } else {
                rectangle            }
        }
        .frame(minHeight: 50)
        .foregroundStyle(.orange)
        .imageScale(.small)
//        .onTapGesture {
//            isFaceUp.toggle()
//        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoViewModel())
}
