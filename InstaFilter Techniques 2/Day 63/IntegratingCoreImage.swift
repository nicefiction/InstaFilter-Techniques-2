// IntegratingCoreImage.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/integrating-core-image-with-swiftui
/**
 If we want to create images dynamically:
 apply Core Image filters,
 save them to the user’s photo library,
 and so on,
 then SwiftUI’s images aren’t up to the job.
 */

// MARK: - LIBRARIES -

import SwiftUI
/// STEP 3  Create a Core Image context and a Core Image filter :
import CoreImage
import CoreImage.CIFilterBuiltins



struct IntegratingCoreImage: View {
   
   // MARK: PROPERTY WRAPPERS
   
   @State private var image: Image?
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      VStack {
         image?
            .resizable()
            .scaledToFit()
      }
      .onAppear(perform: loadImage)
   }
   
   
   
   // MARK: - METHODS
   
   func loadImage() {
      
      // image = Image("napoli")
      
      /// STEP 1 Conerse our Image to UIImage :
      guard let _uiImage = UIImage(named: "napoli")
      else { return }
      
      /// STEP 2 Convert the UIImage into CIImage :
      /// in order to manipulate the image using Core Image
      let ciiImage = CIImage(image: _uiImage)
      /// STEP 4 Create the context and filter :
      let context = CIContext()
      let sepiaFilter = CIFilter.sepiaTone()
      let pixellateFilter = CIFilter.pixellate()
      let crystallizeFilter = CIFilter.crystallize()
      /// STEP 5 Customize our filter :
      sepiaFilter.inputImage = ciiImage
      sepiaFilter.intensity = 1
      pixellateFilter.scale = 100
      // crystallizeFilter.radius = 200 // 🐞 , instead use :
      crystallizeFilter.setValue(ciiImage,
                                 forKey: kCIInputImageKey)
      /// `NOTE`Although the newer API is much nicer to work with,
      /// we’ll mostly be using the older API in this project
      /// because it lets us work with any kind of filter.
      
      /// STEP 6 Convert the output from our filter to a SwiftUI Image that we can display in our view :
      /// STEP 6.1 Get a `CIImage` from our filter or exit if that fails :
      // guard let _ciiImage = sepiaFilter.outputImage
      guard let _ciiImage = crystallizeFilter.outputImage
      else { return }
      /// STEP 6.2 Attempt to get a `CGImage` from our `CIImage`:
      if let _cgImage = context.createCGImage(_ciiImage,
                                              from: _ciiImage.extent) {
         /// STEP 6.3 Convert that to a `UIImage`:
         let uiImage = UIImage(cgImage: _cgImage)
         /// STEP 6.4 Convert that to a SwiftUI image :
         image = Image(uiImage: uiImage)
      }
         
   }
}





// MARK: - PREVIEWS -

struct IntegratingCoreImage_Previews: PreviewProvider {
   
   static var previews: some View {
      
      IntegratingCoreImage()
         .preferredColorScheme(.dark)
   }
}
