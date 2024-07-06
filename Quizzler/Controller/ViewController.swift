import UIKit

class ViewController: UIViewController {
    
    var quizBrain = QuizBrain()
    var timer = Timer()
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = quizBrain.getQuestion()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
        }
        
        quizBrain.nextQuestion()
        progressBar.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestion()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
}
