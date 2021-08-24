// ContentView.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/wrapping-a-uiviewcontroller-in-a-swiftui-view

// MARK: - LIBRARIES -

import SwiftUI



struct ContentView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var image: Image?
   @State private var isShowingImagePicker: Bool = false
   /// To integrate our ImagePicker view into that
   /// we need to start by adding another `@State` image property
   /// that can be passed into the picker :
   @State private var uiImage: UIImage? // inputImage
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      VStack {
         image?
            .resizable()
            .scaledToFit()
         Button("Select Image") {
            isShowingImagePicker.toggle()
         }
         .sheet(isPresented: $isShowingImagePicker,
                onDismiss: loadImage) {
            ImagePicker(uiImage: $uiImage)
         }
      }
   }
   
   
   
   // MARK: - METHODS
   
   /// We need a method we can call when the uiImage property changes :
   func loadImage() {
      
      guard let _uiImage = uiImage
      else { return }
      
      image = Image(uiImage: _uiImage)
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
   }
}
