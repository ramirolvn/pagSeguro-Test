import XCTest
import RxSwift
import RxNimble
import Nimble

@testable import HackerRank

// MARK: tests fake data
let fakeBeer:Beer = Beer(id: 0, name: "FakeBeer", tagline: "Beer to Test", first_brewed: "IDK", description: "Its the best beer in the wrold", image_url: "https://www.thebeijinger.com/files/u72781/fakebeer-01.jpg", abv: 4.0, ibu: 5.3)
let fakeDataProvider:DataProvider = FakeDataProvider(fakeBeers: [fakeBeer])

class BeerViewModelTest: XCTestCase {
    
    // MARK: Test subject
    var viewModel: BeerViewModel?
    
    
    func testBeerInformations() {
        self.viewModel = BeerViewModel(dataProvider: fakeDataProvider)
        expect(self.viewModel?.name(0)).first == fakeBeer.name
        expect(self.viewModel?.imageURL(0)).first  == fakeBeer.image_url
        expect(self.viewModel?.tagLine(0)).first  == fakeBeer.tagline
    }
    
    func testArrayCount(){
        self.viewModel = BeerViewModel(dataProvider: fakeDataProvider)
        _ = self.viewModel?.beers().map({
            beers in
            XCTAssertEqual(beers.count, 1)
        })
    }
    
}
