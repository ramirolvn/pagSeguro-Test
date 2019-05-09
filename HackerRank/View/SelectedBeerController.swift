//
//  SelectedBeerController.swift
//  HackerRank
//
//  Created by Ramiro Lima Vale Neto on 09/05/19.
//  Copyright © 2019 saadeloulladi. All rights reserved.
//

import UIKit
import RxSwift
import SDWebImage

class SelectedBeerController: UIViewController {
    @IBOutlet weak var beerImg: SDAnimatedImageView!
    @IBOutlet weak var taglineValue: UILabel!
    @IBOutlet weak var abvValue: UILabel!
    @IBOutlet weak var ibuValue: UILabel!
    @IBOutlet weak var descriptionValue: UILabel!
    
    var beer: Beer!
    var viewModel: BeerViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInitialLayout()
    }
    
    private func setupInitialLayout() {
        self.navigationItem.title = self.beer.name ?? ""
        self.beerImg.sd_setImage(with: URL(string: beer.image_url ?? ""), placeholderImage: nil)
        self.taglineValue.text = beer.tagline ?? ""
        let beerAbv = beer.abv?.description
        self.abvValue.text = beerAbv != nil ? beerAbv!+" %" : "- %"
        let beerIbu = beer.abv?.description
        self.ibuValue.text = beerIbu != nil ? beerIbu!+" %" : "- %"
        self.descriptionValue.text = beer.description ?? ""
    }
    
}
