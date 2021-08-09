import Foundation
import UIKit

extension UILabel {
    
    func strikeThroughText() {
       let attributeString =  NSMutableAttributedString(string: self.text ?? "")
       attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
       self.attributedText = attributeString
     }
}
