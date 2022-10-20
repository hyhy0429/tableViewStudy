

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    // cell의 Identifier 이름 명시해주기 = 재사용 식별자
    let cellIdentifier: String = "cell"
}

extension ViewController: UITableViewDataSource {
    
    // 한 섹션에 행을 몇개 넣을지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // 섹션을 몇개 할지 - 옵셔널이라서, 지정해주지 않으면 디폴트 섹션 1개
    func numberOfSections(in: UITableView) -> Int {
        return 10
    }
    
    // 셀 불러오기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        cell.textLabel?.text = "\(indexPath.section), \(indexPath.row)"
        
        print("\(indexPath.section), Row \(indexPath.row)")
        
        // 0번째는 노란색이고, 뷰의 재사용으로 모두 노란색이 되지 않도록 0번만 노란색이게끔 로직을 구성
        if indexPath.row == 0 {
            cell.backgroundColor = .yellow
        } else {
            cell.backgroundColor = .white
        }
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    // 행이 선택되고 나서 이루어지는 일들 (얼럿 띄우기)
    func tableView(_ tableView: UITableView , didSelectRowAt indexPath: IndexPath) {
        
        // 긴 메세지 하나로 만들기
        let message: String =
        """
        날 만졌어
        Section \(indexPath.section), Row \(indexPath.row)
        """
        
        //얼럿 생성
        let alert = UIAlertController(title: "어머나", message: message, preferredStyle: .alert)
        //얼럿 액션 생성
        let ok = UIAlertAction(title: "그랬구나", style: .default)
        
        //얼럿과 얼럿 액션 합치기
        alert.addAction(ok)
        
        //얼럿 띄우기
        present(alert, animated: true)
        
        //셀이 선택되고나서, 회색으로 바뀌는 부분을 없애고 싶다면?
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // 셀의 높이 늘리는 메서드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
}

