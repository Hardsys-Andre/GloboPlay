//
//  CustomCollectionViewCell.swift
//  GloboPlay
//
//  Created by user226298 on 8/30/22.
//

import UIKit

/*struct Cartaz: Decodable{
    let Poster: String
}*/

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier:String = "CustomCollectionViewCell"
    
    
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cartaz")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    //private var dataSource: Cartaz?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.imageView)
        self.configConstraints()
        
        /*makeRequest {(posts) in
            self.dataSource = posts
            print("object post: \(posts.Poster)")
        }*/
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   /* private func makeRequest(completion: @escaping(Cartaz)-> ()){
        
        let url = URL(string:"http://www.omdbapi.com/?i=tt3896198&apikey=ec21390b")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in

            
           guard let responseData = data else { return }
            
            do{
                let posts = try JSONDecoder().decode(Cartaz.self, from: responseData)

                completion(posts)
            } catch let error{
                print("error: \(error)")
            }
            
        }
        task.resume()
    }*/
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
