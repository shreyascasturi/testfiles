(package-initialize)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
             ("melpa-stable" . "https://stable.melpa.org/packages/")))

(global-set-key (kbd "C-x g") 'magit-status)

(defun my-asm-mode-hook ()
  ;; you can use `comment-dwim' (M-;) for this kind of behaviour anyway
  (local-unset-key (vector asm-comment-char))
  ;; asm-mode sets it locally to nil, to "stay closer to the old TAB behaviour".
  (setq tab-always-indent (default-value 'tab-always-indent)))

(add-hook 'asm-mode-hook #'my-asm-mode-hook)

(require 'doom-themes)

;;(load "auctex.el" nil t t)
;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-molokai t)

;; r-mode for ISYE 3770
(require 'ess-r-mode)

;;python2.7 for CS 3600
(setq python-shell-interpreter "/usr/bin/python2.7")
;; go mode indentation, 4 spaces as usual.
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))

(setq LaTeX-item-indent 0)
;; clear command with eshell.
(defun eshell/clear ()
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)np
    (eshell-send-input)))

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; changing comment color
(set-face-foreground 'font-lock-comment-face "indian red")

;; smooth scrolling
(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
    (setq-default scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

;; basic set ups
(show-paren-mode 1)
(global-linum-mode 1)
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

(electric-pair-mode 1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; (defun my-LaTeX-mode()
;;   (add-to-list 'TeX-view-program-list '("Evince" "evince --page-index=%(outpage) %o"))
;;   (setq TeX-view-program-selection '((output-pdf "Evince")))
;;   ; Other mode specific config
;;   )
;; (add-hook 'LaTeX-mode-hook 'my-LaTeX-mode)


(setq TeX-auto-save t)
(setq TeX-parse-self t)

;;(ac-config-default)
;;(add-to-list 'ac-modes 'java-mode)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(defun shell-other-window ()
  "Open a 'shell' in a new window."
  (interactive)
  (let ((buf (shell)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))

(require 'fill-column-indicator)
(setq fci-rule-column 80)
(setq fci-rule-width 2)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)


(setq TeX-view-program-selection
 '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
 '(("PDF Viewer" "okular --unique %o#src:%n%b")))

;;(load-theme 'tron t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-indent-level 4)
 '(TeX-PDF-mode t)
 '(TeX-newline-function (quote newline-and-indent))
 '(TeX-source-correlate-method (quote ((dvi . source-specials) (pdf . synctex))))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-selection
   (quote
    (((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Okular")
     (output-html "xdg-open"))) t)
 '(ansi-color-names-vector
   ["#f2f2f2" "#c82829" "#718c00" "#eab700" "#3e999f" "#c9b4cf" "#8abeb7" "#000000"])
 '(custom-safe-themes
   (quote
    ("1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" default)))
 '(fci-rule-color "#a3a1a1")
 '(font-use-system-font t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (minimap ## highlight-indent-guides json-mode pandoc-mode ess pandoc go-mode encourage-mode markdown-mode solaire-modpe doom-themes magit auctex auto-complete fill-column-indicator)))
 '(python-shell-interpreter "python2.7" t)
 '(show-paren-mode t)
 '(vc-annotate-background "#ffffff")
 '(vc-annotate-color-map
   (list
    (cons 20 "#718c00")
    (cons 40 "#999a00")
    (cons 60 "#c1a800")
    (cons 80 "#eab700")
    (cons 100 "#eda70a")
    (cons 120 "#f19714")
    (cons 140 "#f5871f")
    (cons 160 "#e69659")
    (cons 180 "#d7a594")
    (cons 200 "#c9b4cf")
    (cons 220 "#c88597")
    (cons 240 "#c85660")
    (cons 260 "#c82829")
    (cons 280 "#bf4748")
    (cons 300 "#b66667")
    (cons 320 "#ad8586")
    (cons 340 "#a3a1a1")
    (cons 360 "#a3a1a1")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1D252C" :foreground "#A0B3C5" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "PfEd" :family "Iosevka Regular")))))
(put 'narrow-to-page 'disabled nil)
