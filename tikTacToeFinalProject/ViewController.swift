import UIKit

class ViewController: UIViewController
{
    
    
    @IBOutlet weak var beginPlayingLabel: UILabel!
    
    @IBOutlet weak var secondBeginPlayingLabel: UILabel!
    
    @IBOutlet weak var turnLabel: UILabel!
    
    var firstTurn = Turn.X
    var currentTurn = Turn.X
    
    var Naught = "O"
    var Cross = "X"
    var gameBoard = [UIButton]()
    
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
        initBoard()
        turnLabel.textColor = .systemRed
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        navigationItem.title = "Tik Tac Toe!"
        beginPlayingLabel.text = "Player 1 tap on a space to begin playing"
        secondBeginPlayingLabel.text = "Player 2's turn will begin immediatley after Player 1 selects a space and vice versa. Player 1 is X and Player 2 is O"
    }
    
    func initBoard() {
        gameBoard.append(a1)
        gameBoard.append(a2)
        gameBoard.append(a3)
        gameBoard.append(b1)
        gameBoard.append(b2)
        gameBoard.append(b3)
        gameBoard.append(c1)
        gameBoard.append(c2)
        gameBoard.append(c3)
    }
    
    enum Turn {
        case X
        case O
    }
    
    @IBAction func boardTap(_ sender: UIButton)
    {
        XorO(sender)
        
        if(fullBoard()) {
            print("draw")
        }
        
        win()
        
        
    }
    func XorO(_ sender: UIButton)
    {
        
        print("yeet")
        if(sender.title(for: .normal) == nil)
        {
            if (currentTurn == Turn.O){
                
                sender.setTitle(Naught, for: .normal)
                sender.setTitleColor(.systemBlue, for: .normal)
                currentTurn = Turn.X
               
                
                turnLabel.text = "Player One's Turn!"
                turnLabel.textColor = .systemRed
                
            } else if (currentTurn == Turn.X){
                sender.setTitle(Cross, for: .normal)
                sender.setTitleColor(.systemRed, for: .normal)
                currentTurn = Turn.O
                
                
                turnLabel.text = "Player Two's Turn!"
                turnLabel.textColor = .systemBlue
            }
            
        }
    }
    func fullBoard() -> Bool {
        for button in gameBoard {
            if button.title(for: .normal) == nil
            {
                return false
            }
        }
        return true
    }
    
    
    func win() {
        if (a1.titleLabel?.text == Cross && a2.titleLabel?.text == Cross && a3.titleLabel?.text == Cross) {
            print("win func work")
            let alert = UIAlertController(title: "hi", message: nil, preferredStyle: .alert)
            let dismiss = UIAlertAction(title: "Dismiss", style: .default) { (action) in
                print("User tapped on dismiss")
                self.ResetBoard()
            }
            alert.addAction(dismiss)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func ResetBoard() {
        for button in gameBoard
        {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Turn.X {
            firstTurn = Turn.O
            turnLabel.text = "Player Two's Turn!"
        } else if firstTurn == Turn.O {
            firstTurn = Turn.X
            turnLabel.text = "Player One's Turn!"
        }
        currentTurn = firstTurn
    }
}

