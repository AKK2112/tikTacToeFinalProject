import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var beginPlayingLabel: UILabel!
    
    @IBOutlet weak var secondBeginPlayingLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        navigationItem.title = "Tik Tac Toe!"
        beginPlayingLabel.text = "Player 1 tap on a space to begin playing"
        
    }
    
    enum player {
        case X
        case O
    
    }
    
    
    @IBAction func button1 (_ sender: UIButton)
    {
        
    }
    @IBAction func button2 (_ sender: UIButton)
    {
        
    }
    @IBAction func button3 (_ sender: UIButton)
    {
        
    }
    @IBAction func button4 (_ sender: UIButton)
    {
        
    }
    @IBAction func button5 (_ sender: UIButton)
    {
        
    }
    @IBAction func button6 (_ sender: UIButton)
    {
        
    }
    @IBAction func button7 (_ sender: UIButton)
    {
        
    }
    @IBAction func button8 (_ sender: UIButton)
    {
        
    }
    @IBAction func button9 (_ sender: UIButton)
    {
        
    }
    func XorO {
        
    }

}

