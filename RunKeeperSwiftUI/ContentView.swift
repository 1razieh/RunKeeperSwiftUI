//
//  ContentView.swift
//  RunKeeperSwiftUI
//
//  Created by Razieh Halimi on 2022-10-21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DataLoaderViewModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
        ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    
                    ForEach(viewModel.medals) { medal in
//                    ForEach(viewModel.medalByCategory) { medal in
//                        Section(header: Text(medal.categoryType)){
                            
                        
                        VStack {
                            Image(medal.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 70)
                            Text(medal.title)
                            Text(medal.recordTime)
                                .foregroundColor(.gray)
                        }
                            
                       // }
                        .frame(width: 180, height: 180)
                    }
                    
                }   .onAppear { viewModel.getData() }
            }
            .navigationTitle("Achivement")
            .navigationBarTitleDisplayMode(.inline)
           
            


        }
      
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
