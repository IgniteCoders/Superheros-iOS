//
//  DetailViewController.swift
//  SuperHeros-iOS
//
//  Created by Mañanas on 12/4/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var superhero: Superhero? = nil

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var statsView: UIView!
    
    @IBOutlet weak var intelligenceProgressView: UIProgressView!
    @IBOutlet weak var durabilityProgressView: UIProgressView!
    @IBOutlet weak var powerProgressView: UIProgressView!
    @IBOutlet weak var strengthProgressView: UIProgressView!
    @IBOutlet weak var speedProgressView: UIProgressView!
    @IBOutlet weak var combatProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        cardView.layer.cornerRadius = 16;
        cardView.layer.masksToBounds = false;
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 3, height: 3)
        cardView.layer.shadowOpacity = 0.5
        
        nameLabel.layer.cornerRadius = 8;
        nameLabel.layer.masksToBounds = true;
        
        imageView.layer.cornerRadius = 8;
        imageView.layer.masksToBounds = true;
        imageView.layer.borderWidth = 5;
        imageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.25);
        
        statsView.layer.cornerRadius = 8;
        statsView.layer.masksToBounds = true;
        statsView.layer.borderWidth = 5;
        statsView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.25);
        
        self.navigationItem.title = superhero?.name
        nameLabel.text = superhero?.name
        numberLabel.text = "Nº: \(superhero?.id ?? "-")"
        publisherLabel.text = "-  \(superhero?.biography.publisher ?? "Publisher")  -"
        imageView.loadFrom(url: superhero!.image.url)
        
        intelligenceProgressView.progress = (Float((superhero?.powerstats.intelligence)!) ?? 0.0) / 100.0
        durabilityProgressView.progress = (Float((superhero?.powerstats.durability)!) ?? 0.0) / 100.0
        powerProgressView.progress = (Float((superhero?.powerstats.power)!) ?? 0.0) / 100.0
        strengthProgressView.progress = (Float((superhero?.powerstats.strength)!) ?? 0.0) / 100.0
        speedProgressView.progress = (Float((superhero?.powerstats.speed)!) ?? 0.0) / 100.0
        combatProgressView.progress = (Float((superhero?.powerstats.combat)!) ?? 0.0) / 100.0
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
