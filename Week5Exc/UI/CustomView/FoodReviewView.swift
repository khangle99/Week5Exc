import Foundation
import UIKit
import SnapKit
import Cosmos

class FoodReviewView: UIView {
    
    private let cornerRad = CGFloat(20)
    let nameLabel = UILabel()
    var kindChip: ChipButton = {
        let chip =  ChipButton(frame: CGRect(x: 0, y: 0, width: 70, height: 50))
        chip.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        chip.deselectedColor = UIColor.brown.cgColor
        chip.selectedColor = UIColor.brown.cgColor
        return chip
    }()
    
    let numberOfRatingLabel = UILabel()
    let reviewPhotoImageView: UIImageView!
    let ratingView: CosmosView = {
        let cosmostView = CosmosView()
        cosmostView.settings.starSize = 14
        cosmostView.settings.updateOnTouch = false
        return cosmostView
    }()
    
    let ratingLabel = UILabel()
    
    override init(frame: CGRect) {
        reviewPhotoImageView = UIImageView.rounded(size: .zero, cornerRadius: cornerRad)
        reviewPhotoImageView.contentMode = .scaleAspectFit
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
        setupLabels()
    }
    private func setupLabels() {
        numberOfRatingLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func loadFood(_ food: FoodItem) {
        nameLabel.text = food.name
        ratingLabel.text = "3.0"
        ratingView.rating = 3
        numberOfRatingLabel.text = "(\(121))"
        kindChip.setTitle("Other", for: .normal)
        kindChip.backgroundColor = .brown
        reviewPhotoImageView.loadFromUrl(urlString: food.avartarUrl)
    }
    
    private func setupUI() {
        layer.cornerRadius = cornerRad
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 10
        addSubview(reviewPhotoImageView)
        addSubview(ratingView)
        addSubview(kindChip)
        addSubview(nameLabel)
        addSubview(numberOfRatingLabel)
        addSubview(ratingLabel)
        
        kindChip.layer.shadowRadius = 4
        kindChip.layer.shadowOpacity = 0.2
        kindChip.layer.shadowOffset = CGSize(width: 10, height: 10)
        
        ratingLabel.textAlignment = .center
        ratingLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        ratingView.snp.makeConstraints { (make) in
            make.leading.equalTo(ratingLabel.snp.trailing).offset(24)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        numberOfRatingLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(ratingView.snp.trailing)
            make.bottom.equalToSuperview().offset(-12)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(ratingLabel.snp.top).offset(-8)
            make.leading.equalToSuperview().offset(24)
        }
        
        kindChip.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-8)
            make.top.equalToSuperview().offset(8)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        reviewPhotoImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
