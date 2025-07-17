import SwiftUI

struct ContentView: View
{
    let emojis = ["👻", "🎃","💀", "🕷️", "👹", "😈"]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(emojis, id: \.self) {
                        CardView(content: $0)
                    }
                }
                .padding()
            }
            .navigationTitle("Memo game")
        }
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
