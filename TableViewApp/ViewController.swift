//
//  ViewController.swift
//  TableViewApp
//
//  Created by Dominik Penkava on 10/23/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: Initialization of stuff
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rightOrWrong: UILabel!
    
    var currentQuestion = 0
    var currentAnswer: String? = ""
    var correctAnswers: Int = 0
    var failedAnswers: Int = 0
    
    var data: [String] = [] // Default question options
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        askQuestions() // Ask first question
    }
    
    // MARK: TableView functions and deligates

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
        }
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.lineBreakMode = .byWordWrapping
        
        cell?.textLabel?.text = data[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = data[indexPath.row]
        
        if currentAnswer == nil {
            rightOrWrong.text = ""
            questionLabel.text = "You scored: \(correctAnswers)/\(correctAnswers + failedAnswers) correctly!"
            data = []
            tableView.reloadData()
            return
        }
            
        if selectedItem == currentAnswer {
            print("correct!")
            rightOrWrong.text = "You answered: Correctly"
            correctAnswers += 1
            rightOrWrong.textColor = .green
        } else {
            failedAnswers += 1
            print("wrong")
            rightOrWrong.text = "You answered: Poorly"
            rightOrWrong.textColor = .red
        }

        askQuestions()
    }
    
    // MARK: Other functions
    
    func newAnswers(question: String, answer: String?, answerOptions: [String]) {
        var newData: [String] = []
        
        for option in answerOptions {
            newData.append(option)
        }
        
        data = newData.shuffled() // randomize questions
        tableView.reloadData()
        
        questionLabel.text = question
        currentAnswer = answer
        currentQuestion += 1
    }
    
    func askQuestions() {
        switch currentQuestion {
        case 0:
            newAnswers(question: "Did you know?", answer: "Sharks existed before trees.", answerOptions: [
                "Sharks existed before trees.",
                "Sharks are mammals.",
                "Sharks can live up to 200 years.",
                "Sharks are colorblind."
            ])
        case 1:
            newAnswers(question: "Fun Fact!", answer: "Humans share 60% of their DNA with bananas.", answerOptions: [
                "Humans share 60% of their DNA with bananas.",
                "Humans and bananas have identical DNA.",
                "Humans share 80% of their DNA with mice.",
                "Humans share 50% of their DNA with rocks."
            ])
        case 2:
            newAnswers(question: "Random Trivia:", answer: "A day on Venus is longer than a year on Venus.", answerOptions: [
                "A day on Venus is longer than a year on Venus.",
                "Venus is the hottest planet in the solar system.",
                "A year on Venus lasts 365 Earth days.",
                "Venus has the most moons of any planet."
            ])
        case 3:
            newAnswers(question: "Did you know?", answer: "Wombat poop is cube-shaped.", answerOptions: [
                "Wombat poop is cube-shaped.",
                "Wombat poop is round.",
                "Wombats can run 30 miles per hour.",
                "Wombats are nocturnal creatures."
            ])
        case 4:
            newAnswers(question: "Fun Fact!", answer: "Octopuses have three hearts.", answerOptions: [
                "Octopuses have three hearts.",
                "Octopuses can change color.",
                "Octopuses are the smartest sea creatures.",
                "Octopuses can live for 5 years."
            ])
        case 5:
            newAnswers(question: "Interesting!", answer: "The longest hiccuping spree lasted 68 years.", answerOptions: [
                "The longest hiccuping spree lasted 68 years.",
                "The longest hiccuping spree lasted 2 years.",
                "The longest hiccuping spree lasted 10 months.",
                "Hiccups can occur while sleeping."
            ])
        case 6:
            newAnswers(question: "Weird but true:", answer: "The Eiffel Tower grows about 6 inches taller in the summer.", answerOptions: [
                "The Eiffel Tower grows about 6 inches taller in the summer.",
                "The Eiffel Tower is painted every 7 years.",
                "The Eiffel Tower was the tallest structure in the world until 1930.",
                "The Eiffel Tower has 3 levels."
            ])
        case 7:
            newAnswers(question: "Did you know?", answer: "The inventor of the frisbee was turned into a frisbee after he died.", answerOptions: [
                "The inventor of the frisbee was turned into a frisbee after he died.",
                "Frisbees were originally used as pie tins.",
                "The frisbee was invented in the 19th century.",
                "Frisbees are made of plastic."
            ])
        default:
            newAnswers(question: "Thanks for playing! How would you rate this?", answer: nil, answerOptions: [
                "Amazing", "Great", "Award Worthy",
                "Outstanding", "Exceptional", "Fantastic",
                "Incredible", "Remarkable", "Fabulous",
                "Terrific", "Phenomenal", "Superb",
                "Impressive", "Brilliant", "Marvelous",
                "Extraordinary", "Spectacular", "Awesome",
                "Top-notch", "Wonderful", "Admirable",
                "Exemplary", "Splendid", "A+ effort",
                "First-rate", "Stellar", "Unbelievable",
                "Gorgeous", "Inspiring", "Striking",
                "Magnificent", "Breathtaking", "Dazzling",
                "Classy", "Captivating", "Enthralling",
                "Charismatic", "Dynamic", "Visionary",
                "Groundbreaking", "Impeccable", "Flawless",
                "Gracious", "Heartwarming", "Joyful",
                "Powerful", "Uplifting", "Endearing",
                "Radiant"
            ])
        }
    }
}

