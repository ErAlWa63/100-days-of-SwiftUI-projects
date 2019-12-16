//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Erik Waterham on 16/12/2019.
//  Copyright © 2019 Erik Waterham. All rights reserved.
//

import SwiftUI
import Foundation

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
}
