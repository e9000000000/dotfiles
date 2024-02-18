(server-start)
(package-initialize)


;;; if windows
(when
    (eq system-type 'windows-nt)

    ;;; set home path (link (mklink) .emacs and .emacs.d from home to home/Appdata/Roaming)
    (setenv "HOME" "C:/Users/e")
    (setq default-directory "~/")

    (set-frame-font "Courier New-12" nil t))

;;; if not windows
(when
    (not (eq system-type 'windows-nt))
  (set-frame-font "Hack 12" nil t))


(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(delete-selection-mode 1)
(fido-mode 1)
(windmove-default-keybindings)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)

(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq inhibit-startup-screen t)
(setq split-width-threshold nil)
(setq frame-resize-pixelwise t)
(setq dired-dwim-target t)
(setq dired-listing-switches "-alFh")
(setq scroll-margin 12)
(setq compile-command "")
(setq grep-command "")
(setq grep-use-null-device nil)

(global-set-key (kbd "C-x C-k") 'kill-this-buffer)
(global-set-key (kbd "C-,") 'duplicate-line)

(setenv "EDITOR" "emacsclient")
(setenv "PAGER" "cat")
(setenv "READER" "emacsclient")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'spaceway-theme)
(load-theme 'spaceway t)

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
(setq vterm-max-scrollback 100000)
(global-set-key (kbd "C-.") 'multi-vterm)
(define-key vterm-mode-map (kbd "<C-.>") 'multi-vterm)
(add-hook
 'vterm-mode-hook
 (lambda() (setq show-trailing-whitespace nil)))


(require 'restclient)
(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))

(require 'wgrep)
(require 'magit)
