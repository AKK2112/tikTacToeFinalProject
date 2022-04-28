import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var beginPlayingLabel: UILabel!
    
    @IBOutlet weak var secondBeginPlayingLabel: UILabel!
    
    var firstTurn = Turn.X
    var currentTurn = Turn.X
    
    var Naught = "O"
    var Cross = "X"
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        navigationItem.title = "Tik Tac Toe!"
        beginPlayingLabel.text = "Player 1 tap on a space to begin playing"
        secondBeginPlayingLabel.text = "Player 2's turn will begin immediatley after Player 1 selects a space and vice versa. Player 1 is X and Player 2 is O"
    }
    
    enum Turn {
        case X
        case O
    }
    
    @IBAction func boardTap(_ sender: UIButton)
    {
        XorO(sender)
    }
    func XorO(_ sender: UIButton)
    {
        print("yeet")
        if(sender.title(for: .normal) == nil)
        {
            if (currentTurn == Turn.O){
          
                sender.setTitle(Naught, for: .normal)
            currentTurn = Turn.X
                
            } else if (currentTurn == Turn.X){
                sender.setTitle(Cross, for: .normal)
                currentTurn = Turn.O

            }
            
        }
    }
}

