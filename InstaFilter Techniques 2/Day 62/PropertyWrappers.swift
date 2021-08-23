// PropertyWrappers.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/how-property-wrappers-become-structs

// MARK: - LIBRARIES -

import SwiftUI



struct PropertyWrappers: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   /// We still use @State private var to declare the blurAmount property :
   @State private var blurAmount: CGFloat = 0.00 {
      didSet {
         print("The bluramount has been changed to \(blurAmount).")
      }
   }
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      let blur = Binding<CGFloat>(
         get: { self.blurAmount },
         set: {
            self.blurAmount = $0
            print("The new blur amount is \(blurAmount).")
         }
      )
      
      
      return VStack {
         Text("Hello, World!")
            .font(.title)
            /// We still use blur(radius: blurRadius) as the modifier for our text view :
            .blur(radius: blurAmount)
         // Slider(value: $blurAmount, in: 0...10)
         /// One thing that changed is the way we declare the binding in the slider:
         /// rather than using $blurAmount we can just use blur.
         /// This is because using the dollar sign is what gets us the two-way binding from some state,
         /// but now that we’ve created the binding directly we no longer need it :
         Slider(value: blur, in: 0...10)
            .padding()
      }
   }
}





// MARK: - PREVIEWS -

struct PropertyWrappers_Previews: PreviewProvider {
   
   static var previews: some View {
      
      PropertyWrappers()
   }
}
