// lib/providers/navigation_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvider = StateProvider<int>((ref) => 0); // 0 for Home, 1 for Search, etc.
