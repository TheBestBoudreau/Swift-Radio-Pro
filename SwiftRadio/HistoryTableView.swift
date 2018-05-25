//
//  HistoryTableView.swift
//  SwiftRadio
//
//  Created by Tyler Boudreau on 2018-05-25.
//  Copyright © 2018 matthewfecher.com. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: PROPERTIES
    @IBOutlet weak var tableView: UITableView!
    var tracks: Results<RealmTrack>?
    
    //MARK: VIEW
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        tracks = realm.objects(RealmTrack.self)
        tableView.reloadData()
    }
    
    //MARK: TABLEVIEW
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "history", for: indexPath) as? HistoryTableViewCell{
           
            guard let track = tracks?[indexPath.row] else { return cell }
            cell.artistLabel.text = track.artist
            cell.songNameLabel.text = track.songTitle
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "history", for: indexPath)
        return cell
    }

}

