//
//  BookTableTableViewController.swift
//  TableViewSample
//
//  Created by Admin on 2021/08/24.
//

import UIKit

class BookTableTableViewController: UITableViewController {
    
    var books:[Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        books.append(Book(title: "열혈 C++", writer: "홍길동", coverImage: "book1"))
        books.append(Book(title: "열혈 C#", writer: "김길동", coverImage: "book2"))
        books.append(Book(title: "열혈 Swift", writer: "최길동", coverImage: "book3"))
    }

    // MARK: - Table view data source

    // 섹션 몇개 그리는지
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // 하나의 섹션안에 몇개 그릴건지
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }

    // 위 2개의 세팅을 하고 tableView메소드를 이용해서 어떻게 생겼는지 return
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let retCell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
//        retCell.textLabel?.text = "Hello"
//        retCell.detailTextLabel?.text = "World"
//
//        print("Cell alloc : \(indexPath)")
//
//        return retCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        
        let book = books[indexPath.row]
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = book.writer
        cell.imageView?.image = UIImage(named: book.coverImage)
        

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let bookDetailViewController = segue.destination as? BookDetailViewController,
           let selectedRowIndex = tableView.indexPathForSelectedRow?.row {
            // 선택된 row의 정보를 가져온다.
            bookDetailViewController.book = books[selectedRowIndex]
        }
    }

}
