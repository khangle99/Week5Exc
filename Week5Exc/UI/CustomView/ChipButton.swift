import Foundation
import UIKit

class ChipButton: UIButton {
    var selectedColor: CGColor = UIColor.black.cgColor
    var deselectedColor: CGColor = UIColor.white.cgColor
    override var isSelected: Bool {
        didSet {
            layer.backgroundColor = isSelected ? selectedColor : deselectedColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.sizeToFit()
        layer.cornerRadius = frame.height/2
        layer.backgroundColor = deselectedColor
        addTarget(self, action: #selector(onPress(_:)), for: .touchUpInside)
    }
    
    @objc func onPress(_ sender: UIView) {
        isSelected.toggle()
        UIView.animate(withDuration: 0.1, animations:  {
            self.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        }, completion: { (isComplete) in
            UIView.animate(withDuration: 0.1) {
                self.transform = .identity
            }
        })
        self.layer.backgroundColor = isSelected ? selectedColor : deselectedColor
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
