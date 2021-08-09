import Foundation
import UIKit

class FoodDetailViewController: UIViewController {
    
    let dummyAllergen = ["Soy", "Mustard", "Hot sauce", "Other","Soy1", "Mustard1", "Hot sauce1", "Other1"]
    let allergenSelect = [true, false, false, false ,true, false, false, false]
    private let shadowOffset = CGSize(width: 4, height: 4)
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Description"
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private let numberTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Amount"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let numberStepper = SmoothStepper(frame: CGRect(x: 0, y: 0, width: 150, height: 35))
    private let allergenTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Allergen"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let allergensCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        return UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    }()
    
    private let purchaseButton: ChipButton =  {
        let chip = ChipButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        chip.deselectedColor = UIColor.black.cgColor
        chip.setTitle("Add", for: .normal)
        chip.deselectedColor = UIColor.black.cgColor
        chip.layer.backgroundColor = UIColor.black.cgColor
        return chip
    }()
    
    private let reviewView = FoodReviewView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let foodItem: FoodItem
    
    init(foodItem: FoodItem) {
        self.foodItem = foodItem
        super.init(nibName: nil, bundle: nil)
        reviewView.loadFood(foodItem)
        descriptionLabel.text = "Mo ta"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        view.backgroundColor = .white
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.frame = view.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor(red:158.0/255.0, green:203.0/255.0, blue:244.0/255.0, alpha:1.0).cgColor]
        view.layer.insertSublayer(gradient, at: 0)
        setupNavigationBar()
        
        // layout
        reviewView.snp.makeConstraints { (make) in
            make.height.equalTo(250)
        }
        let scrollView = UIScrollView(frame: view.bounds)
        view.addSubview(scrollView)
        let stackview = UIStackView()
        
        stackview.axis = .vertical
        stackview.distribution = .fill
        stackview.alignment = .leading
        stackview.spacing = 10
        stackview.addArrangedSubview(reviewView)
        stackview.addArrangedSubview(descriptionTitleLabel)
        stackview.addArrangedSubview(descriptionLabel)
        stackview.addArrangedSubview(numberTitleLabel)
        numberStepper.primeColor = .black
        numberStepper.layer.shadowRadius = 10
        numberStepper.layer.shadowOffset = shadowOffset
        numberStepper.layer.shadowOpacity = 0.2
        numberStepper.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(35)
        }
        
        stackview.addArrangedSubview(numberStepper)
        stackview.addArrangedSubview(allergenTitleLabel)
       
        allergensCollectionView.register(AllergenTableViewCell.self, forCellWithReuseIdentifier: "allergenCell")
       
        stackview.addArrangedSubview(allergensCollectionView)
        allergensCollectionView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(70)
        }
        
        allergensCollectionView.backgroundColor = .clear
        allergensCollectionView.dataSource = self
        allergensCollectionView.delegate = self
        allergensCollectionView.showsHorizontalScrollIndicator = false
        stackview.addArrangedSubview(purchaseButton)
        purchaseButton.layer.cornerRadius = purchaseButton.frame.height/2
        purchaseButton.layer.shadowOpacity = 0.7
        purchaseButton.layer.shadowOffset = shadowOffset
        purchaseButton.layer.shadowRadius = 10
        purchaseButton.setTitle("Add", for: .normal)
        purchaseButton.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        scrollView.addSubview(stackview)
        stackview.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        stackview.isLayoutMarginsRelativeArrangement = true
        stackview.snp.makeConstraints { (make) in
            make.width.equalTo(view.bounds.width)
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        // custom back btn
    }
}

extension FoodDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dummyAllergen.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "allergenCell", for: indexPath) as! AllergenTableViewCell
        print(indexPath.row)
        cell.configureWith(dummyAllergen[indexPath.row], isSelected: allergenSelect[indexPath.row])
        return cell
    }
}
extension FoodDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 45)
    }
}
