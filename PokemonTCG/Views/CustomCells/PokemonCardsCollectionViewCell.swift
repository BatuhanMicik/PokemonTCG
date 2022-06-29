//
//  PokemonCardsCollectionViewCell.swift
//  PokemonTCG
//
//  Created by Batuhan Mıcık on 9.08.2021.
//

import UIKit
import Kingfisher

protocol ContainerViewDelegate {
    func cardClicked(selectedCard : PokemonElements)
    
    
}

class PokemonCardsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var cardView: UIImageView!
    @IBOutlet private weak var cardName: UILabel!
    private var card : UILabel!
    private var pokemonModel: PokemonElements?
    var delegate : ContainerViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayouts()
    }
    
    private func setLayouts() {
        cardView.layer.cornerRadius = 5
        cardView.clipsToBounds = true
        

    }
    
    func fillCardCell(cardElements: PokemonElements) {
        pokemonModel = cardElements
        let url = URL(string: String(cardElements.imageUrl ?? ""))
        cardName.text = cardElements.name
        cardView.kf.setImage(with: url, placeholder: UIImage(named: ""))
        
        let longPress = CustomUITab(target: self, action: #selector(clicked(sender:)))
        longPress.pokemons = cardElements
        self.addGestureRecognizer(longPress)
    }

    @objc func clicked(sender : CustomUITab) {
//      print(sender)
        self.delegate?.cardClicked(selectedCard: sender.pokemons!)
        
        // open vc
    }
    
}
class CustomUITab : UILongPressGestureRecognizer{
    var pokemons : PokemonElements?
}

