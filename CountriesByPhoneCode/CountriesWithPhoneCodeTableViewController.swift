//
//  CountriesWithPhoneCodeTableViewController.swift
//  CountriesByPhoneCode
//
//  Created by Alexsander  on 4/13/16.
//  Copyright © 2016 Alexsander Khitev. All rights reserved.
//

import UIKit

class CountriesWithPhoneCodeTableViewController: UITableViewController {

    private var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        setCountries()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - functions
    private func setCountries() {
        countries = Countries.getCountriesWithPhone()
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
        cell.detailTextLabel!.text = country.phoneExtension!
        
        return cell
    }
}
