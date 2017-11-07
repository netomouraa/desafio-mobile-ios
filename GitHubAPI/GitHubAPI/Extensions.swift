//
//  Extensions.swift
//  GitHubAPI
//
//  Created by Neto Moura on 06/11/2017.
//  Copyright © 2017 Neto Moura. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    public func maskCircle(inputImage: UIImage) {
        self.contentMode = UIViewContentMode.scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        
        self.image = inputImage
    }
}

//extension Date {
//
//    func interval(ofComponent comp: Calendar.Component, fromDate date: Date) -> Int {
//
//        let currentCalendar = Calendar.current
//
//        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: date) else { return 0 }
//        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: self) else { return 0 }
//
//        return end - start
//    }
//}

extension UILabel {
    
    func addImageWith(name: String, behindText: Bool) {
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: name)
        let attachmentString = NSAttributedString(attachment: attachment)
        
        guard let txt = self.text else {
            return
        }
        
        if behindText {
            let strLabelText = NSMutableAttributedString(string: txt)
            strLabelText.append(attachmentString)
            self.attributedText = strLabelText
        } else {
            let strLabelText = NSAttributedString(string: txt)
            let mutableAttachmentString = NSMutableAttributedString(attributedString: attachmentString)
            mutableAttachmentString.append(strLabelText)
            self.attributedText = mutableAttachmentString
        }
    }
    
    func removeImage() {
        let text = self.text
        self.attributedText = nil
        self.text = text
    }
}
