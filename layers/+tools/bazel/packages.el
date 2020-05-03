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

(setq bazel-packages '(bazel-mode))

(defun bazel/init-bazel-mode ()
  (use-package bazel-mode
    :init
    (progn
      ;; These are provided as part of the bazel-mode package in MELPA, but
      ;; aren't automatically required by bazel-mode.
      (require 'bazel-build)
      (require 'bazelrc-mode)

      ;; Major modes to add keybindings to; bazel supports a few other
      ;; languages, but c/c++, python, and java are the best supported (and most
      ;; commonly used with bazel).
      (setq bazel-modes '(bazel-mode bazel-workspace-mode bazelrc-mode
                                     bazel-starlark-mode c-mode c++-mode
                                     python-mode java-mode))
      (dolist (mode bazel-modes)
             (spacemacs/declare-prefix-for-mode mode "mc" "compile")
             (spacemacs/set-leader-keys-for-major-mode mode
               "cc" 'bazel-build
               "cr" 'bazel-run
               "ct" 'bazel-test)))))
