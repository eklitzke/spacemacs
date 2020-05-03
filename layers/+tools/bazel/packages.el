;;; packages.el --- Bazel layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Evan Klitzke <evan@eklitzke.org>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
(setq bazel-packages
      '(bazel-mode))

(defun bazel/init-bazel-mode ()
  (use-package bazel-mode
    :defer t
    :mode (("BUILD\\'" . bazel-mode)
           ("\\.BUILD\\'" . bazel-mode)
           ("WORKSPACE\\'" . bazel-workspace-mode))
    :config
    (progn
      ; gross, but required bc of how bazel-mode is packaged in melpa
      (require 'bazelrc-mode)
      (setq bazel-modes '(bazel-mode bazel-workspace-mode 'bazelrc-mode
                                     'bazel-starlark-mode c-mode c++-mode))
      (dolist (mode bazel-modes)
             (spacemacs/declare-prefix-for-mode mode "mc" "compile")
             (spacemacs/declare-prefix-for-mode mode "mp" "project")
             (spacemacs/set-leader-keys-for-major-mode mode
               "cc" 'bazel-build
               "cr" 'bazel-run
               "ct" 'bazel-test)
        ))))
