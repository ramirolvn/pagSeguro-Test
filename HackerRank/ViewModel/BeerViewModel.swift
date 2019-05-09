import Foundation
import RxCocoa
import RxSwift

class BeerViewModel {
    
    private var BeerObservable:Observable<[Beer]>
    
    let isloadingObservable:Observable<Bool>
    
    init(dataProvider: DataProvider) {
        
        self.BeerObservable = dataProvider.getBeers()
        self.isloadingObservable = dataProvider.isLoadingVariable.asObservable().distinctUntilChanged()
    }
    
    func beers() -> Observable<[Beer]> {
        return BeerObservable.map({ Beers
            in
            return Beers
        }).observeOn(MainScheduler.instance)
    }
    
    func beersPagination(page: String) -> Observable<[Beer]> {
        let newBeers = DataProvider().getBeersPagination(page)
        return newBeers.map({ Beers
            in
            return Beers
        }).observeOn(MainScheduler.instance)
    }
    
    func name(_ index: Int) -> Observable<String> {
        
        return BeerObservable.map({ Beers -> String in
            return Beers[index].name ?? ""
        }).observeOn(MainScheduler.instance)
    }
    
    func imageURL(_ index: Int) -> Observable<String> {
        
        return BeerObservable.map({ Beers -> String in
            return Beers[index].image_url ?? ""
        }).observeOn(MainScheduler.instance)
    }
    
    func tagLine(_ index: Int) -> Observable<String> {
        
        return BeerObservable.map({ Beers -> String in
            return Beers[index].tagline ?? ""
        }).observeOn(MainScheduler.instance)
    }
}
