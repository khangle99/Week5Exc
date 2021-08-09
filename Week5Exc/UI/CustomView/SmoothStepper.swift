import Foundation
import UIKit
import SnapKit

class SmoothStepper: UIView {
    var counter = 0
    let countLabel: UILabel = UILabel()
  
    private var leftSemi: SemiChipButton!
    private var rightSemi: SemiChipButton!
    
    var primeColor: UIColor = UIColor.red {
        didSet {
            leftSemi.backgroundColor = primeColor
            rightSemi.backgroundColor = primeColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        leftSemi = SemiChipButton(frame: CGRect(x: 0, y: 0, width: bounds.height*3/2, height: bounds.height))
        leftSemi.setTitle("-", for: .normal)
        addSubview(leftSemi)
        rightSemi = SemiChipButton(frame: CGRect(x: frame.height*1.5 + 4, y: 0, width: (bounds.height*3)/2, height: bounds.height), shouldInvert: true)
        rightSemi.setTitle("+", for: .normal)
        addSubview(rightSemi)
        countLabel.textAlignment =  .center
        countLabel.text = "\(counter)"
        addSubview(countLabel)
        // layout
        leftSemi.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.bottom.top.equalToSuperview()
            make.width.equalTo(leftSemi.frame.width)
        }
        
        rightSemi.snp.makeConstraints { (make) in
            make.bottom.top.equalToSuperview()
            make.width.equalTo(rightSemi.frame.width)
            make.leading.equalTo(leftSemi.snp.trailing).offset(4)
        }
        
        countLabel.snp.makeConstraints { (make) in
            make.bottom.top.equalToSuperview()
            make.leading.equalTo(rightSemi.snp.trailing).offset(12)
        }
        
        backgroundColor = .white
        
        layer.cornerRadius = frame.height/2
        
        leftSemi.addTarget(self, action: #selector(minus(_sender:)), for: .touchUpInside)
        rightSemi.addTarget(self, action: #selector(plus(_sender:)), for: .touchUpInside)
    }
    
    @objc func minus(_sender: SemiChipButton) {
        if counter != 0 {
            counter -= 1
            countLabel.text = "\(counter)"
        }
    }
    
    @objc func plus(_sender: SemiChipButton) {
        counter += 1
        countLabel.text = "\(counter)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
