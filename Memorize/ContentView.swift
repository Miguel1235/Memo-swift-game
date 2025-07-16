import SwiftUI

struct ContentView: View
{
    @State private var cardCount = 4
    let emojis = ["👻", "🎃","💀", "🕷️", "👹", "😈"]
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(0..<cardCount, id: \.self) {
                    CardView(content: emojis[$0])
                }
            }
            Spacer()
            HStack {
                CardCountAdjuster(by: 1, symbol: "plus")
                CardCountAdjuster(by: -1, symbol: "minus")
            }
            .padding()
        }
        
    }
    
    func CardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button {
            cardCount += offset
        } label: {
            Image(systemName: symbol)
        }
        .buttonBorderShape(.circle)
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)

    }
}



struct CardView: View {
    var content: String
    @State var isFaceUp = Bool.random()
    
    var body: some View {
        ZStack {
            let rectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                rectangle.fill(.background)
                rectangle.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            } else {
                rectangle            }
        }
        .frame(minHeight: 50)
        .foregroundStyle(.orange)
        .imageScale(.small)
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
