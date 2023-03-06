//
//  DetayView.swift
//  FilmAramaSwiftUI
//
//  Created by Hakan ERDOĞMUŞ on 6.03.2023.
//

import SwiftUI

struct DetayView: View {
    
    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {
        
        
        VStack(alignment: .leading , spacing: 5){
            HStack{
                Spacer()
            OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "")
                .frame(width: UIScreen.main.bounds.width * 0.6 , height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                Spacer()
            }
                
            Text(filmDetayViewModel.filmDetayi?.title ?? "Film ismi gösterilecek")
                .font(.title)
                .foregroundColor(.red)
                .bold()
                .padding()
            
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Film Plot Gösterilecek")
                .foregroundColor(.brown)
                .padding()
            
            Text("Yönetmen: \(filmDetayViewModel.filmDetayi?.director ?? "Film Yönetmeni Gösterilecek")")
                .foregroundColor(.cyan)
                .padding()
            
            Text("Yazar: \(filmDetayViewModel.filmDetayi?.writer ?? "Yazar Gösterilecek")")
                .foregroundColor(.black)
                .padding()
            
            Text("Ödüller: \(filmDetayViewModel.filmDetayi?.awards ?? "Ödüller Gösterilecek")")
                .foregroundColor(.orange)
                .padding()
            
            Text("Yıl: \(filmDetayViewModel.filmDetayi?.year ?? "Yıl Gösterilecek")")
                .foregroundColor(.teal)
                .padding()
                
            Spacer()
            
            
            
            
        }.onAppear(perform: {
            self.filmDetayViewModel.filmDetayiAl(imdbId: imdbId)
        })
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "test")
    }
}
