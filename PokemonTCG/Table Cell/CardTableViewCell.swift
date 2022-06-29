////
////  CardTableViewCell.swift
////  PokemonTCG
////
////  Created by Batuhan Mıcık on 7.08.2021.
////
//
//import UIKit
//
//// class CardTableViewCellViewModel{
////    let names : String
////    //let health : Int?
////    let imgURL : URL?
////    var imgdata : Data? = nil
////
////    init(imgURL : URL?, names : String) {
////        //self.health = health
////        self.imgURL = imgURL
////        self.names = names
////
////    }
////}
//class CardTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//
//
//    @IBOutlet var collectView : UICollectionView!
//
//    private var cards = [Card]()
//    private var viewModels = [CollectionViewCellViewModel]()
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        collectView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
//        collectView.delegate = self
//        collectView.dataSource = self
//
//        APICaller.shared.getURL { [weak self]result in
//            switch result{
//            case.success(let cards):
//                self?.cards = cards
//                self?.viewModels = cards.compactMap({
//                    CollectionViewCellViewModel(imgURL: URL(string: $0.imageUrl), names: $0.name)
//                })
//                DispatchQueue.main.async {
//                    self?.collectView.reloadData()
//                }
//            case.failure(let error):
//                print(error)
//            }
//        }
//    }
//
//
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//
//    }
//    static let identifier = "CardTableViewCell"
//
//
//    static func nib() -> UINib{
//        return UINib(nibName: "CardTableViewCell", bundle: nil)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return cards.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else{
//            fatalError()
//        }
//        cell.configure(with: viewModels[indexPath.row])
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 250, height: 250)
//    }
//
//    private let nameLabel: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 0
//        label.font = .systemFont(ofSize: 25, weight: .medium)
//        return label
//    }()
//
//    private let cardsView : UIImageView = {
//        let imageView = UIImageView()
//        imageView.clipsToBounds = true
//        imageView.backgroundColor = .systemGreen
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.addSubview(cardsView)
//        contentView.addSubview(nameLabel)
//
//    }
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        nameLabel.frame = CGRect(x: 10, y: 0, width: contentView.frame.size.width-120, height: contentView.frame.height/2)
//
//        cardsView.frame = CGRect(x: contentView.frame.size.width-200, y: 5, width: 300, height: contentView.frame.height-10)
//    }
//    override func prepareForReuse() {
//        super.prepareForReuse()
//    }
//
//
//
//
//}
