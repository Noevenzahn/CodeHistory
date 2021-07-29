
import SwiftUI

class GameViewModel: ObservableObject {
    @Published private var game = Game()
    
    var correctGuesses: Int {
        game.guessCount.correct
    }
    var incorrectGuesses: Int {
        game.guessCount.incorrect
    }
    var currentQuestion: Question {
        game.currentQuestion
    }
    var questionProgressText: String {
        "\(game.currentQuestionIndex + 1) / \(game.numberOfQuestions)"
    }
    // 1
     var guessWasMade: Bool {
          if let _ = game.guesses[currentQuestion] {
              return true
          } else {
              return false
          }
      }
    var gameIsOver: Bool {
        game.isOver
    }
   
      // MARK: - Internal Methods
      // 2
      func makeGuess(atIndex index: Int) {
          game.makeGuessForCurrentQuestion(atIndex: index)
      }
      // 3
      func displayNextScreen() {
          game.updateGameStatus()
      }
    
    func color(forOptionIndex optionIndex: Int) -> Color {
        if let guessedIndex = game.guesses[currentQuestion] {
            if guessedIndex != optionIndex {
                return GameColor.main
            } else if guessedIndex == currentQuestion.correctAnswerIndex {
                return GameColor.correctGuess
            } else {
                return GameColor.incorrectGuess
            }
        } else {
            return GameColor.main
        }
    }
}
