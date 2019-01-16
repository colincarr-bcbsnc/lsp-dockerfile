;;; lsp-dockerfile.el --- Dockerfile support for lsp-mode  -*- lexical-binding: t; -*-

;; Copyright (C) 2018 Vibhav Pant <vibhavp@gmail.com>

;; Author: Vibhav Pant <vibhavp@gmail.com>
;; Version: 1.0
;; Package-Requires: ((emacs "25") (lsp-mode "4.2") (dockerfile-mode "1.2"))
;; Keywords: languages, docker, lsp
;; URL: https://github.com/emacs-lsp/lsp-dockerfile

;;; Commentary:

;; Dockerfile support for lsp-mode using the Dockerfile Language Server.
;; Enable using (add-hook 'dockerfile-mode-hook #'lsp-dockerfile-enable)

;;; Code:

(require 'lsp-mode)
(require 'dockerfile-mode)

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection `("docker-langserver" "--stdio"))
                  :major-modes '(dockerfile-mode)
                  :server-id 'Docker))

(provide 'lsp-dockerfile)
;;; lsp-dockerfile.el ends here
