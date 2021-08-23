// ImagePicker.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/wrapping-a-uiviewcontroller-in-a-swiftui-view

// MARK: - LIBRARIES -

import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
   
   // typealias UIViewControllerType = UIImagePickerController
   /// The `makeUIViewController` method is actually enough for Swift to figure out the view controller type
   /// so you can delete the typealias line .
   
   
   
   func makeUIViewController(context: Context)
   -> UIImagePickerController {
      
      let uiImagePickerController = UIImagePickerController()
      return uiImagePickerController
   }
   
   
   func updateUIViewController(_ uiViewController: UIImagePickerController,
                               context: Context) {}
}
