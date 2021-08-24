// ImagePicker.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/wrapping-a-uiviewcontroller-in-a-swiftui-view

// MARK: - LIBRARIES -

import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
   
   
   
   // typealias UIViewControllerType = UIImagePickerController
   /// The `makeUIViewController` method is actually enough for Swift to figure out the view controller type
   /// so you can delete the typealias line .
   
   // MARK: - NESTED TYPES
   
   class Coordinator: NSObject,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {
      
      /// Rather than just pass the data down one level ,
      /// a better idea is to tell the coordinator what its parent is ,
      /// so it can modify values there directly :
      var parent: ImagePicker
      
      
      init(_ parent: ImagePicker) { self.parent = parent }
      
      
      /// Reads the response from our `UIImagePickerController` :
      func imagePickerController(_ picker: UIImagePickerController,
                                 didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         /// Find the image that was selected :
         if let _uiImage = info[.originalImage] as? UIImage {
            /// `Notice` how we need the typecast for `UIImage`
            /// – that is because the dictionary we are provided
            /// holds all sorts of data types ,
            /// so we need to be careful .
            
            /// Assign it to our parent :
            parent.uiImage = _uiImage
         }
         
         /// Then dismiss the image picker :
         parent.presentationMode.wrappedValue.dismiss()
      }
   }
   
   
   
   // MARK: - PROPERTY WRAPPERS
   
   @Binding var uiImage: UIImage?
   @Environment(\.presentationMode) var presentationMode
   
   
   
   // MARK: - PROTOCOL METHODS
   
   func makeCoordinator()
   -> Coordinator {
      /// The `ImagePicker` is passed into the `Coordinator` :
      return Coordinator(self)
   }
   
   
   func makeUIViewController(context: Context)
   -> UIImagePickerController {
      
      let uiImagePickerController = UIImagePickerController()
      /// Tells the `UIImagePickerController` that when something happens
      /// it should tell our `coordinator `:
      uiImagePickerController.delegate = context.coordinator
      return uiImagePickerController
   }
   
   
   func updateUIViewController(_ uiViewController: UIImagePickerController,
                               context: Context) {}
}
