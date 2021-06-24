//
//  MainTableViewController.swift
//  Alamofire-BackendlessAPI-StarWarsAPI
//
//  Created by Abdulhalik 1 on 19.06.2021.
//

import UIKit
import Alamofire
//import SideMenu

class MainTableViewController: UITableViewController {
  @IBOutlet weak var searchBar: UISearchBar!
  //var menu: SideMenuNavigationController?
  
  var items:[Displayable] = []
  var films: [Film] = []
  var selectedItem: Displayable?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.hidesBackButton = true
    searchBar.delegate = self
    
    /*menu = SideMenuNavigationController(rootViewController: MenuListController())
    menu?.leftSide = true
    menu?.setNavigationBarHidden(true, animated: false)
    
    SideMenuManager.default.leftMenuNavigationController = menu
    SideMenuManager.default.addPanGestureToPresent(toView: self.view)*/
    
    fetchFilms()
  }
  
  @IBAction func didTapMenu() {
    //present(menu!, animated: true)
    let isLoggedIn = UserDefaults.standard.bool(forKey: UserPreferences.IS_LOGGED_IN)
    
    if isLoggedIn {
        UserDefaults.standard.set(false, forKey: UserPreferences.IS_LOGGED_IN)
        dismiss(animated: true, completion: nil)
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
    cell.textLabel?.text = items[indexPath.row].titleLabelText
    cell.detailTextLabel?.text = items[indexPath.row].subtitleLabelText
    return cell
  }
  
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    selectedItem = items[indexPath.row]
    return indexPath
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let destinationVC = segue.destination as? DetailViewController else {
      return
    }
    destinationVC.data = selectedItem
  }
}

// MARK: - UISearchBarDelegate
extension MainTableViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let shipName = searchBar.text else { return }
    searchStarships(for: shipName)
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.text = nil
    searchBar.resignFirstResponder()
    items = films
    tableView.reloadData()
  }
}

// MARK: - Fetch
extension MainTableViewController {
  func fetchFilms() {
    AF.request(FILMS_URL)
      .validate()
      .responseDecodable(of: Films.self) { (response) in
        guard let films = response.value else { return }
        self.films = films.all
        self.items = films.all
        self.tableView.reloadData()
      }
  }
  
  func searchStarships(for name: String) {
    let parameters: [String: String] = ["search": name]
    // 3
    AF.request(STARSHIPS_URL, parameters: parameters)
      .validate()
      .responseDecodable(of: Starships.self) {
        response in
        // 4
        guard let starships = response.value else { return }
        self.items = starships.all
        self.tableView.reloadData()
    }
  }
}
