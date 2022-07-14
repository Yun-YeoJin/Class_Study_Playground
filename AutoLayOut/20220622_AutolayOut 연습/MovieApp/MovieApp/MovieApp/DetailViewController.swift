

import UIKit
import AVKit


class DetailViewController: UIViewController {

    var movieResult: MovieResult?
    
    var player: AVPlayer?
    
    @IBOutlet weak var movieContainer: UIView!
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleLabel.text = movieResult?.trackName
        descriptionLabel.text = movieResult?.longDescription
        
        //작업창에 해당되는 객체에 사이즈를 맞춘다. Device의 값을 가져오는 것이 아님.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let hasURL = movieResult?.previewUrl {
            makePlayerAndPlay(urlString: hasURL)
    }
    }
    
    func makePlayerAndPlay(urlString: String) {
        
        if let hasUrl = URL(string: urlString) {
        
            self.player = AVPlayer(url: hasUrl)
            let playerLayer = AVPlayerLayer(player: self.player)
            
            movieContainer.layer.addSublayer(playerLayer)
            
            playerLayer.frame = movieContainer.bounds
            
            self.player?.play()
            
     
    }
}
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func play(_ sender: Any) {
        self.player?.play()
    }
    @IBAction func stop(_ sender: Any) {
        self.player?.pause()

    }
}
