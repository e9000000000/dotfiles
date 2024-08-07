(server-start)
(package-initialize)


;;; if windows
(when
    (eq system-type 'windows-nt)

    (setenv "HOME" "C:/Users/e")
    (setq default-directory "~/")
    (set-frame-font "Courier New-12" nil t))

;;; if not windows
(when
    (not (eq system-type 'windows-nt))

  (set-frame-font "Liberation Mono 12" nil t))


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
(setenv "EDITOR" "emacsclient")
(setenv "PAGER" "cat")
(setenv "READER" "emacsclient")
(setq-default tab-width 4)
(setq scroll-margin 12)
(setq-default show-trailing-whitespace t)
(defalias 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)
(windmove-default-keybindings)
(delete-selection-mode 1)
(setq dired-dwim-target t)
(setq dired-listing-switches "-alFh")
(global-set-key (kbd "C-,") 'duplicate-line)
(setq compile-command "")
(setq grep-command "")
(setq grep-use-null-device nil)
(set-frame-parameter nil 'alpha-background 90)
(add-to-list 'default-frame-alist '(alpha-background . 90))
(fido-mode 1)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'ir-black-theme)
(load-theme 'ir-black t)

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

(require 'restclient)
(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))

(require 'wgrep)

(require 'magit)
(global-set-key (kbd "C-.") 'magit)
