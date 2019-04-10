# iOS Study Project -> ChaChaChart

通过这个项目可以学到：

1. 如何新建，使用 Navigation Controller

2. show Segue 和 push Segue 的区别：
    
    1. push 需要在 Navigation Controller 中使用
    2. push 高度封装（dismiss，侧滑返回等功能已经实现）， show 比较灵活

3. TableView 在 ViewController 中的使用步骤

    1. 在 storyboard 中拖拽 TableView
    2. 在 ViewController 中获取到 TableView 对象，并让  ViewController 实现 UITableViewDelegate 和 UITableViewDataSource 协议
    3. 在 viewDidLoad() 中指定好 TableView 的 delegate 和 dataSource 为当前的 ViewController
    4. 在 viewDidLoad() 中注册 TableView 的 Cell，这一步其实就是声明列表的 Item 是啥样的
    
        ```swift
        messageTableView.register(UINib(nibName: "CustomMessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
       ```
    
    5. 实现 `tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int `  和 `tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell`
    
        ```swift
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        let messageArray = ["1","2","3"]
        cell.messageText.text = messageArray[indexPath.row]
        return cell
        }
       ``` 
