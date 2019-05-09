import UIKit
import RxSwift
import Alamofire

class DataProvider {
    private let beersUrl = "https://api.punkapi.com/v2/beers"
    
    let isLoadingVariable = Variable(false)
    
    func getBeers() -> Observable<[Beer]> {
        
        return Observable.create { observer -> Disposable in
            
            self.isLoadingVariable.value = true
            Alamofire.request(self.beersUrl,
                              method: .get,
                              parameters: nil)
                .validate()
                .responseJSON { response in
                    self.isLoadingVariable.value = false
                    guard response.result.isSuccess else {
                        print("Error while fetching remote beers: \(String(describing: response.result.error))")
                        return observer.onError(response.result.error!)
                    }
                    
                    guard let data = response.data else {
                        return observer.onError(response.result.error!)
                    }
                    
                    do{
                        let beers = try JSONDecoder().decode([Beer].self, from: data)
                        observer.onNext(beers)
                        observer.onCompleted()
                        
                    }catch{
                        
                    }
                    
            }
            return Disposables.create()
        }
    }
    
    func getBeersPagination(_ page: String) -> Observable<[Beer]> {
        
        return Observable.create { observer -> Disposable in
            
            self.isLoadingVariable.value = true
            Alamofire.request(self.beersUrl+"?page=\(page)",
                method: .get,
                parameters: nil)
                .validate()
                .responseJSON { response in
                    self.isLoadingVariable.value = false
                    guard response.result.isSuccess else {
                        print("Error while fetching remote beers: \(String(describing: response.result.error))")
                        return observer.onError(response.result.error!)
                    }
                    
                    guard let data = response.data else {
                        return observer.onError(response.result.error!)
                    }
                    
                    do{
                        let beers = try JSONDecoder().decode([Beer].self, from: data)
                        observer.onNext(beers)
                        observer.onCompleted()
                        
                    }catch{
                        
                    }
                    
            }
            return Disposables.create()
        }
    }
    
}
