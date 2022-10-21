import 'package:flutter/material.dart';

enum IslandType {
  phoneCall,
  music,
  map,
}

final Map<IslandType, IconData> islandTypeShrinkedIconData = {
  IslandType.phoneCall: Icons.call,
  IslandType.music: Icons.music_note,
  IslandType.map: Icons.map,
};
