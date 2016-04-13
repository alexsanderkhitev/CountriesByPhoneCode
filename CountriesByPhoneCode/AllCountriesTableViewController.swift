//
//  AllCountriesTableViewController.swift
//  CountriesByPhoneCode
//
//  Created by Alexsander  on 4/13/16.
//  Copyright © 2016 Alexsander Khitev. All rights reserved.
//

import UIKit

class AllCountriesTableViewController: UITableViewController {
    
    // MARK: - var and let 
    private var countries: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        setCountries()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - functions
    private func setCountries() {
        countries = Countries.getAllCountries()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 ?? 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count ?? 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CountryCell", forIndexPath: indexPath)

        // Configure the cell...
        let country = countries[indexPath.row]
        
        cell.textLabel!.text = country.name
        if country.phoneExtension != nil {
            cell.detailTextLabel!.text = country.phoneExtension!
        }

        return cell
    }
}
