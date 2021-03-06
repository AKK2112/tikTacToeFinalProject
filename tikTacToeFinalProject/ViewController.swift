import UIKit
import AVFoundation

class ViewController: UIViewController
{
    var audioPlayer: AVAudioPlayer?
    
    @IBOutlet weak var beginPlayingLabel: UILabel!
    
    @IBOutlet weak var secondBeginPlayingLabel: UILabel!
    
    @IBOutlet weak var thirdBeginPlayingLabel: UILabel!
    
    @IBOutlet weak var turnLabel: UILabel!
    
    
    @IBOutlet weak var xWinCounterLabel: UILabel!
    
    @IBOutlet weak var oWinCounterLabel: UILabel!
    
    
    
    var firstTurn = Turn.X
    var currentTurn = Turn.X
    
    
    var Naught = "O"
    var Cross = "X"
    var Blank = ""
    var gameBoard = [UIButton]()
    var i: Int = 0
    
    
    
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
        navigationItem.title = "Tic Tac Toe!"
        beginPlayingLabel.text = "Player 1 (X) tap on a space to begin playing"
        secondBeginPlayingLabel.text = "Player 2's (O) turn will begin immediately after Player 1 selects a space"
        thirdBeginPlayingLabel.text = "Press Reset Scores to reset the scores"
        xWinCounterLabel.text = "0"
        oWinCounterLabel.text = "0"
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
        deployHaptics(1)
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
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.prepare()
            generator.impactOccurred()
            view.backgroundColor = .red
            
            print("New logic works cross")
            ResetBoard()
            alert(title: "Crosses Won")
            
            turnLabel.text = ""
            let data = xWinCounterLabel.text!
            let data2 = Int(data)!
            let number = data2 + 1
            xWinCounterLabel.text = "\(number)"
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
            alert(title: "Naughts Won")
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.prepare()
            generator.impactOccurred()
            view.backgroundColor = .blue
//            let generator = UINotificationFeedbackGenerator()
//              generator.notificationOccurred(.warning)
            
            turnLabel.text = ""
            let data = oWinCounterLabel.text!
            let data2 = Int(data)!
            let number = data2 + 1
            oWinCounterLabel.text = "\(number)"
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
          let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            
            print("draw")
            alert(title: "Draw")
            //            ResetBoard()
            view.backgroundColor = .white
            turnLabel.text = ""
            
            let pathToSound = Bundle.main.path(forResource: "MCDeath", ofType: "wav")!
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
    }
    func XorO(_ sender: UIButton)
    {
        sender.isEnabled = false
        if(sender.title(for: .normal) == nil)
        {
            if (currentTurn == Turn.O){
                
                sender.setTitle(Naught, for: .normal)
                sender.setTitleColor(.systemBlue, for: .normal)
                currentTurn = Turn.X
                
                
                turnLabel.text = "Current turn: X"
                turnLabel.textColor = .systemRed
                
            } else if (currentTurn == Turn.X){
                sender.setTitle(Cross, for: .normal)
                sender.setTitleColor(.systemRed, for: .normal)
                currentTurn = Turn.O
                
                
                turnLabel.text = "Current turn: O"
                turnLabel.textColor = .systemBlue
            }
            
            sender.isEnabled = false
//            HapticsManager.shared.vibrate(for: .success)
//
        }
//        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
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
        let alert = UIAlertController(title: title, message: "Created by: Alec K., Caden L., Matthew S., and Nathan K.", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Reset", style: .default) { (action) in
            print("User tapped on dismiss")
            self.ResetBoard()
            self.view.backgroundColor = UIColor.yellow
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
            turnLabel.text = "Current turn: O"
            turnLabel.textColor = .systemBlue
        } else if firstTurn == Turn.O {
            firstTurn = Turn.X
            turnLabel.text = "Current turn: X"
            turnLabel.textColor = .systemRed
        }
        currentTurn = firstTurn
        initBoard()
        
        
    }
    
    @IBAction func whenSwitchButtonPressed(_ sender: UIButton) {
        ResetBoard()
    }
    
    @IBAction func whenResetButtonPressed(_ sender: UIButton) {
        deployHaptics(6)
        xWinCounterLabel.text = "0"
        oWinCounterLabel.text = "0"
        let generator = UINotificationFeedbackGenerator()
          generator.notificationOccurred(.success)
        
        let pathToSound = Bundle.main.path(forResource: "MCtnt", ofType: "wav")!
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
        
        
        print("reset game")
        
    }
    
    func deployHaptics(_ s: Int) {
            
        i = s
            print("Running \(i)")

            switch i {
            case 1:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.error)

            case 2:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)

            case 3:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.warning)

            case 4:
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()

            case 5:
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()

            case 6:
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()

            default:
                let generator = UISelectionFeedbackGenerator()
                generator.selectionChanged()
                i = 0
            }
        }
    
}

