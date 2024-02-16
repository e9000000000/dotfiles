;; ▓█████  ███▄ ▄███▓ ▄▄▄       ▄████▄    ██████
;; ▓█   ▀ ▓██▒▀█▀ ██▒▒████▄    ▒██▀ ▀█  ▒██    ▒
;; ▒███   ▓██    ▓██░▒██  ▀█▄  ▒▓█    ▄ ░ ▓██▄
;; ▒▓█  ▄ ▒██    ▒██ ░██▄▄▄▄██ ▒▓▓▄ ▄██▒  ▒   ██▒
;; ░▒████▒▒██▒   ░██▒ ▓█   ▓██▒▒ ▓███▀ ░▒██████▒▒
;; ░░ ▒░ ░░ ▒░   ░  ░ ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▓▒ ▒ ░
;;  ░ ░  ░░  ░      ░  ▒   ▒▒ ░  ░  ▒   ░ ░▒  ░ ░
;;    ░   ░      ░     ░   ▒   ░        ░  ░  ░
;;    ░  ░       ░         ░  ░░ ░            ░
;;                             ░


(server-start)
(package-initialize)


;;; if windows
(when
    (eq system-type 'windows-nt)

    ;;; set home path (link (mklink) .emacs and .emacs.d from home to home/Appdata/Roaming)
    (setenv "HOME" "C:/Users/e")
    (setq default-directory "~/")

    ;;; font
    (set-frame-font "Courier New-12" nil t))

;;; if not windows
(when
    (not (eq system-type 'windows-nt))
    ;;; font
  (set-frame-font "Hack 12" nil t))


;;; remove trash
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq inhibit-startup-screen t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(setq split-width-threshold nil)
(setq frame-resize-pixelwise t)

;;; env (tell programs to use emacs as editor or pager)
(setenv "EDITOR" "emacsclient")
(setenv "PAGER" "cat")
(setenv "READER" "emacsclient")

;;; tab width
(setq-default tab-width 4)

;;; space between top/bottom and cursor
(setq scroll-margin 12)

;; Show trailing space:
(setq-default show-trailing-whitespace t)
(add-hook
 'vterm-mode-hook
 (lambda() (setq show-trailing-whitespace nil)))

;;; type y instead of yes for confirmation
(defalias 'yes-or-no-p 'y-or-n-p)

;;; instant kill current buffer
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)

;;; switch between multiple windows with Shift + arrows
(windmove-default-keybindings)

;;; enable to remove selected text
(delete-selection-mode 1)

;;; dired settings
(setq dired-dwim-target t)
(setq dired-listing-switches "-alFh")

;;; duplicate line
(global-set-key (kbd "C-,") 'duplicate-line)

;;; empty grep and compile command by default
(setq compile-command "")
(setq grep-command "")
(setq grep-use-null-device nil)

;;; no tabs, only spaces
(setq-default indent-tabs-mode nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'spaceway-theme)
(load-theme 'spaceway t)

(require 'ido-completing-read+)
(ido-mode 1)
(ido-ubiquitous-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

(require 'smex)
(global-set-key (kbd "M-x") 'smex)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c")       'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-x C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

(require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

(require 'vterm)
(require 'multi-vterm)
(global-set-key (kbd "C-.") 'multi-vterm)
(define-key vterm-mode-map (kbd "<C-.>") 'multi-vterm)

(require 'restclient)
(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))

(require 'wgrep)
(require 'magit)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(wgrep spaceway-theme smex rust-mode restclient multiple-cursors multi-vterm move-text magit ido-completing-read+)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
