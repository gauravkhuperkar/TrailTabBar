import UIKit

class CartListTableViewController: UITableViewController, CartConsumer {

    var bagsInCart: [BagProduct] = []
    
    func updateCart(product: BagProduct) {
        bagsInCart.append(product)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 0 ? bagsInCart.count : 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {
 
            let cell = tableView.dequeueReusableCellWithIdentifier("CartTableViewCellForTotalCost", forIndexPath: indexPath) as! CartTableViewCellForTotalCost
            cell.totalCost.text = calculateTotalCost();
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("CartlTableViewCell", forIndexPath: indexPath) as! CartlTableViewCell
            let bag = bagsInCart[indexPath.row]
            
            // Configure the cell...
            cell.name.text = bag.name
            cell.price.text = bag.price
//            cell.imageView?.image = bag.image
//            tabBarController?.tabBar.items![1].badgeValue = String(bagsInCart.count)
            return cell
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // private functions
    
    private func calculateTotalCost() -> String {
        var totalPrice = 0
        for bags in bagsInCart {
            totalPrice += Int(bags.price)!
        }
        return "Rs " + String(totalPrice)
    }

}