import UIKit
import SnapKit

class FoodListViewController: UIViewController {
    
    let foodList = FoodItem.getDummyData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupTitleBar()
        view.backgroundColor = .white
        let layout = UICollectionViewFlowLayout()
        let itemWidth = view.frame.width/2 - 20
        let itemHeight = 200
        layout.itemSize = CGSize(width: itemWidth, height: CGFloat(itemHeight))
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let foodCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(foodCollectionView)
        foodCollectionView.backgroundColor = .white
        foodCollectionView.snp.makeConstraints { (make) in
            if #available(iOS 11, *) {
                make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            } else {
                make.top.bottom.equalTo(view)
            }
            
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        foodCollectionView.register(FoodCollectionViewCell.self, forCellWithReuseIdentifier: "FoodCell")
        foodCollectionView.dataSource = self
        foodCollectionView.delegate = self
    }
    
    private func setupTitleBar() {
        title = "Fruits"
        let searchButton = UIBarButtonItem(systemItem: .search)
        searchButton.tintColor = .black
        navigationItem.rightBarButtonItem = searchButton
    }
}

extension FoodListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  foodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as! FoodCollectionViewCell
        cell.configureWith(foodList[indexPath.row])
        return cell
    }
}

extension FoodListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedFoodItem = foodList[indexPath.row]
        let detailFoodVC = FoodDetailViewController(foodItem: selectedFoodItem)
        navigationController?.pushViewController(detailFoodVC, animated: true)
    }
}
