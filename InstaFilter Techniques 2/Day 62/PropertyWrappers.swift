// PropertyWrappers.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/how-property-wrappers-become-structs

// MARK: - LIBRARIES -

import SwiftUI



struct PropertyWrappers: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var blurAmount: CGFloat = 0.00 {
      didSet {
         print("The bluramount has been changed to \(blurAmount).")
      }
   }
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      VStack {
         Text("Hello, World!")
            .font(.title)
            .blur(radius: blurAmount)
         Slider(value: $blurAmount,
                in: 0...10)
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
