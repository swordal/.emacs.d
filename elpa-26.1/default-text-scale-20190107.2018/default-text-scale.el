;;; default-text-scale.el --- Easily adjust the font size in all frames -*- lexical-binding: t -*-

;; Copyright (C) 2015  Steve Purcell

;; Author: Steve Purcell <steve@sanityinc.com>
;; URL: https://github.com/purcell/default-text-scale
;; Keywords: frames, faces
;; Package-Version: 20190107.2018
;; Package-X-Original-Version: 0
;; Package-Requires: ((emacs "24"))

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

;; This package provides commands for increasing or decreasing the
;; default font size in all GUI Emacs frames -- it is like an
;; Emacs-wide version of `text-scale-mode'.

;; Usage:

;; Enable the global minor mode `default-text-scale-mode' to bind
;; C-M-= and C-M-- to `default-text-scale-increase' and
;; `default-text-scale-decrease' respectively.  Alternatively, bind
;; those commands directly in another map.

;;; Code:

(defgroup default-text-scale nil
  "Adjusting the default font size across all frames."
  :group 'faces
  :prefix "default-text-scale-")

(defcustom default-text-scale-amount 15
  "Increment by which to adjust the :height of the default face."
  :type 'integer
  :group 'default-text-scale)

(defvar default-text-scale--complement 0
  "Stores the delta needed to get back to the original default face height.")

(defun default-text-scale-increment (delta)
  "Adjust the default font height by DELTA on every graphical frame.
The pixel size of the frame will be kept approximately the same,
to the extent possible, as with the function `set-frame-font'.
DELTA should be a multiple of 10, to match the units used by
the :height face attribute."
  (interactive "nIncrement (e.g. 10, -5)? ")
  (unless (display-multi-font-p (selected-frame))
    (error "Cannot adjust default text scale from a non-graphical frame"))
  (let* ((cur-height (face-attribute 'default :height))
         (new-height (+ cur-height delta)))
    ;; Modify the special "user" theme, which is always combined
    ;; with any other loaded theme(s).  An alternative approach
    ;; would be modifying the default face's face-override-spec
    ;; property (see `face-spec-set'), but that produces more
    ;; redraws
    (custom-push-theme 'theme-face 'default 'user 'set `((t (:height ,new-height))))
    (dolist (f (frame-list))
      (when (display-multi-font-p f)
        (let ((pixel-height (* (frame-parameter f 'height)
                               (frame-char-height f)))
              (pixel-width  (* (frame-parameter f 'width)
                               (frame-char-width f))))
          (face-spec-recalc 'default f)
          (unless (frame-parameter f 'fullscreen)
            (modify-frame-parameters
             f
             `((height . ,(round pixel-height (frame-char-height f)))
               (width . ,(round pixel-width  (frame-char-width f))))))))
      (with-selected-frame f
        (run-hooks 'after-setting-font-hook)))
    ;; This line is apparently necessary for Emacs to properly
    ;; recalculate the face attributes in order for the
    ;; actually-applied height to be correctly returned
    ;; below. Evidently some visible text must be displayed (however
    ;; briefly) for this to occur: a temp buffer is insufficient.
    (message "Stale font size: %d" (face-attribute 'default :height (selected-frame)))
    (let* ((actual-new-height (face-attribute 'default :height (selected-frame)))
           (actual-delta (- actual-new-height cur-height)))
      (setq default-text-scale--complement (- default-text-scale--complement actual-delta))
      (message "Default font size is now %d" actual-new-height))))

;;;###autoload
(defun default-text-scale-increase ()
  "Increase the height of the default face by `default-text-scale-amount'."
  (interactive)
  (default-text-scale-increment default-text-scale-amount))

;;;###autoload
(defun default-text-scale-decrease ()
  "Decrease the height of the default face by `default-text-scale-amount'."
  (interactive)
  (default-text-scale-increment (- default-text-scale-amount)))

;;;###autoload
(defun default-text-scale-reset (&optional set-current)
  "Reset the height of the default face.
With prefix argument SET-CURRENT, set the current size as the
default to which subsequent sizes would be reset."
  (interactive "P")
  (if set-current
      (message "Default font size set to current size.")
    (default-text-scale-increment default-text-scale--complement))
  (setq default-text-scale--complement 0))

;;;###autoload
(define-minor-mode default-text-scale-mode
  "Change the size of the \"default\" face in every frame."
  :global t
  :require 'default-text-scale
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-M-=") 'default-text-scale-increase)
            (define-key map (kbd "C-M--") 'default-text-scale-decrease)
            (define-key map (kbd "C-M-0") 'default-text-scale-reset)
            map)
  (if default-text-scale-mode
      (setq default-text-scale--complement 0)
    (default-text-scale-reset)))


(provide 'default-text-scale)
;;; default-text-scale.el ends here
