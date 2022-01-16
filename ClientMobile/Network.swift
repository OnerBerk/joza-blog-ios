//
//  network.swift
//  ClientMobile
//
//  Created by onAir on 15/01/2022.
//

import Foundation

class Network:ObservableObject{
@Published var posts = [Post]()

    func getPost(){
        guard let url=URL(string:"http://jozblog.local/wp-json/wp/v2/posts")else{fatalError("Missing URL") }

        let urlRequest = URLRequest(url:url)

        let dataTask=URLSession.shared.dataTask(with:urlRequest){(data,response,error)in
        if let error = error{
            print("Request error: ", error)
                       return
        }
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode==200{
                guard let data = data else{return}
                print(data)
                DispatchQueue.main.async {
                    do{
                        let decodedPosts = try JSONDecoder().decode([Post].self, from: data)
                        self.posts = decodedPosts
                    }
                    catch let error {print("Error decoding: ", error)}
                }
            }
        }

        dataTask.resume()
    }
}

