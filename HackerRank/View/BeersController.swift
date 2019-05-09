//
//  BeersController.swift
//  HackerRank
//
//  Created by Ramiro Lima Vale Neto on 08/05/19.
//  Copyright © 2019 saadeloulladi. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SDWebImage

class BeersController: UIViewController, UITableViewDelegate{
    @IBOutlet var beersTableView: UITableView!
    
    var viewModel: BeerViewModel?
    let disposeBag = DisposeBag()
    var beers = Variable([Beer]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.beers.asObservable().bind(to: self.beersTableView.rx.items(cellIdentifier: "BeerCell", cellType: BeerCell.self)) { row, beer, cell in
            cell.beerName.numberOfLines = 0
            cell.beerName.text = beer.name ?? "-"
            let beerAbv = beer.abv?.description
            cell.beerAlcoholContent.text = beerAbv != nil ? beerAbv!+" %" : "- %"
            cell.beerImage.sd_setImage(with: URL(string: beer.image_url ?? ""), placeholderImage: nil)
            
            }.disposed(by: self.disposeBag)
        self.beersTableView.delegate = self
        self.beersTableView.rowHeight = UITableViewAutomaticDimension
        self.beersTableView.estimatedRowHeight = 200
        self.viewModel = BeerViewModel(dataProvider: DataProvider())
        self.dataBinding()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedBeerCntrl = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "selectedBeer") as? SelectedBeerController{
            selectedBeerCntrl.beer = self.beers.value[indexPath.row]
            self.navigationController?.pushViewController(selectedBeerCntrl, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == beers.value.count-1{
            let nextPage = ((indexPath.row+1)/25)+1
            guard let viewModel = viewModel else {
                return
            }
            _ = viewModel.beersPagination(page: String(nextPage)).bind(onNext: {
                beers in
                self.beers.value += beers
            })
            
        }
    }
    
    
    private func dataBinding() {
        guard let viewModel = viewModel else {
            return
        }
        _ = viewModel.beers().bind(onNext: {
            beers in
            self.beers.value = beers
        })
    }
    
}
