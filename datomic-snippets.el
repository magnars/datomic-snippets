;;; datomic-snippets.el --- Yasnippets for Datomic

;; Copyright (C) 2013 Magnar Sveen

;; Author: Magnar Sveen <magnars@gmail.com>
;; Keywords: snippets
;; Version: 0.1.0
;; Package-Requires: ((s "1.4.0") (dash "1.2.0") (yasnippet "0.6.1"))

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

;; Yasnippets for [Datomic](http://www.datomic.com/).
;;
;; Please visit README.md for more commentary.

;;; Code:

(require 'yasnippet)
(require 'dash)
(require 's)

;;;###autoload
(defun datomic-snippets-show-docs-at-point ()
  (interactive)
  (datomic-snippets/show-docs (datomic-snippets/closest-datomic-identifer)))

(defvar datomic-snippets/docstrings
  '((":db.type/string" . "Value type for strings.")
    (":db.type/boolean" . "Boolean value type.")
    (":db.type/long" . "Fixed integer value type. Same semantics as a Java long: 64 bits wide, two's complement binary representation.")
    (":db.type/bigint" . "Value type for arbitrary precision integers. Maps to java.math.BigInteger on Java platforms.")
    (":db.type/float" . "Floating point value type. Same semantics as a Java float: single-precision 32-bit IEEE 754 floating point.")
    (":db.type/double" . "Floating point value type. Same semantics as a Java double: double-precision 64-bit IEEE 754 floating point.")
    (":db.type/bigdec" . "Value type for arbitrary precision floating point numbers. Maps to java.math.BigDecimal on Java platforms.")
    (":db.type/ref" . "Value type for references. All references from one entity to another are through attributes with this value type.")
    (":db.type/instant" . "Value type for instants in time. Stored internally as a number of milliseconds since midnight, January 1, 1970 UTC. Maps to java.util.Date on Java platforms.")
    (":db.type/uuid" . "Value type for UUIDs. Maps to java.util.UUID on Java platforms.")
    (":db.type/uri" . "Value type for URIs. Maps to java.net.URI on Java platforms.")
    (":db.type/bytes" . "Value type for small binary data. Maps to byte array on Java platforms.")
    (":db/cardinality" . "Specifies whether an attribute associates a single value or a set of values with an entity.")
    (":db.cardinality/one" . "The attribute is single valued, it associates a single value with an entity.")
    (":db.cardinality/many" . "The attribute is multi valued, it associates a set of values with an entity.")
    (":db/doc" . "Specifies a documentation string.")
    (":db/unique" . "Specifies a uniqueness constraint for the values of an attribute. Setting an attribute :db/unique also implies :db/index.")
    (":db.unique/value" . "The attribute value is unique to each entity; attempts to insert a duplicate value for a different entity id will fail")
    (":db.unique/identity" . "The attribute value is unique to each entity and upsert is enabled; attempts to insert a duplicate value for a temporary entity id will cause all attributes associated with that temporary id to be merged with the entity already in the database.")
    (":db/index" . "Specifies a boolean value indicating that an index should be generated for this attribute. Defaults to false.")
    (":db/fulltext" . "Specifies a boolean value indicating that a fulltext search index should be generated for the attribute. Defaults to false.")
    (":db/isComponent" . "Specifies that an attribute whose type is :db.type/ref refers to a subcomponent of the entity to which the attribute is applied. When you retract an entity with :db.fn/retractEntity, all subcomponents are also retracted. When you touch an entity, all its subcomponent entities are touched recursively. Defaults to nil.")
    (":db/noHistory" . "Specifies a boolean value indicating whether past values of an attribute should not be retained. Defaults to false.")))

(defvar datomic-snippets/docstrings-regexp
  (regexp-opt (-map 'car datomic-snippets/docstrings)))

(defun -aget (alist key)
  (cdr (assoc key alist)))

(defun datomic-snippets/show-docs (id)
  (message (-aget datomic-snippets/docstrings id))
  nil)

(defun datomic-snippets/closest-datomic-identifer ()
  (save-excursion
    (search-forward " ")
    (search-backward-regexp datomic-snippets/docstrings-regexp)
    (match-string-no-properties 0)))

(setq datomic-snippets-root (file-name-directory (or load-file-name
                                                     (buffer-file-name))))

;;;###autoload
(defun datomic-snippets-initialize ()
  (let ((snip-dir (expand-file-name "snippets" datomic-snippets-root)))
    (when (boundp 'yas-snippet-dirs)
      (add-to-list 'yas-snippet-dirs snip-dir t))
    (yas/load-directory snip-dir)))

;;;###autoload
(eval-after-load "yasnippet"
  '(datomic-snippets-initialize))

(provide 'datomic-snippets)
;;; datomic-snippets.el ends here
