//
//  OzelImage.swift
//  FilmAramaSwiftUI
//
//  Created by Hakan ERDOĞMUŞ on 6.03.2023.
//

import SwiftUI

struct OzelImage: View {
    
    let url: String
    
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url: String) {
        self.url = url
        self.imageDownloaderClient.gorselIndir(url: self.url)
    }
    
    
    var body: some View {
       
        if let data = self.imageDownloaderClient.indirilenGorsel {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        } else {
            return Image("placeholder ")
                .resizable()
        }
    }
}

struct OzelImage_Previews: PreviewProvider {
    static var previews: some View {
        OzelImage(url: "https://m.media-amazon.com/images/M/MV5BMTM3NTg2NDQzOF5BMl5BanBnXkFtZTcwNjc2NzQzOQ@@._V1_SX300.jpg")
    }
}
