import Foundation
import UIKit

class AllergenTableViewCell: UICollectionViewCell {
    
    private let chip: ChipButton = {
        let chip = ChipButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        chip.setTitleColor(.black, for: .normal)
        chip.layer.backgroundColor = UIColor.white.cgColor
        chip.selectedColor = UIColor.brown.cgColor
        chip.deselectedColor = UIColor.white.cgColor
        chip.titleLabel?.textColor = .black
        chip.layer.shadowOpacity = 0.2
        chip.layer.shadowRadius = 5
        chip.layer.shadowOffset = CGSize(width: 4, height: 4)
        return chip
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutUI()
    }
    
    private func layoutUI() {
        contentView.addSubview(chip)
        chip.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func configureWith(_ allergen: String, isSelected: Bool) {
        chip.setTitle(allergen, for: .normal)
        chip.isSelected = isSelected
    }
}
