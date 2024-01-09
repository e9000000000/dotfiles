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

    ;;; title
    (setq frame-title-format "NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER")

    ;;; font
    (set-frame-font "Courier New-12" nil t))

;;; if not windows
(when
    (not (eq system-type 'windows-nt))
    ;;; font
  (set-frame-font "DejaVu Sans Mono 13" nil t))


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

;; Show trailing space:
(setq-default show-trailing-whitespace t)

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

;;; +melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;;; ido
(require 'ido-completing-read+)
(ido-mode 1)
(ido-ubiquitous-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

;;; smex
(require 'smex)
(global-set-key (kbd "M-x") 'smex)

;;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c")       'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;;; move text
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;;; duplicate line
(global-set-key (kbd "C-,") 'duplicate-line)

;;; empty compile command by default
(setq compile-command "")

;;; git grep by default
(setq grep-command "git grep -rniF '")
(setq grep-use-null-device nil)

;;; no tabs, only spaces
(setq-default indent-tabs-mode nil)

;;; auto activate restclient-mode
(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))


;;; debugger reisze variables window
(defun set-locals-window-size-half-half ()
  (interactive)
  (setq locals-window (seq-elt
                       (seq-filter
                        (lambda (x)
                          (cl-search "dape-info" (buffer-name (window-buffer x))))
                        (window-list))
                       0))
  (window-resize locals-window (+ (- (/ (frame-width) 2) (window-total-width locals-window)) 1) t)
  (window-resize locals-window (- (/ (frame-height) 2) (window-height locals-window))))

;;; debuger
;;; config examples: https://github.com/svaante/dape/wiki
;;; debugpy: https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
(use-package dape
  :config
  (add-hook 'dape-on-stopped-hooks 'set-locals-window-size-half-half)
  (add-to-list 'dape-configs
               `(file
                 modes (python-mode)
                 command "python3"
                 command-args ("-m", "debugpy.adapter")
                 :type "executable"
                 :request "launch"
                 :console "integratedTerminal"
                 :cwd dape-cwd-fn
                 :program dape-find-file-buffer-default))
  (add-to-list 'dape-configs
               `(file-env
                 modes (python-mode)
                 command "python3"
                 command-args ("-m", "debugpy.adapter")
                 :python (lambda () (expand-file-name (read-file-name "Python: ")))
                 :type "executable"
                 :request "launch"
                 :console "integratedTerminal"
                 :cwd dape-cwd-fn
                 :program dape-find-file-buffer-default))
  (add-to-list 'dape-configs
               `(uvicorn-env
                 modes (python-mode)
                 command "python3"
                 command-args ("-m", "debugpy.adapter")
                 :python (lambda () (expand-file-name (read-file-name "Python: ")))
                 :type "module"
                 :request "launch"
                 :console "integratedTerminal"
                 :cwd dape-cwd-fn
                 :module "uvicorn"
                 :args ["--host" "127.0.0.1" "--port" "8000" "main:app"]))
  (add-to-list 'dape-configs
               `(remote
                 modes (python-mode)
                 host (lambda () (read-string "Host: " "localhost"))
                 port (lambda () (read-number "Port: " 5678))
                 :request "attach"
                 :type "python"
                 :pathMappings [(:localRoot (lambda ()
                                              (read-directory-name "Local source directory: "
                                                                   (funcall dape-cwd-fn)))
                                            :remoteRoot (lambda ()
                                                          (read-string "Remote source directory: ")))]))

  ;; for rust-mode
  ;; https://github.com/vadimcn/codelldb/releases
  ;; Download latest vsix release for your platform `codelldb-<platform>-<os>.vsix`
  ;; Unpack `mkdir -p ~/.emacs.d/debug-adapters && unzip codelldb-<platform>-<os>.vsix -d ~/.emacs.d/debug-adapters/codelldb`
)



;;; generated code
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(spaceway))
 '(custom-safe-themes
   '("b9b9e48eee0fcf0fda026553a33526b7827877eba8ba05e809ea5f0e9140cf59" default))
 '(package-selected-packages
   '(dape wgrep rust-mode go-mode ido-completing-read+ move-text spaceway-theme magit smex restclient multiple-cursors)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
