import UIKit
import AVFoundation

class ViewController2: UIViewController
{
 
        var audioPlayer: AVAudioPlayer?
    
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
}
