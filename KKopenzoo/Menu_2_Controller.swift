

import UIKit


class Menu_2_Controller: UITableViewController {
    
    @IBOutlet weak var imgFacebook: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
  
    var dict : NSDictionary!
    var databasePath = NSString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //databasePath = NSBundle.mainBundle().pathForResource("dbKkopenzoo", ofType:"")!
        //databasePath = NSBundle.mainBundle().pathForResource("KKopenzoo_db", ofType:"sqlite")!
        databasePath = NSBundle.mainBundle().pathForResource("kkopenzooDb", ofType:"sqlite")!
        
        print("Path : ", databasePath)
        
       // let filemgr = NSFileManager.defaultManager()
        
        
        /*
        let filemgr = NSFileManager.defaultManager()
        let dirPaths =
        NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
            .UserDomainMask, true)
        
        let docsDir : NSString = dirPaths[0]
        
        databasePath = docsDir.stringByAppendingPathComponent(
            "kkopenzooDb.sqlite")
*/
        
        
        
            
            let contactDB = FMDatabase(path: databasePath as String)
            
            if contactDB.open() {
                
                let querySQL = "SELECT * FROM userInfo WHERE 1 limit 1"
                
                let results:FMResultSet? = contactDB.executeQuery(querySQL, withArgumentsInArray: nil)
                
                if results?.next() == true {
                    print("first_name >> ",results?.stringForColumn("first_name"))
                    print("last_name >> ",results?.stringForColumn("last_name"))
                    print("email >> ",results?.stringForColumn("email"))
                    print("id >> ",results?.stringForColumn("id"))
                    print("name >> ",results?.stringForColumn("name"))
                    print("pictureUrl >> ",results?.stringForColumn("pictureUrl"))
                    print("Record Found")
                    
                    var data: NSData?
                    let url = NSURL(string: (results?.stringForColumn("pictureUrl"))!)
                    data = NSData(contentsOfURL:url!)
                    
                    imgFacebook.image = UIImage(data:data!)
                    labelName.text =  results?.stringForColumn("name")
                    labelEmail.text = results?.stringForColumn("email")
                } else {
                    print("Record not found")
                }
                contactDB.close()
            } else {
                print("Error: \(contactDB.lastErrorMessage())")
            }
        
        
        
        
        
        /*
        if results?.stringForColumn("first_name") != nil {
            var data: NSData?
            let url = NSURL(string: (results?.stringForColumn("pictureUrl"))!)
            data = NSData(contentsOfURL:url!)
            
            imgFacebook.image = UIImage(data:data!)
            labelName.text =  results?.stringForColumn("first_name")
            
            print(">>>>>>>>>>>>","\n",results?.stringForColumn("picture"),"\n")
        
            
        }
        */
        
        /*
        else{
            imgFacebook.image = UIImage(named:"guest")
            labelName.text = "Guest"
           
        }
        
        */
        
          }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func run(){
    
     print("55555")
    
    }
    
    // MARK: - Table view data source
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
    
    // Configure the cell...
    
    return cell
    }
    */
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
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
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */

}
