//
//  ViewController.swift
//  timeTools
//
//  Created by Dastan Mambetaliev on 2/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerSlider: UISlider!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    var timer = Timer()
    var seconds = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func timerSlider(_ sender: UISlider) {
        seconds = Int(sender.value)
        timerLabel.text = String(seconds)
    }
    
    @IBAction func timerStartButtonWasPushed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerClass), userInfo: nil, repeats: true)
    }
    
    @IBAction func timerPauseButtonWasPushed(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func timerStopButtonWasPushed(_ sender: Any) {
        timer.invalidate()
        seconds = 30
        timerSlider.setValue(30, animated: true)
        timerLabel.text = String(seconds)
    }
    
    @objc func timerClass() {
        seconds -= 1
        let secondsToTime = secondsToHoursToMinutes(seconds: seconds)
        let time = timerToString(hours: secondsToTime.0, minutes: secondsToTime.1, seconds: secondsToTime.2)
        timerLabel.text = time
        
        timerSlider.value = Float(seconds)
        
        if(seconds == 0)
        {
            timer.invalidate()
        }
    }
    
    func secondsToHoursToMinutes(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func timerToString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
}


class StopwatchViewController: UIViewController
{
    
    @IBOutlet weak var StopwatchTimerLable: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    var timer:Timer = Timer()
    var count:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func startButtonWasPushed(_ sender: Any)
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }
    
    @objc func timerCounter() -> Void
    {
        count = count + 1
        let time = secondsToHoursToMinutes(seconds: count)
        let timeString = timeToString(hours: time.0, minutes: time.1, seconds: time.2)
        StopwatchTimerLable.text = timeString
    }
    
    func secondsToHoursToMinutes(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func timeToString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
    @IBAction func pauseButtonWasPushed(_ sender: Any)
    {
        timer.invalidate()
        
    }
    
    @IBAction func stopButtonWasPushed(_ sender: Any)
    {
        self.count = 0
        self.timer.invalidate()
        self.StopwatchTimerLable.text = self.timeToString(hours: 0, minutes: 0, seconds: 0)
    }
}
