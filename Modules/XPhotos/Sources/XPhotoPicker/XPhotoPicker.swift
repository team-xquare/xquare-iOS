import UIKit
import SwiftUI

import PhotosUI

struct XPhotoPicker: UIViewControllerRepresentable {

    var singleSelection: Binding<UIImage>?
    var multipleSelection: Binding<[UIImage]>?

    var isErrorAlertPresented: Binding<Bool>

    init(selection: Binding<UIImage>, isErrorAlertPresented: Binding<Bool>) {
        self.singleSelection = selection
        self.multipleSelection = nil
        self.isErrorAlertPresented = isErrorAlertPresented
    }

    init(selection: Binding<[UIImage]>, isErrorAlertPresented: Binding<Bool>) {
        self.singleSelection = nil
        self.multipleSelection = selection
        self.isErrorAlertPresented = isErrorAlertPresented
    }

    func makeCoordinator() -> XPhotoPickerCoordinator {
        XPhotoPickerCoordinator(self)
    }

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = singleSelection == nil ? 0 : 1
        configuration.filter = .images
        let photoPickerViewController = PHPickerViewController(configuration: configuration)
        photoPickerViewController.delegate = context.coordinator
        return photoPickerViewController
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }

}
