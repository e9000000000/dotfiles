(package-initialize)

;;; remove trash
(setq make-backup-files nil)
(setq inhibit-startup-screen t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(setq split-width-threshold nil)

;;; font
(set-frame-font "DejaVu Sans Mono-12" nil t)

;;; alpha
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

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

;;; python-mode
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;;; generated code
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(ir-black))
 '(custom-safe-themes
   '("45e76a1b1e3bd74adb03192bf8d6eea2e469a1cf6f60088b99d57f1374d77a04" "ebd6fc300de1edea826a49e702367d52d371ac3186cb6aa308acdcf4e08704d4" default))
 '(package-selected-packages
   '(python-mode ir-black-theme multiple-cursors move-text magit smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
