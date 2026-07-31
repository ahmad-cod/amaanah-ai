import 'package:flutter/material.dart';

abstract class AppColors {
  // Brand Primary & Accent
  static const Color primary = Color(0xFF0F766E); // Deep Emerald Teal
  static const Color primaryLight = Color(0xFF14B8A6);
  static const Color primaryDark = Color(0xFF115E59);
  
  static const Color secondary = Color(0xFF1E293B); // Deep Slate Navy
  static const Color accent = Color(0xFFF59E0B); // Logistics Amber
  
  // Backgrounds & Surface
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color cardLight = Color(0xFFFFFFFF);
  
  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color surfaceDark = Color(0xFF1E293B);
  static const Color cardDark = Color(0xFF334155);

  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Logistics Status Badges
  static const Color statusPending = Color(0xFF6366F1);
  static const Color statusInTransit = Color(0xFF0284C7);
  static const Color statusDelivered = Color(0xFF10B981);
  static const Color statusDelayed = Color(0xFFF59E0B);
  static const Color statusCancelled = Color(0xFFEF4444);

  // Text Colors
  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF64748B);
  
  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFF94A3B8);

  // Borders & Dividers
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color borderDark = Color(0xFF334155);
}
