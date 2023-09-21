import 'package:angular_emulation/src/core/providers.dart';
import 'package:angular_emulation/src/models/quote.dart';
import 'package:angular_emulation/src/services/quotes_service.dart';
import 'package:demo_views/demo_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final QuotesService quotesService = ref.watch(quotesServiceProvider);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              bottom: 20
            ),
            child: const Text("Angular Home", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28, )),
          ),
          Center(
            child: FutureBuilder<Quote>(
              future: quotesService.getRandomQuote(),
              builder: (context, snapshot) {
                if ((snapshot.hasData) && (snapshot.connectionState == ConnectionState.done)){
                  return QuoteDisplay(quote: snapshot.data);
                } else{
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
          
          const TapCounter(title: "")
        ],
      ),
    );
  }
}