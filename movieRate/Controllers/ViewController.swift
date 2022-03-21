//
//  ViewController.swift
//  PrographyQuest
//
//  Created by 이범준 on 2022/02/07.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: VieController Variable
    var movies = [Movie]()
    var model = MovieModel()
    var nilMovieCell = [Movie]()
    
    var nilCellIndex = 0
    var minimum_rating = ""
    lazy var double_minimum_rating: Double = Double(minimum_rating)! ?? 0.0

    @IBOutlet weak var tableView: UITableView!
    
    func filterList() {
        movies.sort() { $0.rating! < $1.rating! }
    }
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        //MARK: UIActivityIndicatorView
        let activityIndicator = UIActivityIndicatorView()
                activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                activityIndicator.center = self.view.center
                activityIndicator.color = UIColor.red
                activityIndicator.hidesWhenStopped = true
                activityIndicator.stopAnimating()
                return activityIndicator }()
    
    
    override func viewDidLoad() {
        //MARK: viewDidLoad
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(self.activityIndicator)
        activityIndicator.startAnimating()
        tableView.delegate = self
        tableView.dataSource = self
        model.delegate = self
        model.getMovies()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var rowHeight:CGFloat = 0.0
        
        indexPath.row == nilCellIndex ? (rowHeight = 0.0): (rowHeight = 49.0)
        return rowHeight
    }
   
    @IBAction func close(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension ViewController: MovieModelProtocol {
    //MARK: MovieModelProtocol
    func moviesRetrieved(movies: [Movie]) {
        print("movies retrieved from movie model!")
        self.movies = movies
        filterList()
        tableView.reloadData()
        activityIndicator.stopAnimating() 
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: ViewController: UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = self.movies[indexPath.row]
        cell.displayMovieName(movie: movie, minimum_rating: double_minimum_rating)
        
        if cell.movieNameDisplay == nil {
            indexPath.row == indexPath.row ? (cell.isHidden = true): (cell.isHidden = false)
            nilCellIndex = indexPath.row
        } else {
            nilMovieCell = movies
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailShowMovie", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailShowMovie" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                vc?.name = nilMovieCell[index].title
                vc?.rate = nilMovieCell[index].rating
                vc?.imageUrl = nilMovieCell[index].small_cover_image
            }
        }
    }
}
