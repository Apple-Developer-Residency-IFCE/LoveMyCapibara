//
//  SettingsViewModel.swift
//  LoveMyCapibara
//
//  Created by Isaias Dimitri on 26/07/23.
//
import SwiftUI

final class SettingsViewModel: ObservableObject {
    @Published var isON = false
    @AppStorage("notification") var notificationsStatus: Bool = false

    init() {
            isON = notificationsStatus
        }

    func allowNotification(noticationValue: Bool) {
            if noticationValue {
                notificationsStatus = true
                checkNotificationPermission(showAlert: true)
            } else {
                notificationsStatus = false
                checkNotificationPermission(showAlert: false)
            }
        }

        func checkNotificationPermission(showAlert: Bool) {
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                DispatchQueue.main.async {
                    if (settings.authorizationStatus == .denied) {
                        if showAlert {
                            self.showSettingsAlert()
                        } else {
                            self.isON = false
                        }
                    }
                }
            }
        }
    private func showSettingsAlert() {
        let alert = UIAlertController(title: "Mudar permissão em Ajustes?",
                                      message: "Clicar em \"sim\" o levara para Ajustes.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Não", style: .default) { _ in
            self.isON.toggle()
        })
        alert.addAction(UIAlertAction(title: "Sim", style: .default) { _ in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl)
            }
        })
        if let window = UIApplication.shared.windows.first {
            if let rootViewController = window.rootViewController {
                rootViewController.present(alert, animated: true, completion: nil)
            }
        }
    }
}
