// ShowingMultipleOptions.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/showing-multiple-options-with-actionsheet

// MARK: - LIBRARIES -

import SwiftUI



struct ShowingMultipleOptions: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var isShowingActionSheet: Bool = false
   @State private var backgroundColor = Color.white
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      Text("Hello, World!")
         .font(.title)
         .frame(width: 300, height: 300)
         .foregroundColor(.black)
         .background(backgroundColor)
         .onTapGesture {
            isShowingActionSheet.toggle()
         }
         .actionSheet(isPresented: $isShowingActionSheet) {
            ActionSheet(title: Text("Set the background color of the text."),
                        message: Text("Message"),
                        buttons: [
                           ActionSheet.Button.default(Text("Red"), action: { backgroundColor = .red}),
                           ActionSheet.Button.default(Text("Blue"), action: { backgroundColor = .blue}),
                           ActionSheet.Button.default(Text("Yellow"), action: { backgroundColor = .yellow}),
                           ActionSheet.Button.cancel(Text("Cancel"))
                        ])
         }
   }
}





// MARK: - PREVIEWS -

struct ShowingMultipleOptions_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ShowingMultipleOptions()
         .preferredColorScheme(.dark)
   }
}
