import UIKit
import AVFoundation

class ViewController: UIViewController
{
    var audioPlayer: AVAudioPlayer?
    
    @IBOutlet weak var beginPlayingLabel: UILabel!
    
    @IBOutlet weak var secondBeginPlayingLabel: UILabel!
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var singleOrMultiplayer: UISegmentedControl!
    
    var firstTurn = Turn.X
    var currentTurn = Turn.X
    
    var Naught = "O"
    var Cross = "X"
    var Blank = ""
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
        super.viewDidLoad()
        initBoard()
        turnLabel.textColor = .systemRed
        self.view.backgroundColor = UIColor.yellow
        navigationItem.title = "Tik Tac Toe!"
        beginPlayingLabel.text = "Player 1 (X) tap on a space to begin playing"
        secondBeginPlayingLabel.text = "Player 2's (O) turn will begin immediatley after Player 1 selects a space."
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
        case Nil
    }
    
    @IBAction func boardTap(_ sender: UIButton)
    {
        //click sound effect
        let pathToSound = Bundle.main.path(forResource: "MCClick", ofType: "wav")!
        let url = URL(fileURLWithPath: pathToSound)
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }
        catch
        {
            print(error)
        }
        XorO(sender)
        
        
        if checkWhoWon(Cross){
        print("New logic works cross")
            ResetBoard()
            alert(title: "Player One Won")
            
            //win sound effect
            let pathToSound = Bundle.main.path(forResource: "MCXp", ofType: "wav")!
            let url = URL(fileURLWithPath: pathToSound)
            do
            {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            catch
            {
                print(error)
            }
        }
        
        
        if checkWhoWon(Naught){
        print("New logic works naught")
            ResetBoard()
            alert(title: "Player Two Won")

            //win sound effect
            let pathToSound = Bundle.main.path(forResource: "MCXp", ofType: "wav")!
            let url = URL(fileURLWithPath: pathToSound)
            do
            {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            catch
            {
                print(error)
            }
        }
        
        
        if(fullBoard()) {
            print("draw")
            alert(title: "Draw")
//            ResetBoard()
        }
         
        
    }
    func XorO(_ sender: UIButton)
    {
        
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
            sender.isEnabled = false
            
        }
    }
    func fullBoard() -> Bool {
        for button in gameBoard {
            if button.title(for: .normal) == nil
            {
                return false
            }
        }
        ResetBoard()
        return true
    }
    
    
    func whatCharacter(_ button: UIButton, _ character: String) -> Bool {
        return button.title(for: .normal) == character
    }
    
    
    func checkWhoWon(_ s: String) -> Bool {
       //horizontal
        if whatCharacter(a1, s) && whatCharacter(a2, s) && whatCharacter(a3, s) {
            return true
        }
        if whatCharacter(b1, s) && whatCharacter(b2, s) && whatCharacter(b3, s) {
            return true
        }
        if whatCharacter(c1, s) && whatCharacter(c2, s) && whatCharacter(c3, s) {
            return true
        }
        
        //vertical
        if whatCharacter(a1, s) && whatCharacter(b1, s) && whatCharacter(c1, s) {
            return true
        }
        if whatCharacter(a2, s) && whatCharacter(b2, s) && whatCharacter(c2, s) {
            return true
        }
        if whatCharacter(a3, s) && whatCharacter(b3, s) && whatCharacter(c3, s) {
            return true
        }
        
        //diag
        if whatCharacter(a1, s) && whatCharacter(b2, s) && whatCharacter(c3, s) {
            return true
        }
        if whatCharacter(a3, s) && whatCharacter(b2, s) && whatCharacter(c1, s) {
            return true
        }
        
        return false
    }
   
    func alert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Reset", style: .default) { (action) in
            print("User tapped on dismiss")
            self.ResetBoard()
        }
        alert.addAction(dismiss)
        present(alert, animated: true, completion: nil)
    }
    
    
    func ResetBoard() {

        for button in gameBoard
        {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true

        }
        gameBoard.removeAll()
        if firstTurn == Turn.X {
            firstTurn = Turn.O
            turnLabel.text = "Player Two's Turn!"
        } else if firstTurn == Turn.O {
            firstTurn = Turn.X
            turnLabel.text = "Player One's Turn!"
        }
        currentTurn = firstTurn
        initBoard()
        
    }
    @IBAction func whenResetButtonPressed(_ sender: UIButton) {
        ResetBoard()


    }
    
    
    @IBAction func selectSingleplayerOrMultiplayer(_ sender: UISegmentedControl) {
        selectSingleplayerOrMultiplayer(self) {
        case 1: 
        }
    
    }
    
}

