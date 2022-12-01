//
//  FilmesTableView.swift
//  GloboPlay
//
//  Created by user226298 on 8/31/22.
//

import UIKit

struct Post: Decodable{
    let adult: Bool
    let backdrop_path: String
    let id: Int
    let genres: [Genre]
}

struct Genre: Decodable{
    let id: Int
    let name: String
}

class FilmesTableView: UIViewController{
    
    lazy var topoImageView:UIImageView = {
    let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "gTopo")
        image.contentMode = .scaleAspectFit
        
        return image
        
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        return tableView
    }()
   
    private var dataSource: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.topoImageView)
        self.configconstraints()
        self.title = "GloboPlay"
        makeRequest {(posts) in
            self.dataSource = posts
            print("object post: \(posts.genres[0].name)")
        }
    }
    	
    private func makeRequest(completion: @escaping(Post)-> ()){
        
        let url = URL(string:"https://api.themoviedb.org/3/movie/550?api_key=f4dd3c63eb8cb8320978e887a668b922")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in

            
           guard let responseData = data else { return }
            
            do{
                let posts = try JSONDecoder().decode(Post.self, from: responseData)

                completion(posts)
            } catch let error{
                print("error: \(error)")
            }
            
        }
        task.resume()
    }
    
    private func configconstraints(){
        NSLayoutConstraint.activate([
            self.topoImageView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 50),
            self.topoImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.topoImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            self.topoImageView.heightAnchor.constraint(equalToConstant: 30),
            
            self.tableView.topAnchor.constraint(equalTo: topoImageView.bottomAnchor, constant: 25),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension FilmesTableView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.genres.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        cell?.configure(titulo: dataSource?.genres[indexPath.row].name ?? "Vazio")
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
