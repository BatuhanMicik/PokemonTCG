//
//  CardsTableViewCell.swift
//  PokemonTCG
//
//  Created by Batuhan Mıcık on 7.08.2021.
//

import UIKit

class CardsTableViewCellViewModel{
    let names : String
    //let health : Int?
    let imgURL : URL?
    var imgdata : Data? = nil
    
    init(imgURL : URL?, names : String) {
        //self.health = health
        self.imgURL = imgURL
        self.names = names
       
    }
    
    
    
}

class CardsTableViewCell: UITableViewCell {

    static let identifier = "CardsTableViewCell"
     
     private let nameLabel: UILabel = {
         let label = UILabel()
         label.numberOfLines = 0
         label.font = .systemFont(ofSize: 25, weight: .medium)
         return label
     }()
    
    private let cardsView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGreen
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardsView)
        contentView.addSubview(nameLabel)
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.frame = CGRect(x: 10, y: 0, width: contentView.frame.size.width-120, height: contentView.frame.height/2)
        
        cardsView.frame = CGRect(x: contentView.frame.size.width-200, y: 5, width: 300, height: contentView.frame.height-10)
    }
    
    func configure(with viewModel : CardsTableViewCellViewModel){
        nameLabel.text = viewModel.names
        
        if let data = viewModel.imgdata{
            cardsView.image = UIImage(data: data)
        }else if let url = viewModel.imgURL{
            URLSession.shared.dataTask(with: url) { [weak self]data, _, error in
                guard let data = data,error == nil else{
                    return
                }
                viewModel.imgdata = data
                DispatchQueue.main.async {
                    self?.cardsView.image = UIImage(data: data)
                }
            }.resume()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
