;;; elisp
(setq load-path (cons "~/.emacs.d/elisp" load-path)) 
(setq load-path (cons "~/.emacs.d/elisp/apel-10.8/" load-path))
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

;;; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp/")
; (setq auto-install-use-wget nil)
; (auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;;; set Path
;; (when (and (file-exists-p dir) (not (member dir exec-path)))
;;   (setenv "PATH"　(concat dir ":" (getenv "PATH")))
;;   (setq exec-path (append (list dir) exec-path)))

;;; ElScreen
(require 'elscreen)
(setq elscreen-prefix-key "\C-o")
(load "elscreen" "ElScreen" t)

;;; gtags
(when (locate-library "gtags") (require 'gtags)) 
(global-set-key "\M-t" 'gtags-find-tag)
(global-set-key "\M-r" 'gtags-find-rtag)
(global-set-key "\M-s" 'gtags-find-symbol)
(global-set-key "\M-f" 'gtags-find-file)
(global-set-key "\C-t" 'gtags-pop-stack)
(add-hook 'gtags-select-mode-hook 'hi-line-mode)
(add-hook 'c-mode-common-hook
	  '(lambda ()
		(gtags-mode 1)
		(gtags-make-complete-list)))

;;; color-moccur
(load "color-moccur")
(setq dmoccur-recursive-search t)
(setq moccur-grep-default-word-near-poit t)
(setq moccurt-split-word t)
(setq dmoccur-exclusion-mask (append '("\\~$" "\\.svn\\/\*" "\\.git\\/\*" "\\.o$"
					"GPATH" "GRTAGS" "GSYMS" "GTAGS")
					dmoccur-exclusion-mask))

;;; color-grep
(require 'color-grep)
(setq color-grep-sync-kill-buffer t)
(setq grep-find-command "ack --nocolor --nogroup ")

;;; Anything
(require 'anything)
(setq anything-sources
      '(anything-c-source-buffers+
;	anything-c-source-colors
	anything-c-source-recentf
	anything-c-source-man-pages
	anything-c-source-emacs-commands
	anything-c-source-emacs-functions
	anything-c-source-files-in-current-dir))
(require 'recentf)
(setq recentf-max-saved-items 1000)
(recentf-mode 1)

(require 'anything-startup)
(dolist (map (list
              anything-map
              anything-c-buffer-map
              anything-find-files-map
              anything-c-read-file-map
              anything-generic-files-map
              anything-c-grep-map
              anything-c-pdfgrep-map
              anything-c-etags-map
;              anything-eval-expression-map
;              anything-c-ucs-map
;              anything-c-bookmark-map
;             anything-esh-on-file-map
              ))
  (define-key map (kbd "C-h") 'delete-backward-char)
  (define-key map (kbd "C-w") 'backward-kill-word)
  )
;; (global-set-key (kbd "C-x a a") 'anything-apropos)
;; (global-set-key (kbd "C-x b") 'anything-for-files)
;; (require 'anything-c-moccur)
;; (global-set-key (kbd "C-; C-s") 'anything-c-moccur-occur-by-moccur)
;; (define-key isearch-mode-map (kbd "C-o") 'anything-c-moccur-from-isearch)
;; ;(setq anything-samewindow nil)
;; ;(push '("*anything*" :regexp t :height 20) popwin:special-display-config)
;; (setq recentf-max-saved-items 500)
;; (setq enable-recursive-minibuffers t)
;; ;; バッファに対しては、カーソルを合わせただけで中身を表示する
;; (defun-add-hook 'anything-move-selection-after-hook
;;   (when (eq (cdr (assq 'type (anything-get-current-source))) 'buffer)
;;     (anything-execute-persistent-action)))

(require 'anything-gtags)

;;; blink cursor
(blink-cursor-mode t)

;;; delete scroll bar
(set-scroll-bar-mode nil)

;;; window
(set-frame-parameter (selected-frame) 'alpha '(80 70))
(set-background-color "Black")
(set-foreground-color "LightGray")
(setq initial-frame-alist
      (append (list
	       '(width . 205)
	       '(height . 65)
	       '(top . 0)
	       '(left . 0)
	       )))
(setq inhibit-splash-screen t)
 
;;; beap ignore
(setq ring-bell-function 'ignore)

;;; undo limit
(setq undo-limit 600000)
(setq undo-strong-limit 900000)

;;; Language
;(set-language-environment "Japanese")
;(set-terminal-coding-system 'sjis)
;(set-buffer-file-coding-system 'sjis)
;(set-keyboard-coding-system 'sjis)


;;; coloring
(global-font-lock-mode t)
;(setq font-lock-support-mode 'fast-lock-mode)
(setq font-lock-maximum-decoration t)
(setq fast-lock-cache-directories '("~/.emacs-flc" "."))

;;; key bind
(define-key global-map (kbd "C-;") 'anything) ; anything
(define-key global-map "\C-h" 'delete-backward-char) ; delete
(define-key global-map "\C-z" 'undo) ; undo
(define-key global-map "\C-x \C-c" 'save-buffers-kill-emacs) ;save and exit
;(define-key global-map "\C-@" 'set-mark-command) ; set-mark
(define-key global-map "\C- " 'set-mark-command) ; set-mark
;(define-key global-map "\C-o" 'set-mark-command) ; set-mark
(define-key global-map [?¥] [?\\])


;;; auto-complete
;(require 'auto-complete)
;(global-auto-complete-mode t)

;;; line number
(require 'linum)
(global-linum-mode t)

;;;
;;; SCIM-Anthy
;(require 'scim-bridge)
;(require 'scim-bridge-ja)
;(add-hook 'after-init-hook 'scim-mode-on)
;(scim-define-common-key ?\C-\  nil)
;(scim-define-common-key ?\C-j t)
;(setq scim-cursor-color '("red" "blue" "limegreen")


;;; Yatex
(setq auto-mode-alist
	(cons	(cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq load-path
	(cons	(expand-file-name
		 "~/yatex1.74") load-path))
;; 0: no-conversion
;; 1: Shift JIS (win & dos)
;; 2: ISO-2022-JP (other)
;; 3: EUC
;; 4: UTF-8
(setq YaTeX-kanji-code 4)

;; c-mode, c++-mode
(add-hook 'c-mode-common-hook
	  '(lambda ()
		(setq c-basic-offset 4)
))
;; c#-mode
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist (cons '("\\.cs$" . csharp-mode) auto-mode-alist))
	
