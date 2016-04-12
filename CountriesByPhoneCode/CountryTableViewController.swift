//
//  CountryChooseTableViewController.swift
//  CountriesByPhoneCode
//
//  Created by Alexsander  on 4/10/16.
//  Copyright © 2016 Alexsander Khitev. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController, UISearchControllerDelegate, UISearchBarDelegate {
    
    // MARK: - var and let
    private var countries: [(String, [Country])] = []
    // MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        setCountry()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBAction
    
    // MARK: - functions
    
    private func setCountry() {
        countries = Countries.getCountriesByFirstLetter()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return countries.count ?? 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(countries)[section].1.count ?? 0
       
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(countries)[section].0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CountryCell", forIndexPath: indexPath)
        
        // Configure the cell...
        let country = Array(countries)[indexPath.section].1[indexPath.row]
        cell.textLabel!.text = country.name
        if country.phoneExtension != nil {
            cell.detailTextLabel!.text = "+".stringByAppendingString(country.phoneExtension!)
        } else {
            cell.detailTextLabel?.text = nil
        }

        
        return cell
    }
}
