import UIKit

import PhotosUI

class XPhotoPickerCoordinator: PHPickerViewControllerDelegate {

    private let parent: XPhotoPicker

    init(_ parent: XPhotoPicker) {
        self.parent = parent
    }

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        self.processPhotos(results)
        picker.dismiss(animated: true)
    }

    private func processPhotos(_ pickerResults: [PHPickerResult]) {
        if self.parent.singleSelection != nil {
            self.processSinglePhoto(pickerResults)
        } else {
            self.processMultiplePhotos(pickerResults)
        }
    }

}

extension XPhotoPickerCoordinator {

    private func processSinglePhoto(_ pickerResults: [PHPickerResult]) {
        guard let pickerResult = pickerResults.first else { return }
        pickerResult.itemProvider.loadObject(ofClass: UIImage.self) { image, _ in
            if let image = image as? UIImage {
                self.parent.singleSelection?.wrappedValue = image
            } else {
                self.parent.isErrorAlertPresented.wrappedValue = true
            }
        }
    }

    private func processMultiplePhotos(_ pickerResults: [PHPickerResult]) {
        var enumeratedSelection = [(Int, UIImage)]()
        var errorCount = 0

        pickerResults.enumerated().forEach { pickerResult in
            pickerResult.element.itemProvider.loadObject(ofClass: UIImage.self) { image, _ in
                if let image = image as? UIImage {
                    enumeratedSelection.append((pickerResult.offset, image))
                } else {
                    self.parent.isErrorAlertPresented.wrappedValue = true
                    errorCount += 1
                }
                if enumeratedSelection.count + errorCount == pickerResults.count {
                    self.parent.multipleSelection?.wrappedValue = enumeratedSelection
                        .sorted { $0.0 < $1.0 }
                        .map(\.1)
                }
            }
        }
    }

}
