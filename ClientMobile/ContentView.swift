//
//  ContentView.swift
//  ClientMobile
//
//  Created by onAir on 15/01/2022.
//

import SwiftUI



struct ContentView: View {
    @EnvironmentObject var network: Network

    var body: some View {
        ScrollView {
            Text("Tout les Articles")
                .font(.title)
                .bold()

            VStack(alignment: .leading) {
                ForEach(network.posts) { post in
                    HStack(alignment:.top) {
                        Text("\(post.id)")
                        Text("\(post.slug)")
                            .bold()
                        VStack(alignment: .leading) {
                        }
                    }
                    .frame(width: 300, alignment: .leading)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
                    .cornerRadius(20)
                }
            }

        }
        .padding(.vertical)
        .onAppear {
            network.getPost()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
