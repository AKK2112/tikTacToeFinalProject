import UIKit
import AVFoundation

class ViewController2: UIViewController
{
 
        var audioPlayer: AVAudioPlayer?
    var i: Int = 0

    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        view.self.backgroundColor = UIColor.cyan
        
        
        //portal sound effect
        let pathToSound = Bundle.main.path(forResource: "MCPortal", ofType: "wav")!
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
    
    let url2 = URL(string: "https://www.youtube.com/watch?v=USEjXNCTvcc")
    
    @IBAction func exampleButton(_ sender: UIButton)
    {
        deployHaptics(4)
        let pathToSound = Bundle.main.path(forResource: "silence", ofType: "wav")!
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
        
        UIApplication.shared.open(url2!, options: [:], completionHandler: nil)
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


