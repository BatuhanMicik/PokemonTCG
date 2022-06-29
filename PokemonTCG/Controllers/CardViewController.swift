//
//  CardViewController.swift
//  PokemonTCG
//
//  Created by Batuhan Mıcık on 11.08.2021.
//

import UIKit
import Kingfisher

class CardViewController: UIViewController {
    
    @IBOutlet weak var singleCardView: UIImageView!
    @IBOutlet weak var artistText: UILabel!
    @IBOutlet weak var cardNameText: UILabel!
    
    
    static let identifier = "CardViewController"

    var currentAvatar : PokemonElements?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillSingleCell(cardElements: currentAvatar!)
//        let url = URL(string: String(currentAvatar?.imageUrl ?? ""))
//        cardNameText.text = currentAvatar?.name
//        singleCardView.kf.setImage(with: url, placeholder: UIImage(named: ""))
//        artistText.text = currentAvatar?.artist

     
    }
    
    func fillSingleCell(cardElements: PokemonElements) {
       
        let url = URL(string: String(currentAvatar?.imageUrl ?? ""))
        cardNameText.text = currentAvatar?.name
        singleCardView.kf.setImage(with: url, placeholder: UIImage(named: ""))
        artistText.text = currentAvatar?.artist

    

}
}
