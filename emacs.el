;; Remove "backup.files~"
(setq make-backup-files nil)

;; use custom file
;; (setq custom-file "~/.emacs.custom.el")
;; (load-file custom-file)

;; ==[MELPA]== ;;


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq package-list '(magit multiple-cursors tree-sitter-langs tree-sitter windresize nix-mode evil lua-mode go-mode dap-mode lsp-ivy helm lsp-treemacs company flycheck lsp-ui lsp-mode base16-theme all-the-icons zig-mode transpose-frame magit treesit-auto))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
;; ==[MELPA]== ;;

;; Disable fucking warning ;;
(setq warning-minimum-level :error)

;; Smooth scroll
(setq scroll-step 1
      scroll-conservatively 10000)

;; Set Font
(add-to-list 'default-frame-alist '(font . "JetBrains Mono Nerd Font Medium 14"))
(set-face-attribute 'default nil :font "JetBrains Mono Nerd Font Medium 14")

;; HIDE SOME GRAPHICAL ELEMENTS
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message -1)
(setq inhibit-splash-screen -1)

;; DISABLE SOUND
(setq visible-bell 1)

;; Scrolloff
(setq scroll-margin 1)

;; Remove indent in some modes
(add-hook 'text-mode-hook (lambda () (electric-indent-local-mode -1)))
(add-hook 'conf-mode-hook (lambda () (electric-indent-local-mode -1)))
(add-hook 'conf-toml-mode-hook (lambda () (electric-indent-local-mode -1)))

;; Set 4 space indent in emacs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Line numbers and columns
;; (global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(setq umn-number-mode t)
(setq fill-column 80)

(defun lines-and-column (modeHook)
  (add-hook modeHook #'display-line-numbers-mode)
  (add-hook modeHook #'auto-fill-mode)
  (add-hook modeHook #'display-fill-column-indicator-mode)
  (add-hook modeHook (lambda() (setq fill-column 80)))
)

(lines-and-column 'zig-mode-hook)
(lines-and-column 'c-mode-hook)
(lines-and-column 'pascal-mode-hook)
(lines-and-column 'nix-mode-hook)
(lines-and-column 'cpp-mode-hook)
(lines-and-column 'rust-mode-hook)
(lines-and-column 'go-mode-hook)
(lines-and-column 'lua-mode-hook)
(lines-and-column 'makefile-mode-hook)
(lines-and-column 'emacs-lisp-mode-hook)

;; resize emacs frame by pixel
(setq frame-resize-pixelwise t)
(set-frame-position (selected-frame) 0 0)
(set-frame-size (selected-frame) 800 600 t)

;; prevent autoresizing windows when opening new buffers
(setq even-window-heights nil)
(setq even-window-sizes nil)

;; [(t, c)rying (to make, about) normal tabs] ;;
(setq tab-bar-close-button-show nil)        ;; hide tab close / x button
(setq tab-bar-new-tab-choice "*dashboard*") ;; buffer to show in new tabs
(setq tab-bar-format '(tab-bar-format-tabs tab-bar-separator)) ;; elements to include in bar
;; --=[(t, c)rying (to make, about) normal tabs]=-- ;;


;; ==[Emacs extra settings]== ;;
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
;; ==[Emacs extra settings]== ;;

;; Autoclose brackets ;;
(electric-pair-mode 1)
(setq electric-pair-preserve-balance nil)
;; Autoclose brackets ;;

;; THEME ;;
;; (load-theme 'base16-catppuccin-mocha t)
(load-theme 'base16-gruvbox-dark-medium t)
;; THEME ;;

;; Multiple cursors ;;
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-lpike-this)
;; Multiple cursors ;;

;; Custom keybinds ;;
(global-set-key (kbd "C-x e") 'evil-mode)

(global-set-key (kbd "M-<f4>") 'compile)
(global-set-key (kbd "<f4>") (kbd "C-u M-x compile"))

(global-set-key (kbd "<f5>") 'desktop-save-in-desktop-dir)
(global-set-key (kbd "<f6>") 'desktop-change-dir)

(global-set-key (kbd "<f7>") 'windresize)
(global-set-key (kbd "<f8>") 'transpose-frame)
(global-set-key (kbd "<f10>") 'save-buffers-kill-emacs)
(global-set-key (kbd "S-<f10>") (lambda () (interactive) (desktop-save-in-desktop-dir) (save-buffers-kill-emacs)))

;; Custom keybinds ;;

;; MARKDOWN SETTINGS ;;
;; Native syntax highlighting of code block ;;
(setq markdown-fontify-code-blocks-natively t)
(add-hook 'markdown-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'markdown-mode-hook (lambda () (markdown-toggle-markup-hiding t)))
;; MARKDOWN SETTINGS ;;

;; All the icons ;;
(when (display-graphic-p)
  (require 'all-the-icons))
;; All the icons ;;

;; ==[LSP]== ;;

;; Enables lsp in chosen languages ;;
(require 'lsp-mode)
(defun lsp-and-tree (modeHook)
  (add-hook modeHook #'lsp)
  (add-hook modeHook #'tree-sitter-hl-mode))

(lsp-and-tree 'cpp-mode-hook)
(lsp-and-tree 'c-mode-hook)
(lsp-and-tree 'zig-mode-hook)
(lsp-and-tree 'lua-mode-hook)
(lsp-and-tree 'go-mode-hook)
(lsp-and-tree 'rust-mode-hook)

(add-hook 'pascal-mode-hook #'tree-sitter-hl-mode)
(add-hook 'sh-mode-hook #'tree-sitter-hl-mode)


;; Lsp UI ;;
(setq lsp-ui-doc-enable 1)
(setq lsp-ui-doc-position 'at-point)
(setq lsp-ui-doc-side 'right)
(setq lsp-ui-doc-show-with-cursor 1)

;; flycheck ;;
(global-flycheck-mode +1) ;; does it usefull ??

;; company-mode ;;
(add-hook 'after-init-hook 'global-company-mode)

;; dap-mode ;;
(dap-mode 1)

;; tree-sitter ;;
(require 'tree-sitter)
(require 'tree-sitter-langs)

;; below optional modes
(dap-ui-mode 1)
(dap-tooltip-mode 1) ;; enables mouse hover support
(tooltip-mode 1)
(dap-ui-controls-mode 1)

;; vscode-cpptools
(require 'dap-cpptools)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("0deba21a79a993751cf1aa89e4d52feee50142e75f913088b3d8c20d000821e0"
     "dea106ab256a8017a325f51f01b1131915989fa25db48eb831ffb18dac8ecd39"
     "6ed98f47da7556a8ce6280346e5d8e1e25bede71dc5186aa2654b93bec42d2a6"
     "1cfbec19edafb831c7729be2f6454ec019c21b9a54b39b3bb5ec276a6b21d484"
     "3f48acc0b6cbedc3126e25eaad128f580d445654eab6602373061cb793ce58c7" default))
 '(package-selected-packages
   '(all-the-icons base16-theme company dap-mode evil flycheck go-mode helm
                   i3wm-config-mode json-mode lsp-ivy lsp-ui lua-mode magit
                   multiple-cursors nix-mode nushell-mode rust-mode
                   transpose-frame tree-sitter-langs treesit-auto windresize
                   zig-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
