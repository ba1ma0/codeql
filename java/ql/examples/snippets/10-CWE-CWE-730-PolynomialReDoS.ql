/**
 * @name Polynomial regular expression used on uncontrolled data
 * @description A regular expression that can require polynomial time
 *              to match may be vulnerable to denial-of-service attacks.
 * @kind path-problem
 * @problem.severity warning
 * @security-severity 7.5
 * @precision high
 * @id java/polynomial-redos
 * @tags security
 *       external/cwe/cwe-1333
 *       external/cwe/cwe-730
 *       external/cwe/cwe-400
 */

import java
import semmle.code.java.security.regexp.PolynomialReDoSQuery
import DataFlow::PathGraph

from
  DataFlow::PathNode source, DataFlow::PathNode sink,
  SuperlinearBackTracking::PolynomialBackTrackingTerm regexp
where hasPolynomialReDoSResult(source, sink, regexp)
select sink, source, sink,sink.getNode().getLocation().getFile().getAbsolutePath()+"$$"+sink.getNode().getLocation().getStartLine(),
  "This $@ that depends on a $@ may run slow on strings " + regexp.getPrefixMessage() +
    "with many repetitions of '" + regexp.getPumpString() + "'.", regexp, "regular expression",
  source.getNode(), "user-provided value"
