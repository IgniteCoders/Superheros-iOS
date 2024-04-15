//
//  ListViewController.swift
//  SuperHeros-iOS
//
//  Created by Mañanas on 12/4/24.
//

import UIKit

class ListViewController:   UIViewController,
                            UICollectionViewDataSource,
                            UICollectionViewDelegate,
                            UICollectionViewDelegateFlowLayout,
                            UISearchBarDelegate/*,
                            UISearchControllerDelegate*/ {
    
    // MARK: Properties
    
    var superheroList: [Superhero] = []
    
    // MARK: IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Superheroes"
        collectionView.register(SuperheroViewCell.getNib(), forCellWithReuseIdentifier: "cell")
        
        SuperheroProvider.searchByName(query: "a", completionHandler: { [weak self] results in
            self?.superheroList = results
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        })
        
        let search = UISearchController(searchResultsController: nil)
        //search.delegate = self
        search.searchBar.delegate = self
        self.navigationItem.searchController = search
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        SuperheroProvider.searchByName(query: searchBar.text!, completionHandler: { [weak self] results in
            self?.superheroList = results
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        })
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        SuperheroProvider.searchByName(query: "a", completionHandler: { [weak self] results in
            self?.superheroList = results
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        })
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    // MARK: CollectionView DataSource & Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return superheroList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = superheroList[indexPath.row]
        
        let cell: SuperheroViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SuperheroViewCell
        
        cell.render(superhero: item)
        //cell.titleLabel.text = item.name
        //cell.subtitleLabel.text = item.dates
        //cell.signImageView.image = item.image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let columns = 2
        let screenWidth = collectionView.frame.width;
        let leftSpace = screenWidth - CGFloat(columns - 1) * (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing
        let cellWidth = leftSpace / CGFloat(columns);
        return CGSizeMake(cellWidth, cellWidth / 3 * 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        //Briefly fade the cell on selection
        UIView.animate(withDuration: 0.15, animations: {
            //Fade-out
            cell?.alpha = 0.5
        }) { (completed) in
            UIView.animate(withDuration: 0.15, animations: {
                //Fade-in
                cell?.alpha = 1
            })
        }
        
        let detailViewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detailViewController.superhero = superheroList[indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
