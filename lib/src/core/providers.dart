import 'package:angular_emulation/src/services/contact_service.dart';
import 'package:angular_emulation/src/services/meetings_service.dart';
import 'package:angular_emulation/src/services/quotes_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<ContactService> contactServiceProvider = Provider<ContactService>((ref) {
  return ContactService();
});

final Provider<QuotesService> quotesServiceProvider = Provider<QuotesService>((ref) {
  return QuotesService();
});

final Provider<MeetingsService> meetingsServiceProvider = Provider<MeetingsService>((ref) {
  return MeetingsService();
});