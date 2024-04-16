//
//  SuperheroViewCell.swift
//  SuperHeros-iOS
//
//  Created by Mañanas on 12/4/24.
//

import UIKit

class SuperheroViewCell: UICollectionViewCell {
    
    var task: URLSessionDataTask? = nil

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func render(superhero: Superhero) {
        nameLabel.text = superhero.name
        imageView.image = UIImage(named: "image-placeholder")
        
        if (task != nil) {
            task?.cancel()
        }
        task = URLSession.shared.dataTask(with: URL(string: superhero.image.url)!) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        task?.resume()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.layer.cornerRadius = 16;
        cardView.layer.masksToBounds = true;
        shadowView.layer.cornerRadius = 16;
        shadowView.layer.masksToBounds = false;
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 2)
        shadowView.layer.shadowOpacity = 0.5
    }
    
    static func getNib() -> UINib {
        return UINib(nibName: "SuperheroViewCell", bundle: nil)
    }
    
}
