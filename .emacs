(package-initialize)

;;; remove trash
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq inhibit-startup-screen t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(setq split-width-threshold nil)

;;; set home path
(setenv "HOME" "C:/Users/e")
(setq default-directory "~/")

;;; instant kill current buffer
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)

;;; enable to remove selected text
(delete-selection-mode 1)

;;; title
(setq frame-title-format "NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER")

;;; font
(set-frame-font "Courier New-12" nil t)

;;; alpha
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

;;; utf-8
(if (eq system-type 'windows-nt)
    (progn
      (set-clipboard-coding-system 'utf-16-le)
      (set-selection-coding-system 'utf-16-le))
  (set-selection-coding-system 'utf-8))
(setq default-buffer-file-coding-system 'utf-8)
(setq-default coding-system-for-read 'utf-8)
(setq-default coding-system-for-write 'utf-8)
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;; grep search
(eval-after-load 'grep
  '(progn
     (add-to-list 'grep-find-ignored-directories ".gin")
     (add-to-list 'grep-find-ignored-directories "node_modules")
     (add-to-list 'grep-find-ignored-directories ".env")))

;;; ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;; +melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;;; smex
(require 'smex)
(global-set-key (kbd "M-x") 'smex)

;;; move text
(require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;;; what is it for?
(defvar tra-ta-ta-timer nil
  "Timer object for tra ta ta func.")

(defun tra-ta-ta ()
  (interactive)
  (goto-char (random (point-max)))
  (message ""))

(defun toggle-tra-ta-ta ()
  (interactive)
  (if tra-ta-ta-timer
      (progn
        (cancel-timer tra-ta-ta-timer)
        (setq tra-ta-ta-timer nil)
        (message "d"))
    (setq tra-ta-ta-timer
          (run-with-timer 0 (* 1 30) 'tra-ta-ta))
    (message "e")))

(global-set-key (kbd "C-c r") 'toggle-tra-ta-ta)

;;; generated code
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(ir-black))
 '(custom-safe-themes
   '("7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633" "d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "95b0bc7b8687101335ebbf770828b641f2befdcf6d3c192243a251ce72ab1692" "5642b25b6df4d6b63787cbc3d3ef07ca4cb7b0a7a00740ce8e9867c00e57632f" "d548ac4bb4c8c0ba8f22476f5afcea11b7f1754065eefb118e1324f8a74883fb" "1c9ba588b7dedc017c5ee7fab0b9c74595a622d94298d9b79633a55091bed503" "45e76a1b1e3bd74adb03192bf8d6eea2e469a1cf6f60088b99d57f1374d77a04" "ebd6fc300de1edea826a49e702367d52d371ac3186cb6aa308acdcf4e08704d4" default))
 '(package-selected-packages
   '(flucui-themes magit ejc-sql powershell tr-ime ## ir-black-theme smex multiple-cursors move-text)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
