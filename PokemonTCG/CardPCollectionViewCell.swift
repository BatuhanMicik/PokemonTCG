//
//  CardsCollectionViewCell.swift
//  PokemonTCG
//
//  Created by Batuhan Mıcık on 8.08.2021.
//

import UIKit

class CardPCollectionViewCellViewModel{
    let imgUrl : URL?
    let names : String
    var imgData : Data? = nil
    
    init(imgUrl : URL?, names : String){
        self.imgUrl = imgUrl
        self.names = names
        
    }

}

class CardPCollectionViewCell: UICollectionViewCell {
    
    
    
    
    private var cards = [Card]()
    private var viewModels = [CardPCollectionViewCellViewModel]()
    

    
    static let identifier = "CardPCollecitonViewCell"
    
    
 
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth
        
        return label
    }()

    private let cardsView : UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    func configure(with viewModel : CardPCollectionViewCellViewModel){
        nameLabel.text = viewModel.names
        
        if let data = viewModel.imgData{
            cardsView.image = UIImage(data: data)
        }else if let url = viewModel.imgUrl{
            URLSession.shared.dataTask(with: url) { [weak self]data, _, error in
                guard let data = data,error == nil else{
                    return
                }
                viewModel.imgData = data
                DispatchQueue.main.async {
                    self?.cardsView.image = UIImage(data: data)
                }
            }.resume()
        }
    }

}

