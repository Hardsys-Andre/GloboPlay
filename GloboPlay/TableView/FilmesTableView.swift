//
//  FilmesTableView.swift
//  GloboPlay
//
//  Created by user226298 on 8/31/22.
//

import UIKit
/*responseString    String    "{\"adult\":false,\"backdrop_path\":\"/c6OLXfKAk5BKeR6broC8pYiCquX.jpg\",\"belongs_to_collection\":null,\"budget\":63000000,\"genres\":[{\"id\":18,\"name\":\"Drama\"},{\"id\":53,\"name\":\"Thriller\"},{\"id\":35,\"name\":\"Comedy\"}],\"homepage\":\"http://www.foxmovies.com/movies/fight-club\",\"id\":550,\"imdb_id\":\"tt0137523\",\"original_language\":\"en\",\"original_title\":\"Fight Club\",\"overview\":\"A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \\\"fight clubs\\\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.\",\"popularity\":110.026,\"poster_path\":\"/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg\",\"production_companies\":[{\"id\":508,\"logo_path\":\"/7cxRWzi4LsVm4Utfpr1hfARNurT.png\",\"name\":\"Regency Enterprises\",\"origin_country\":\"US\"},{\"id\":711,\"logo_path\":\"/tEiIH5QesdheJmDAqQwvtN60727.png\",\"name\":\"Fox 2000 Pictures\",\"origin_country\":\"US\"},{\"id\":4700,\"logo_path\":\"/A32wmjrs9Psf4zw0uaixF0GXfxq.png\","... */
struct Post: Codable{
    let adult: String
    let backdrop_path: String
    let id: Int
    let name: String
}

class FilmesTableView: UIViewController{
    
    lazy var topoImageView:UIImageView = {
    let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage.init(named: "gTopo")
        
        return image
        
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.topoImageView)
        self.configconstraints()
        //self.view.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        self.title = "GloboPlay"
        makeRequest {(posts) in
            print("object post: \(posts[0].name)")
        }
    }
    	
    private func makeRequest(completion: @escaping([Post])-> ()){
        
        let url = URL(string:"https://api.themoviedb.org/3/movie/550?api_key=f4dd3c63eb8cb8320978e887a668b922")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            //print("response: \(String(describing: response))")
           // print("error: \(String(describing: error))")
            
           guard let responseData = data else { return }
            
            do{
                let posts = try JSONDecoder().decode([Post].self, from: responseData)
                //print("object post: \(posts)")
                completion(posts)
            } catch let error{
                print("error: \(error)")
            }
           /* }
           if let responseString = String(data: responseData, encoding: .utf8)
          {
                print(responseString)
          }*/
            
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        cell?.configure()
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
