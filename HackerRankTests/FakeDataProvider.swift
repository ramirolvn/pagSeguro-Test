import UIKit
import RxSwift

@testable import HackerRank

class FakeDataProvider: DataProvider {
    
    private var fakeBeers:[Beer]
    
    // A new init method allowing to inject fake data
    init(fakeBeers: [Beer]) {
        self.fakeBeers = fakeBeers
    }
    
    // An overridden method to return fake data
    override func getBeers() -> Observable<[Beer]> {
        return Observable.just(self.fakeBeers)
    }
    
}
