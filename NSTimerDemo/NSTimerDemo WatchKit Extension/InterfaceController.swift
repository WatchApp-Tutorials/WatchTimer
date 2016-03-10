//
//  InterfaceController.swift
//  NSTimerDemo WatchKit Extension
//
//  Created by Yogesh Bharate on 11/02/16.
//  Copyright © 2016 Yogesh Bharate. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
  
  // IBOutlets
  
  @IBOutlet var timeCounter: WKInterfaceLabel!
  @IBOutlet var totalTimeSpend: WKInterfaceLabel!
  
  // Varibles
  var nsTimer = NSTimer()
  var counter = 0
  
  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)
    
    // Configure interface objects here.
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
  // Timer Actions
  @IBAction func StartTimer() {
    nsTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
  }
  
  @IBAction func PauseTimer() {
    nsTimer.invalidate()
  }
  
  @IBAction func StopTimer() {
    nsTimer.invalidate()
    let (h, m, s) = secondsToHoursMinutesSeconds(counter)
    let timeString = convert(h) + ":" + convert(m) + ":" + convert(s)
    totalTimeSpend.setText(timeString)
  }
  
  func updateCounter() {
    counter += 1
    let (h, m, s) = secondsToHoursMinutesSeconds(counter)
    let timeString = convert(h) + ":" + convert(m) + ":" + convert(s)
    timeCounter.setText(timeString)
  }
  
  func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
  }
  
  func convert(count: Int) -> String {
    var timeString = ""
    
    guard count <= 10 else {
      timeString = String(count)
      return timeString
    }

    timeString = "0" + String(count)
    return timeString
  }
  
}
