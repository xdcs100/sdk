// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'typescript_parser.dart';

String cleanComment(String comment) {
  if (comment == null) {
    return null;
  }

  // Remove the start/end comment markers.
  if (comment.startsWith('/**') && comment.endsWith('*/')) {
    comment = comment.substring(3, comment.length - 2);
  } else if (comment.startsWith('//')) {
    comment = comment.substring(2);
  }

  final _commentLinePrefixes = new RegExp(r'\n\s*\* ?');
  final _nonConcurrentNewlines = new RegExp(r'\n(?![\n\s\-*])');
  final _newLinesThatRequireReinserting = new RegExp(r'\n (\w)');
  // Remove any Windows newlines from the source.
  comment = comment.replaceAll('\r', '');
  // Remove the * prefixes.
  comment = comment.replaceAll(_commentLinePrefixes, '\n');
  // Remove and newlines that look like wrapped text.
  comment = comment.replaceAll(_nonConcurrentNewlines, ' ');
  // The above will remove one of the newlines when there are two, so we need
  // to re-insert newlines for any block that starts immediately after a newline.
  comment = comment.replaceAllMapped(
      _newLinesThatRequireReinserting, (m) => '\n\n${m.group(1)}');
  return comment.trim();
}

/// Fixes up some enum types that are not as specific as they could be in the
/// spec. For example, Diagnostic.severity is typed "number" but can be mapped
/// to the DiagnosticSeverity enum class.
String getImprovedType(String interfaceName, String fieldName) {
  const Map<String, Map<String, String>> _improvedTypeMappings = {
    "Diagnostic": {
      "severity": "DiagnosticSeverity",
      "code": "String",
    },
    "TextDocumentSyncOptions": {
      "change": "TextDocumentSyncKind",
    },
    "FileSystemWatcher": {
      "kind": "WatchKind",
    },
    "CompletionItem": {
      "kind": "CompletionItemKind",
    },
    "DocumentHighlight": {
      "kind": "DocumentHighlightKind",
    },
    "FoldingRange": {
      "kind": "FoldingRangeKind",
    },
    "ResponseError": {
      "code": "ErrorCodes",
    },
    "NotificationMessage": {
      "method": "Method",
      "params": "object",
    },
    "RequestMessage": {
      "method": "Method",
      "params": "object",
    },
    "SymbolInformation": {
      "kind": "SymbolKind",
    },
  };

  final interface = _improvedTypeMappings[interfaceName];

  return interface != null ? interface[fieldName] : null;
}

List<String> getSpecialBaseTypes(Interface interface) {
  if (interface.name == 'RequestMessage' ||
      interface.name == 'NotificationMessage') {
    return ['IncomingMessage'];
  } else {
    return [];
  }
}

/// Removes types that are in the spec that we don't want to emit.
bool includeTypeDefinitionInOutput(AstNode node) {
  // These types are not used for v3.0 (Feb 2017) and by dropping them we don't
  // have to handle any cases where both a namespace and interfaces are declared
  // with the same name.
  return node.name != 'InitializeError' &&
      // We don't emit MarkedString because it gets mapped to a simple String
      // when getting the .dartType for it.
      // .startsWith() because there are inline types that will be generated.
      !node.name.startsWith('MarkedString');
}

/// Removes types that are in the spec that we don't want in other signatures.
bool allowTypeInSignatures(TypeBase type) {
  // Don't allow arrays of MarkedStrings, but do allow simple MarkedStrings.
  // The only place that uses these are Hovers and we only send one value
  // (to match the MarkupString equiv) so the array just makes the types
  // unnecessarily complicated.
  if (type is ArrayType) {
    final elementType = type.elementType;
    if (elementType is Type && elementType.name == 'MarkedString') {
      return false;
    }
  }
  return true;
}
