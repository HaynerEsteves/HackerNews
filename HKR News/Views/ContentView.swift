//
//  ContentView.swift
//  HKR News
//
//  Created by Hayner Esteves on 27/09/23.
//

import SwiftUI



struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {//upper part; back button
            List(networkManager.stories, rowContent: { story in//sempre um array de alguma coisa, e vamos interar sobre o array
                NavigationLink(destination: DetailView(url: story.url)) {//arrow to next screen next view
                    HStack {
                        Text(story.stringPoints)
                        Text(story.title)
                    }
                }
            })
            .navigationTitle("HKR News")
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 struct Post: Identifiable {
 let id: String
 let title: String
 }
 
 let posts: [Post] = [
 Post(id: "1", title: "hello"),
 Post(id: "4", title: "there"),
 Post(id: "5", title: "sucker")
 ]
 */

