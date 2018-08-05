(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Force org install from latest mainline branch
(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(use-package org :ensure org-plus-contrib :pin org)

(server-mode)
(add-hook 'server-switch-hook
          (lambda ()
            (when (current-local-map)
              (use-local-map (copy-keymap (current-local-map))))
	    (when server-buffer-clients
	      (local-set-key (kbd "C-x z") 'server-edit))))

(setq ispell-dictionary "english")

