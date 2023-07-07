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

;;; opacity
(set-frame-parameter (selected-frame) 'alpha '(90 . 50))
(add-to-list 'default-frame-alist '(alpha . (90 . 50)))

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
(setq frame-title-format "NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER NIGGER")

;;; font
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-14"))


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


;;; fix darkokai extra large status bar
(defcustom darkokai-mode-line-padding 1
  "govna"
  :type 'number
  :group 'darkokai)


;;; generated code
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(ir-black))
 '(custom-safe-themes
   '("00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "24168c7e083ca0bbc87c68d3139ef39f072488703dcdd82343b8cab71c0f62a7" "fb83a50c80de36f23aea5919e50e1bccd565ca5bb646af95729dc8c5f926cbf3" "e3a1b1fb50e3908e80514de38acbac74be2eb2777fc896e44b54ce44308e5330" "b6269b0356ed8d9ed55b0dcea10b4e13227b89fd2af4452eee19ac88297b0f99" "b02eae4d22362a941751f690032ea30c7c78d8ca8a1212fdae9eecad28a3587f" "c8b83e7692e77f3e2e46c08177b673da6e41b307805cd1982da9e2ea2e90e6d7" "72ab4b4798c907c344ce899aee4a70c72672f219892d50b6165a72f7c2082888" "e9d47d6d41e42a8313c81995a60b2af6588e9f01a1cf19ca42669a7ffd5c2fde" "37c8c2817010e59734fe1f9302a7e6a2b5e8cc648cf6a6cc8b85f3bf17fececf" "eb02853c4a789d2cd00cc0c6e8e37532690fe70b5fddfc24e259f291048c5ad1" "af6eadd1a505f157d15142db4640058df3c1a2c9c2d39b1b3271b568c21aa303" "38c4fb6c8b2625f6307f3dde763d5c61d774d854ecee9c5eb9c5433350bc0bef" "3860a842e0bf585df9e5785e06d600a86e8b605e5cc0b74320dfe667bcbe816c" "a77735fe0193d57476298d982de95c51f1625da7aa4a07473be8143cf3326dc2" "8208e06e501222a607b7d46cc4eb828dcc5f0df10ca0b1ce5f39be7940fa1235" "5bbe9bdc0ef79c90f171914acb71ab4f226b25c226c098f9b289dc332e1207a5" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633" "d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "95b0bc7b8687101335ebbf770828b641f2befdcf6d3c192243a251ce72ab1692" "5642b25b6df4d6b63787cbc3d3ef07ca4cb7b0a7a00740ce8e9867c00e57632f" "d548ac4bb4c8c0ba8f22476f5afcea11b7f1754065eefb118e1324f8a74883fb" "1c9ba588b7dedc017c5ee7fab0b9c74595a622d94298d9b79633a55091bed503" "45e76a1b1e3bd74adb03192bf8d6eea2e469a1cf6f60088b99d57f1374d77a04" "ebd6fc300de1edea826a49e702367d52d371ac3186cb6aa308acdcf4e08704d4" default))
 '(package-selected-packages '(restclient smex multiple-cursors)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
