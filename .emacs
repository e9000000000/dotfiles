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
(global-set-key (kbd "C-j") 'recompile)
(setq compile-command "")
(setq grep-command "")
(setq grep-use-null-device nil)
(fido-mode 1)
(set-frame-parameter nil 'alpha-background 90)
(add-to-list 'default-frame-alist '(alpha-background . 90))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(use-package spaceway-theme
  :ensure t)
(load-theme 'spaceway t)
(set-cursor-color "#aa0000")

(use-package multiple-cursors
  :ensure t)
(global-set-key (kbd "C-S-c")       'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-x C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

(use-package move-text
  :ensure t)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

(use-package restclient
  :ensure t)
(setq restclient-inhibit-cookies 1)
(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))

(use-package wgrep
  :ensure t)

(use-package magit
  :ensure t)
(global-set-key (kbd "C-.") 'magit)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(use-package vterm
  :ensure t)
(add-hook
 'vterm-mode-hook
 (lambda() (setq show-trailing-whitespace nil)))

(use-package vterm-toggle
  :ensure t)
(global-set-key (kbd "C-=") 'vterm-toggle)
(global-set-key (kbd "C-+") 'vterm-toggle-insert-cd)
(setq vterm-toggle-fullscreen-p nil)
(add-to-list 'display-buffer-alist
             '((lambda (buffer-or-name _)
                 (let ((buffer (get-buffer buffer-or-name)))
                   (with-current-buffer buffer
                     (or (equal major-mode 'vterm-mode)
                         (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
			   (display-buffer-reuse-window display-buffer-same-window)))

(use-package python-mode
  :ensure t)
(use-package yaml-mode
  :ensure t)
(use-package zig-mode
  :ensure t)
