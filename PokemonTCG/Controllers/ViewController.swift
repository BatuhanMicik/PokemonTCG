//
//  ViewController.swift
//  PokemonTCG
//
//  Created by Batuhan Mıcık on 6.08.2021.
//

import UIKit

//protocol PokemonCollectionViewDelegate {
//    func selectedPokemonCard(selectedElement : PokemonElements)
//}

class ViewController: UIViewController {
    
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var pokemonData: [PokemonElements] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPokemonList(healthPoint : "99")
    }
    
    func selectedCard(selectedElement: PokemonElements) {
        openCardDetail(cardDetail: selectedElement)
    }
    
    func openCardDetail(cardDetail : PokemonElements) {
         let vc = CardViewController()
        vc.currentAvatar = cardDetail
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func getPokemonList(healthPoint: String) {
        RequestManager.fetchPokemons(hpValue: healthPoint) { (response) in
            DispatchQueue.main.async {
                self.pokemonData = response ?? []
                self.pokemonCollectionView.reloadData()
            }
        } failureBlock: { (error) in
            // show alert
        }
        
    }
    
    func setDelegates() {
        pokemonCollectionView.dataSource = self
        pokemonCollectionView.delegate = self
        pokemonCollectionView.register(UINib(nibName: "PokemonCardsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PokemonCardsCollectionViewCell")
        searchBar.delegate = self
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PokemonCardsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCardsCollectionViewCell", for: indexPath) as? PokemonCardsCollectionViewCell else { return UICollectionViewCell() }
        cell.fillCardCell(cardElements: (pokemonData[indexPath.row]))
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.frame.height - 40 ) / 2
        let width = (collectionView.frame.width - 24) / 2
        return CGSize(width: width, height: height )
    }
    
   func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
      print(indexPath.row)
      selectedCard(selectedElement: (pokemonData[indexPath.row]))
   }
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 1 {
            getPokemonList(healthPoint : searchText)
        }else{
            getPokemonList(healthPoint: "99")
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text.rangeOfCharacter(from: NSCharacterSet.decimalDigits) != nil {
            return true
        } else {
            return false
        }
    }
    
}


extension ViewController : ContainerViewDelegate {
    func cardClicked(selectedCard: PokemonElements) {
        self.selectedCard(selectedElement: selectedCard)
    }
}
