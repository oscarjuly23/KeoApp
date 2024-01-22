//
//  ViewControllerLyric.swift
//  oscar.julian_bernat.segura
//
//

import UIKit

class ViewControllerLyric: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var songArray = [Song]()
    
    let data = dataAPI.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "songstable")
        self.data.getData(info: self) { jsonStr in
            let data = Data(jsonStr.utf8)
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let songs = json["songs"] as? [[String : String]] {
                        for song in songs {
                            let name = song["name"]
                            let artista = song["artist"]
                            var lyrics : String = song["lyrics"]!
                            lyrics = lyrics.replacingOccurrences(of: "\\n", with: "\n")

                            let newSong = Song(name: name!, artist: artista!, lyrics: lyrics)
                            self.songArray.append(newSong)
                        }
                    }
                }
            } catch let error {
                print("Failed to load: \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "songstable")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "songstable")
        }
    
        cell?.textLabel?.text = songArray[indexPath.row].name
        cell?.detailTextLabel?.text = songArray[indexPath.row].artist
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showsong", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewControllerLyricDesc{
            destination.song = songArray[(tableView.indexPathForSelectedRow?.row)!]
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
        
        if segue.identifier! == "refreshLyrics" {
            let vc = segue.destination as! ViewControllerNewFeeling
            vc.addSongTable = { name, artist, lyrics, view in
                self.songArray.append(Song(name: name, artist: artist, lyrics: lyrics))
                self.tableView.reloadData()
                //POST request
                self.data.uploadData(name, artist, lyrics, view)
            }
        }
    }
    
    // FALTA DELETE (Copy Paste, pero con un boton?)

}

