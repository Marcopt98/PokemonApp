import SwiftUI

struct SearchPokemonBar: View {
    @Binding var text: String
    @State var action: () -> Void
    
    var body: some View {
        ZStack {
            HStack {
                TextField("Search Pokemon", text: $text)
                    .padding([.leading, .trailing], 8)
                    .frame(height: 32)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(8)
                
                Button(
                    action: action,
                    label: { Text("Search") }
                )
            }
            .padding([.leading, .trailing], 16)
        }
        .frame(height: 64)
    }
}
