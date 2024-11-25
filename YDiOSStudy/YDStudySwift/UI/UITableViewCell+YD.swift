//
//  SwiftTableViewCell.swift
//  YDiOSStudy
//
//  Created by 王远东 on 2024/9/2.
//

import Foundation
import UIKit

@objc
extension UITableViewCell {
    /// 从nib加载cell
    /// - Parameter tableView: UITableView
    /// - Parameter nibName: cell xib name（不传则用类名）
    /// - Parameter identifier: cell重用标识（不传则用类名）
    static func ydNibCellWith(tableView: UITableView, nibName: String? = nil, identifier: String? = nil) -> Self {
        var name = self.className
        var reuseIdentifier = self.className
        if let nName = nibName {
            name = nName
        }
        if let iden = identifier {
            reuseIdentifier = iden
        }
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? Self
        if cell == nil {
            tableView.register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? Self
        }
        return cell ?? self.init()
    }
    
    /// 加载以cell class注册的cell
    /// - Parameter tableView: UITableView
    /// - Parameter identifier: cell标识（不传则以类名作为标识）
    static func ydCellWith(tableView: UITableView, identifier: String? = nil) -> Self {
        var name = self.className
        if let nName = identifier {
            name = nName
        }
        var cell = tableView.dequeueReusableCell(withIdentifier: name) as? Self
        if cell == nil {
            tableView.register(self, forCellReuseIdentifier: name)
            cell = tableView.dequeueReusableCell(withIdentifier: name) as? Self
        }
        return cell ?? self.init()
    }
}
