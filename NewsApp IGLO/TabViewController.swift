//
//  TabViewController.swift
//  NewsApp IGLO
//
//  Created by Vebby Clarissa on 14/04/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Tabman
import Pageboy

class TabViewController: TabmanViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self

        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize

        // Add to view
        addBar(bar, dataSource: self, at: .top)
    }
}

extension TabViewController : PageboyViewControllerDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        1
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        ViewController()
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        nil
    }
}

extension TabViewController : TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        <#code#>
    }
}
