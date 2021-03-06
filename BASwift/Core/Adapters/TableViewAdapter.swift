//  BaseTableViewAdapter.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 27/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

open class TableViewAdapter: NSObject, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Properties
    public var tableDataModel: BaseTableDataModel<BaseSectionModel> {
        didSet {
            tableView.reloadData()
        }
    }

    public var tableView: UITableView

    // MARK: - Initialization
    public init(_ tableView: UITableView) {
        self.tableView = tableView
        self.tableDataModel = BaseTableDataModel()
        super.init()

        self.tableView.delegate = self
        self.tableView.dataSource = self

        registerNibs()
        setTableData()
    }

    // MARK: - Methods
    open func registerNibs() {}

    open func setTableData() {}

    open func getCellModel(_ indexPath: IndexPath) -> BaseCellModel {
        return tableDataModel.sections[indexPath.section].cellModels[indexPath.row]
    }

    open func getSectionModel(atIndexPath indexPath: IndexPath) -> BaseSectionModel {
        return tableDataModel.sections[indexPath.section]
    }

    open func getData<T>(atIndexPath indexPath: IndexPath) -> T? {
        guard let data = tableDataModel.sections[indexPath.section].cellModels[indexPath.row].cellData as? T else {
            return nil
        }
        return data
    }

    open func resetData() {
        tableDataModel = BaseTableDataModel()
        setTableData()
    }

    // MARK: - UITableView Delegate & DataSource
    open func numberOfSections(in tableView: UITableView) -> Int {
        return tableDataModel.sections.count
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataModel.sections[section].cellModels.count
    }

    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableDataModel.sections[indexPath.section].cellModels[indexPath.row].cellHeight
    }

    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return tableDataModel.sections[section].footerHeight
    }

    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableDataModel.sections[section].headerHeight
    }

    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableDataModel.sections[section].headerView()
    }

    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return tableDataModel.sections[section].footerView()
    }

    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    open func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }

    open func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    open func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    open func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    open func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return nil
    }

    open func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {

    }

    open func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {

    }

    open func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {

    }

    open func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

    }

    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }

    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
        -> UISwipeActionsConfiguration? {
        return nil
    }

    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return nil
    }

}
