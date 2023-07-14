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

;;; instant kill current buffer
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)

;;; enable to remove selected text
(delete-selection-mode 1)

;;; dired settings
(setq dired-dwim-target t)
(add-hook 'dired-mode-hook
      (lambda ()
        (dired-hide-details-mode)))

;;; title
(setq frame-title-format "nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger nigger")

;;; font
; (set-frame-font "Courier New-12" nil t)

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

;;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;;; generated code
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(ir-black))
 '(custom-safe-themes
   '("38c4fb6c8b2625f6307f3dde763d5c61d774d854ecee9c5eb9c5433350bc0bef" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
