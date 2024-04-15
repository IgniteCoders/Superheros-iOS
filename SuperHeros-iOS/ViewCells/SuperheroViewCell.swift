//
//  SuperheroViewCell.swift
//  SuperHeros-iOS
//
//  Created by Mañanas on 12/4/24.
//

import UIKit

class SuperheroViewCell: UICollectionViewCell {

    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func render(superhero: Superhero) {
        nameLabel.text = superhero.name
        imageView.image = UIImage(named: "image-placeholder")
        imageView.loadFrom(url: superhero.image.url)
        rootView.layer.cornerRadius = 16;
        rootView.layer.masksToBounds = true;
    }
    
    static func getNib() -> UINib {
        return UINib(nibName: "SuperheroViewCell", bundle: nil)
    }
    
}
