//
//  SwiftBaseViewController.swift
//  YDiOSStudy
//
//  Created by 王远东 on 2024/9/2.
//

import Foundation
import UIKit

class SwiftBaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        return tableView
    }()
    lazy var data = [String]()
    lazy var type:String = ""
    
    static func creatVC(title:String) -> UIViewController {
        let vc = SwiftBaseViewController()
        vc.type = title
        return vc
    }
    
    override func viewDidLoad() {
        switch type {
        case "语法基础":
            loadGrammarBasicsData()
        case "基础类型":
            loadBaseTypeData()
        default:
            print("error")
            showErrorText("待后续更新")
        }
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.ydCellWith(tableView: self.tableView)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = data[indexPath.row]
        switch type {
        case "语法基础":
            didClickGrammarBasic(type: title)
        case "基础类型":
            didClickBaseType(type: title)
        default:
            print("error")
        }
    }
    
}
