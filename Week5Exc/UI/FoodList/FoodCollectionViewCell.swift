import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel = UILabel()
    private let unitLabel = UILabel()
    private let currentPriceLabel = UILabel()
    private let priceLabel = UILabel()
    private let addCartButton = UIButton()
    private let avartarImageView = UIImageView.rounded(size: CGSize(width: 100, height: 100), cornerRadius: 0)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4))
        guard contentView.subviews.isEmpty else {
            return
        }
        setupCard()
        setupLabels()
        layoutUI()
    }
    
    private func setupCard() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        // border
        contentView.layer.borderWidth = 0.1
        contentView.layer.borderColor = UIColor.black.cgColor
        // shadow
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 3, height: 3)
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowRadius = 4.0
        // optimize performance
        contentView.layer.shouldRasterize = true
        contentView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    private func setupLabels() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        unitLabel.font = UIFont.systemFont(ofSize: 10)
        unitLabel.textColor = .gray
        
        currentPriceLabel.font = UIFont.systemFont(ofSize: 14)
        currentPriceLabel.textColor = .green
        
        priceLabel.font = UIFont.systemFont(ofSize: 10)
        priceLabel.textColor = .gray
        priceLabel.strikeThroughText()
    }
    
    private func layoutUI() {
        contentView.addSubview(avartarImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(unitLabel)
        contentView.addSubview(currentPriceLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(addCartButton)
        
        addCartButton.setImage(UIImage(named: "add_cart"), for: .normal)
        avartarImageView.contentMode = .scaleAspectFit
        
        avartarImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(frame.height/2)
        }

        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(avartarImageView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(8)
        }
        
        unitLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(8)
        }
        
        currentPriceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(unitLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(8)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(unitLabel.snp.bottom).offset(8)
            make.leading.equalTo(currentPriceLabel.snp.trailing).offset(8)
        }
        
        addCartButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-10)
            make.trailing.equalToSuperview().offset(-10)
            make.width.height.equalTo(40)
        }
    }
    
    func configureWith(_ foodItem: FoodItem) {
        titleLabel.text = foodItem.name
        unitLabel.text = foodItem.priceUnit.rawValue
        currentPriceLabel.text = "$\(foodItem.currentPrice)"
        priceLabel.text = "\(foodItem.price)"
        
        avartarImageView.loadFromUrl(urlString: foodItem.avartarUrl)
        layoutIfNeeded()
    }
}


