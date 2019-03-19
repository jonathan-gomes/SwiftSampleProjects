//
//  QuizManager.swift
//  SwiftQuiz
//
//  Created by Jonathan Gomes on 06/02/2019.
//  Copyright © 2019 Jonathan Gomes. All rights reserved.
//

import Foundation

class QuizManager {
    private var quizes: [(question: String, correctAnswer: String, options: [String])] = [
        (   question: "Quais desses é string?",
            correctAnswer: "\"Olá mundo\"",
            options: ["20", "\"Olá mundo\"", "Olá mundo", "'Olá mundo'"]),
        
        (   question: "Qual é o resultado da expressão \"1\" + \"1\"",
            correctAnswer: "\"11\"",
            options: ["11", "\"2\"", "\"11\"", "\"1 1\""]),
        
        (   question: "Qual desses símbolos é usado para \"escapar\" caracteres especiais",
            correctAnswer: "\\",
            options: ["/", "\\", "!", "ESC"]),
        
        (   question: "Qual a sintaxe correta para declarar uma função?",
            correctAnswer: "func myFunction() {}",
            options: ["func = myFunction() {}", "let myFunction = func() {}", "let func = myFunction() {}", "func myFunction() {}"]),
        
        (   question:
            """
               func printSomething() {
                  print("Adoro funções")
               }
               printSomething()
            """,
            correctAnswer: "Adoro funções",
            options: ["Nada", "printSomething()", "Adoro funções", "Erro"]),
        
        (   question: "Quando não declaramos o tipo de retorno de uma função, qual é o retorno padrão?",
            correctAnswer: "Void",
            options: ["Void", "Int", "String", "nil"]),
        
        (   question: "Qual é a sintaxe correta para declarar um parâmetro?",
            correctAnswer: "resposta correta",
            options: ["func myFunc(String message) {}", "func myFunc(let message = String) {}", "func myFunc(message String) {}", "func myFunc(message: String) {}"]),
        
        (   question: "Qual é o tipo de uma variavél String que pode aceitar nil?",
            correctAnswer: "String?",
            options: ["String", "String?", "Int", "Void"]),
        
        (   question: "Quando queremos declarar uma constante, qual palavra reservada devemos usar?",
            correctAnswer: "let",
            options: ["var", "const", "let", "CONST"]),
        
        (   question: "O que é um dicionário?",
            correctAnswer: "É uma coleção não-ordenada com chave e valor",
            options: ["É uma coleção que não aceita objetos repetidos", "É uma coleção ordenada com chave e valor", "É uma coleção não-ordenada com chave e valor", "É uma coleção que permite valores de tipos diferentes"]),
        
        (   question: "Qual o nome do tipo especial em Swift que é usado para declarar blocos ou funções anônimas?",
            correctAnswer: "Closure",
            options: ["Lambda", "Block", "Closure", "Protocol"]),
        
        (   question: "O que é um enum?",
            correctAnswer: "Tipo definido pelo usuário para um grupo de valores relacionados",
            options: ["É um conjunto de Strings", "É um tipo especial de String", "É um operador unário do tipo prefix", "Tipo definido pelo usuário para um grupo de valores relacionados"]),
        
        (   question: "O que uma extension não pode fazer?",
            correctAnswer: "Adicionar propriedades armazenadas",
            options: ["Adicionar novas funcionalidades", "Definir novos construtores", "Adicionar propriedades armazenadas", "Adicionar propriedades computadas"]),
        
        (   question: "Quando herdamos de uma classe e queremos chamar o seu construtor, usamos...",
            correctAnswer: "super.init",
            options: ["main.init", "super.init", "self.init", "super"]),
    ]
    private var _totalQuestions: Int
    private var quiz: Quiz!
    private var _totalAnswers = 0
    private var _totalCorrectAnswers = 0
    private var answeredQuestions: [Int] = []
    
    var hasQuestion: Bool {
        return quiz != nil
    }
    var question: String {
        return quiz.question
    }
    var options: [String] {
        return quiz.options
    }
    var totalAnswers: Int {
        return _totalAnswers
    }
    var totalCorrectAnswers: Int {
        return _totalCorrectAnswers
    }
    var totalQuestions: Int {
        return _totalQuestions
    }
    init() {
        self._totalQuestions = self.quizes.count
        quizes.shuffle()
    }
    
    func refreshQuiz() {
        if quizes.count > 0 {
            let quizData = quizes.remove(at: 0)
            quiz = Quiz(question: quizData.question, options: quizData.options, correctAnswer: quizData.correctAnswer)
        } else {
            quiz = nil
        }
       
    }
    
    func validateAnswer(index: Int) {
        _totalAnswers += 1
        if quiz.validateOption(index) {
            _totalCorrectAnswers += 1
        }
    }
}
