//
//  ViewController.swift
//  CounterTestGit
//
//  Created by Artem Dubovitsky on 11.05.2024.
//
import UIKit

final class ViewController: UIViewController {
    // MARK: - Private properties
    private var count = 0
    
    // MARK: - UI-Elements
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Нажми кнопку)"
        label.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        label.textColor = .black
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        label.textColor = .black
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var counterAddButton: UIButton = {
        let button = UIButton()
        button.setTitle("Увеличить значение", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        button.setTitleColor(.blue, for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.addTarget(self, action: #selector(didTabCounertButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        setupConstrains()
    }
    
    // MARK: - Setup View
    private func addSubviews() {
        [label, counterLabel, counterAddButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            counterLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            counterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            counterLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            counterAddButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            counterAddButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            counterAddButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            counterAddButton.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    // MARK: - Private Methods
    private func changeCount() {
        count += 1
        counterLabel.text = "Значение счетчика:\n\(count)"
    }
    
    // MARK: - Actions
    @objc private func didTabCounertButton() {
        changeCount()
    }
}
