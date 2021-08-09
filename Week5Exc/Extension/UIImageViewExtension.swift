import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    static func rounded(size: CGSize, cornerRadius: CGFloat)-> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 0.1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.frame.size = size
        imageView.layer.cornerRadius = cornerRadius
        imageView.clipsToBounds = true
        return imageView
    }
    
    func loadFromUrl(urlString: String) {
        let url = URL(string: urlString)
        let placeholder = UIImage(named: "image_placeholder")
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url,placeholder: placeholder)
    }
}
