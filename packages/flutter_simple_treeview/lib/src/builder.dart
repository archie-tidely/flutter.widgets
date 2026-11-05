// Copyright 2020 the Dart project authors.
//
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file or at
// https://developers.google.com/open-source/licenses/bsd

import 'package:flutter/material.dart';

import 'node_widget.dart';
import 'primitives/key_provider.dart';
import 'primitives/tree_controller.dart';
import 'primitives/tree_node.dart';

/// Builds set of [nodes] respecting [state], [indent] and [iconSize].
Widget buildNodes(Iterable<TreeNode> nodes, double? indent,
    TreeController state) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (var node in nodes)
        NodeWidget(
          // Keeps each row's State with its node when the node list changes.
          // Only user keys identify a node across rebuilds; generated keys
          // are positional, so those rows stay unkeyed.
          key: isGeneratedKey(node.key) ? null : ValueKey(node.key),
          treeNode: node,
          indent: indent,
          state: state,
        )
    ],
  );
}
