(package-initialize)

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

;;; env (tell programs to use emacs as editor or pager)
(setenv "EDITOR" "emacsclient")
(setenv "PAGER" "cat")
(setenv "READER" "emacsclient")

;;; font
(set-frame-font "DejaVu Sans Mono 13" nil t)

;;; type y instead of yes for confirmation
(defalias 'yes-or-no-p 'y-or-n-p)

;;; instant kill current buffer
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)

;;; enable to remove selected text
(delete-selection-mode 1)

;;; dired settings
(setq dired-dwim-target t)

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
(global-set-key (kbd "C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)


;;; langs support
(require 'python-mode)
(require 'rust-mode)


;;; generated code
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wheatgrass))
 '(custom-safe-themes
   '("2aa073a18b2ba860d24d2cd857bcce34d7107b6967099be646d9c95f53ef3643" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "e9d47d6d41e42a8313c81995a60b2af6588e9f01a1cf19ca42669a7ffd5c2fde" "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633" "524fa911b70d6b94d71585c9f0c5966fe85fb3a9ddd635362bfabd1a7981a307" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "4aee0a939c49baa99948d9f685c134a274f3e6a46e23b76fe30dc0ddc9b0748c" "d14caf3318822360a48c0c8f4f451fd30165802e238876569dee335d91877d92" "c2e5f188670d3d83126685158d8ed305ab3a13f243132ced146c4b764586504e" "c105fd4a19da560002ec798cb88c3589b7b0449613e53cbd28ead89a46774483" "434c19477cfebbf4582c5aa8d9eb95b1b01207ccb8bd8b562d02ca77e7da31d5" "664111db1521fe3351061dc87aea95fa98b3f244f4b830fbc048d39c3a8bc125" "498ce788d0564d1effb7fbd8d83c7bf636178e4ad63afa7e05d84e68503dda38" "154a0469224ee6b1cb91796aec23a0d3ae76b50aced14af0e8352677c7482c0f" "847025d7513316abf78a6a26eb785d7979d0fa891cee2dc76d519220c30d043d" "cfb9139155392ffe48beba2f76e8b9a93a79729a3cd18feac428746c05f2dbd0" "54c3b844fe0e3076c4a20cde82d9e4890efff9831c7e88cd55f89c2b565cf2e2" "308ead333d5dfc7d64258a9d3d46f9e479e4b62bdf33a8ea8700423842cae32e" "6018f08dd19c9fa55c348eb1793deb72624861bc79197f4dcb033243ce13af59" "308fc0c8cee43c5fccf3efa360c9cdf7d6bbbebc5c2f76850f1b1c8ac8fbaca0" "b54b64550215242ad351a5c7219f1b30d2cec3d1710a2121862ae6d51c7a1c12" "75863c7d5dca60cfb927b5de5c8f39b2a9d7756c5f346990e4423aba33cb3a9d" "a0724a2dbf003213ef1bd93c7df0f07a5368399554078fc85819b2f9f6152101" "4c97de81c29f72109619ee5d755c8a8fd6890903d65124894a0ab412e45de364" "9a06ccf9adfe489bda1ba63c7e622c0f31e2b22f6b4a27118dcd4e8fbad6a282" "8b18b903355488061707df445acc97309acf4977ba40ba58bca110036e235097" "b2a3b2bbe9aea795fd23ecb46ba1fbd28988b7d528b6a1f6e7f8a1122a9025aa" "720e8768e7a9bbda94758aba8ef29314fdc51a3e22ac8146726c752fa0a97221" "1fc299974daa270e19d1b206ec40aab3a0ce35e7c6a7d389b156bcd411e41a3c" "e57ad9eb8465dcb6b85eeb2f1be11a37aee7b1f24e5f99155b39ff0679e664d5" "5d67552ed2e841039034dc8245ee1746ab4f00614366ca7018386041f9b0a96f" "5d205766ba4c831730cf88aaba6fa76cd77af631f8572cd85b661766f25fd206" "f7fe70ecf059f036813b327285e615438802980b8a477a3bbe4733aa0176c4fd" "d0ee9b8a053e336bbc9123929ca42df2e622bbef5eb63766522386a0691252ea" "a50d025e0eb240f59748be7fcd3251a4b0372071546443e57f701f8a8531b764" "038766672f29210977a0620789252a9a51ad9111fdf6617722aecb611a78275f" "a7d2594e876652f2de36e4ae18b3ffeedf89add6de587283bd6d1a09258fbc65" "f97a59acd14accb731637967de96b5c88f89ddbc49ba5adb215cbe88f7dd743b" "6d7c2881e47ee6ead20f43d6368b2c9b9a1fedbd7c9f0604de15b4c11d5b4841" "deea4f8ef106dd1d8746a6fdccf42cf504982605bd53024b0f56c4d3e4a108e4" "b19d77aca9b695b1b6219e949917160cecfa009e9901649c6b98b5d919492fee" "34de8dfc73248c0ede0efc847d88fbbaf9a247dd3109343d9c4b8a093c816410" "3f106811a7502dcca1b7b54686d3fafb2210cb9e27a8b5acbb71b8987a58fe60" "8de91e43d21b9d5cb79a146b267d29d3e377ed73888324912c7f6e514a76e5d7" "e0b2f460b6bee1d7a09b90635b2995e801ff5ac1a7aa66ea9c5674cd0bf1bb7a" "de385583975ed8e83b71b212b3094ee74785834718e2413bc3acff36224fba8d" "cbc8efdcd8e957c9ede1b4a82fed7fa1f3114ff6e7498c16f0cccb9509c1c17c" "e223120256455daba01b6c68510b48fac813acab05c314510e47aea377b23634" "ebbd4bbb0f017cb09f7a3b1363b83dfde0c5f4970cda2705419457366cd2de91" "039112154ee5166278a7b65790c665fe17fd21c84356b7ad4b90c29ffe0ad606" "3325e2c49c8cc81a8cc94b0d57f1975e6562858db5de840b03338529c64f58d1" "a0056011d7e27696f0d0f2629e40e80418eb29e2d010ddd939f026110fb89260" "ce784eb8135893a19e5553ed94cc694320b05228ce712a64b2fb69c0c54161b9" "130b47ad4ea2bc61b79e13ecb4a6e6b30351de0fea02e757f074477aa744128b" "cb8b94bca7576a8552734086b32dc1a963b91c4c8b8dac95f335f5ce7e6f9dae" "0d23ecaa8eb7cc7b6c303c484677a6cbb85a7847e1840b1c5cd6b9477f11df9e" "7d1c7ea4f3e73402f012b7011fc4be389597922fa67ad4ec417816971bca6f9d" "95b0bc7b8687101335ebbf770828b641f2befdcf6d3c192243a251ce72ab1692" "38c4fb6c8b2625f6307f3dde763d5c61d774d854ecee9c5eb9c5433350bc0bef" default))
 '(package-selected-packages
   '(python-mode rust-mode magit smex restclient multiple-cursors)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
