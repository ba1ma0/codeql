/**
 * @name Partial path traversal vulnerability
 * @description A prefix used to check that a canonicalised path falls within another must be slash-terminated.
 * @kind problem
 * @problem.severity error
 * @security-severity 9.3
 * @precision medium
 * @id java/partial-path-traversal
 * @tags security
 *       external/cwe/cwe-023
 */

import semmle.code.java.security.PartialPathTraversal

from PartialPathTraversalMethodAccess ma
select ma,ma.getLocation().getFile().getAbsolutePath()+":"+ma.getLocation().getStartLine()+":"+ma.getLocation().getEndLine(), "Partial Path Traversal Vulnerability due to insufficient guard against path traversal."