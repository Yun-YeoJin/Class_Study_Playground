
import UIKit

class ViewController: UIViewController {

    var movieModel: MovieModel?
    
    var term = ""
    
    var networkLayer = NetworkLayer()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.keyboardDismissMode = .onDrag
        searchBar.delegate = self
        
        requestMovieAPI()
    }
    
    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        networkLayer.request(type: .justURL(urlString: urlString)) { data, response, error in
            
            if let hasData = data {
            completion( UIImage(data: hasData) )
            return
        }
        //위의 구문이 안타고 내려올 수도 있기 때문에 completion(nil)
        completion(nil)
        }
    }
    
//                               ---  위의 구문과 똑같은 내용임  ---
    
//    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
//        let sessionConfig = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfig)
//
//        if let hasURL = URL(string: urlString) {
//            var request = URLRequest(url: hasURL)
//            request.httpMethod = "GET"
//
//            session.dataTask(with: request) { data, response, error in
//                print( (response as! HTTPURLResponse).statusCode)
//
//                if let hasData = data {
//                    completion( UIImage(data: hasData) )
//                    return
//                }
//            }.resume()
//            session.finishTasksAndInvalidate()
//        }
//
//        completion(nil)
//
//    }
    
    //network 호출
    
    func requestMovieAPI() {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        var components = URLComponents(string: "http://itunes.apple.com/search")
        
        let term = URLQueryItem(name: "term", value: term)
        let media = URLQueryItem(name: "media", value: "movie")
        
        components?.queryItems = [term, media]
        
        //"http://itunes.apple.com/search?term=marvel&media=movie"
    
        guard let url = components?.url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
       let task = session.dataTask(with: request) { data, response, error in
          print( (response as! HTTPURLResponse).statusCode )
           
           
           if let hasData = data{
               
               do {
                   self.movieModel = try JSONDecoder().decode(MovieModel.self, from: hasData)
                   
                   print(self.movieModel ?? "no data")
                   
                   DispatchQueue.main.async { // Main Thread에 넣어서 실행해준다.
                       self.movieTableView.reloadData()
                   }
                  
               } catch {
                   print(error)
               }
        }
       }
        
        task.resume()
        session.finishTasksAndInvalidate()
    }

}
 //delegate와 dataSource 연결하기.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieModel?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        
        detailVC.movieResult = self.movieModel?.results[indexPath.row]
        
       // detailVC.modalPresentationStyle = .fullScreen - 화면에 꽉 채우고 싶을 때
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    //영상 사이즈 자동설정
    func tableView(_ tableView: UITableView, heightForRowAt indexpath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell //강제로 타입캐스팅
        
        cell.titleLabel.text = self.movieModel?.results[indexPath.row].trackName //trackName을 뿌려준다.
        cell.descriptionLabel.text = self.movieModel?.results[indexPath.row].shortDescription
        
        let currency = self.movieModel?.results[indexPath.row].currency ?? ""
        let price = self.movieModel?.results[indexPath.row].trackPrice?.description ?? ""
                                                                        // String으로 바꿔줌
        cell.priceLabel.text = currency + price
      
        if let hasURL = self.movieModel?.results[indexPath.row].image {
            
            self.loadImage(urlString: hasURL) { image in
                DispatchQueue.main.async { //main Thread에서 사용해야함.
                cell.movieImageView.image = image
                    
                }
            }
        }
        
        // 날짜 설정하기
        if let dateString = self.movieModel?.results[indexPath.row].releaseDate {
            
            let formatter = ISO8601DateFormatter()
            if let isoDate = formatter.date(from: dateString) {
                
                let myFormatter = DateFormatter()
                myFormatter.dateFormat = "yyyy년 MM월 dd일"
                let dateString = myFormatter.string(from: isoDate)
                
                cell.dateLabel.text = dateString
            }
        }
            
        return cell
    
    }
    
    
}
// SearchBar 설정하기, term을 검색어로 하여 검색하는 방식,
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let hasText = searchBar.text else {
            return
        }
        term = hasText
        requestMovieAPI()
        self.view.endEditing(true) // Search버튼 클릭 후 키보드 내려가게 하기
    }
}
