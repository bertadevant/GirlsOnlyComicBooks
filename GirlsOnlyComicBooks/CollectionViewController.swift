//
//  FirstViewController.swift
//  GirlsOnlyComicBooks
//
//  Created by Berta Devant on 4/29/17.
//  Copyright © 2017 bdp. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources


class CollectionViewController: UIViewController {
    
    private let collectionVM = CollectionViewModel()
    //data source for the collectionView
    private let dataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<String, Pokemon>>()
    /// dispose bag for the observable
    private let disposeBag = DisposeBag()
    //each Parent VC will change this Bool; it helps us decide which cell style to show
    var showImageCell = false
    //we will pass the pokemon type from the prvious controller. If it nil it means we show the Top 25
    var pokemonTypeToShow: Type?
    @IBOutlet weak var collectionView: UICollectionView!
    var pokemonToShow: Pokemon?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionVM.findURLPokemonToShow(pokemonType: pokemonTypeToShow)
        rx_BindCollectionToObjects()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
//MARK: RxSwift bindings
    
    func rx_BindCollectionToObjects() {
        
        
        //collectionView register Cell with Nib
        collectionView.register(UINib(nibName: NibNames.CollectionCell, bundle: nil), forCellWithReuseIdentifier: ReuseID.collectionCell)
        
        //we set the dataSource cell configuration
        dataSource.configureCell = { ds, collectionView, indexPath, item in
            
            if let cell : PokemonCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: ReuseID.collectionCell, for: indexPath) as? PokemonCollectionViewCell) {
                cell.setUpUIElements(pokemon: item)
                return cell
            }
            return collectionView.dequeueReusableCell(withReuseIdentifier: ReuseID.collectionCell, for: indexPath) as! PokemonCollectionViewCell
        }
        
        let results = collectionVM.currentPokemon.asObservable()
        
        results
            //Bind the result observable to the UIcollectionView
            .map { [SectionModel(model: "", items: $0)] }
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .addDisposableTo(disposeBag)
        
        collectionView.rx.setDelegate(self)
            .addDisposableTo(disposeBag)

        collectionView.rx.itemSelected.subscribe(
            onNext: { [unowned self] indexPath in
                //show Full Details of the selected pokemon
                let selectedPokemon = self.dataSource[indexPath.section].items[indexPath.row]
                self.pokemonToShow = selectedPokemon
                self.performSegue(withIdentifier: Segues.showFullDetails, sender: self)
                
        })
        .addDisposableTo(disposeBag)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //we prepare for segue to pass on
        if segue.identifier == Segues.showFullDetails {
            let detailVC = segue.destination as? ResultDetailViewController
            detailVC?.pokemonToShow = pokemonToShow
        }
    }
}

extension CollectionViewController: UIScrollViewDelegate {
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var heightOfColums: CGFloat = 0
        var widthOfColums: CGFloat = self.view.bounds.width/2-12.0
        let marginsInsets: CGFloat = 12
        //self.view.bounds.width < self.view.bounds.height  == portrait mode
        
        switch self.traitCollection.horizontalSizeClass {
        //iphone == compact width on portrait and compact height on landscape
        case .compact:
            //tableRow almost look for iphone
            widthOfColums = self.view.bounds.width
            heightOfColums = (widthOfColums * 0.35)
        case .regular:
            //2 columns for Ipad
            widthOfColums = self.view.bounds.width/2 - marginsInsets
            heightOfColums = (widthOfColums * 0.35)
        default:
            break
        }
        //        return (self.view.bounds.width < self.view.bounds.height) ? CGSize(width: widthOfColums , height: heightOfColums) : CGSize(width: self.view.bounds.width/(numberOfColumns+1)-12.0, height: 100.0)
        return CGSize(width: widthOfColums , height: heightOfColums)
    }
}
