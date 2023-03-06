//
//  FilmDetayViewModel.swift
//  FilmAramaSwiftUI
//
//  Created by Hakan ERDOĞMUŞ on 6.03.2023.
//

import Foundation
import SwiftUI

class FilmDetayViewModel : ObservableObject {
    
    @Published var filmDetayi : FilmDetayYapiViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func filmDetayiAl(imdbId : String) {
        downloaderClient.filmDetayIndir(imdbId: imdbId) { (sonuc) in
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case .success(let filmDetay):
                DispatchQueue.main.async {
                    self.filmDetayi = FilmDetayYapiViewModel(detay: filmDetay)
                }
                
            }
        }
    }
}

struct FilmDetayYapiViewModel {
    let detay : FilmDetay
    
    var title : String {
        detay.title
    }
    
    var poster : String {
        detay.poster
    }
    
    var year : String {
        detay.year
    }
    
    var imdbId : String {
        detay.imdbId
    }
    
    var director : String {
        detay.director
    }
    
    var writer : String {
        detay.writer
    }
    
    var awards : String {
        detay.awards
    }
    
    var plot : String {
        detay.plot
    }
}
