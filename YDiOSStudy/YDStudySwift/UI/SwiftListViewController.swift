//
//  SwiftViewController.swift
//  YDiOSStudy
//
//  Created by 王远东 on 2024/9/2.
//

import Foundation
import UIKit
import SnapKit

class SwiftListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var groupData: [String: [String]] = [:]
    
    @objc
    public static func creatVC() -> UIViewController {
        let vc = SwiftListViewController()
        return vc
    }
    
    override func viewDidLoad() {
        groupData = [
            "Swift语法":["语法基础", "基础类型", "类和结构体", "函数式", "控制流", "集合", "操作符", "杂七杂八"],
            "基础库":["语法基础", "基础类型", "类和结构体"],
        ]
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keys = Array(groupData.keys)
        let key = keys[section]
        let list = groupData[key]
        return list?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let keys = Array(groupData.keys)
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let key = Array(groupData.keys)[section]
        return key
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.ydCellWith(tableView: self.tableView)
        let keys = Array(groupData.keys)
        let list = groupData[keys[indexPath.section]]
        let title = list?[indexPath.row]
        cell.textLabel?.text = title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = Array(groupData.keys)[indexPath.section]
        guard let list = groupData[key] else { return }
        let title = list[indexPath.row]
        var vc:UIViewController?
        switch key {
        case "Swift语法":
            vc = clickSwiftBaseModule(title: title)
        default:
            print("error")
            showErrorText("未查到此内容，待更新")
        }
        
        guard let toVC = vc else { return  }
        navigationController?.pushViewController(toVC, animated: true)
    }
    
    // MARK: Swift语法
    func clickSwiftBaseModule(title: String) -> UIViewController? {
        var vc:UIViewController?
        vc = SwiftBaseViewController.creatVC(title: title)
        return vc ?? UIViewController()
    }
}
