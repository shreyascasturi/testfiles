;;; encourage-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "encourage-mode" "encourage-mode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from encourage-mode.el

(defvar encourage-mode t "\
Non-nil if Encourage mode is enabled.
See the `encourage-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `encourage-mode'.")

(custom-autoload 'encourage-mode "encourage-mode" nil)

(autoload 'encourage-mode "encourage-mode" "\
A whimsical mode that adds just a little bit of encouragement throughout your day.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "encourage-mode" '("encourage-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; encourage-mode-autoloads.el ends here
