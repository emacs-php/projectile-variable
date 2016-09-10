;;; projectile-variable.el --- Project local variables. -*- mode: lexical-binding: t -*-

;; Copyright (C) 2016 USAMI Kenta

;; Author: USAMI Kenta <tadsan@zonu.me>
;; Created: 11 Sep 2016
;; Version: 0.0.1
;; Keywords: project, convenience
;; Homepage: https://github.com/zonuexe/projectile-variable
;; Package-Requires: ((emacs "24") (cl-lib "0.5") (projectile "0.14.0"))

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; (projectile-variable-put 'hoge 2)
;; (projectile-variable-get 'hoge)
;; (projectile-variable-plist)

;;; Code:
(require 'projectile)

(defconst projectile-variable--prefix "projectile-variable--")

(defun projectile-variable--make-symbol ()
  "Make symbol for save project local variable."
  (intern (concat projectile-variable--prefix (projectile-project-root))))

(defun projectile-variable-plist ()
  "Return project local property list."
  (symbol-plist (projectile-variable--make-symbol)))

(defun projectile-variable-put (propname value)
  "Store the project local PROPNAME property with value VALUE."
  (put (projectile-variable--make-symbol) propname value))

(defun projectile-variable-get (propname)
  "Return the value of the project local PROPNAME property."
  (get (projectile-variable--make-symbol) propname))

(provide 'projectile-variable)
;;; projectile-variable.el ends here
