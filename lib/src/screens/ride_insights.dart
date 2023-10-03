import 'package:elthor/src/providers/ride_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RideInsights extends StatelessWidget {
  const RideInsights({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Consumer<RideProvider>(
        builder: (context,state,_) {
          if(state.isLoading){
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }
          if(state.rides.isNotEmpty){
            return SafeArea(
              child: SingleChildScrollView(child: Column(
              children: List.generate(state.rides.length-1, (index){
                return Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 5,
                      color: Colors.black.withOpacity(0.05)
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RichText(
                      text: TextSpan(text: 'From : ',
                      style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black87),
                      children: [TextSpan(
                      text: '${state.rides[index].fromLocation}',
                      style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.black87),
                    )])),
                   const SizedBox(height: 16),
                   RichText(
                      text: TextSpan(text: 'To : ',
                      style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black87),
                      children: [TextSpan(
                      text: '${state.rides[index].toLocation}',
                      style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.black87),
                    )])),
                    const SizedBox(height: 16),
                   RichText(
                      text: TextSpan(text: 'From Time : ',
                      style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black87),
                      children: [TextSpan(
                      text: '${state.rides[index].fromTime}',
                      style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.black87),
                    )])),
                    const SizedBox(height: 16),
                   RichText(
                      text: TextSpan(text: 'To Time : ',
                      style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black87),
                      children: [TextSpan(
                      text: '${state.rides[index].toTime}',
                      style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.black87),
                    )])),
                    const SizedBox(height: 16),
                   RichText(
                      text: TextSpan(text: 'Total Distance Travel : ',
                      style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black87),
                      children: [TextSpan(
                      text: '${state.rides[index].distanceTravel} km',
                      style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.black87),
                    )])),
                    const SizedBox(height: 16),
                   RichText(
                      text: TextSpan(text: 'Battery Usage : ',
                      style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black87),
                      children: [TextSpan(
                      text: '${state.rides[index].extBatteryVoltage}',
                      style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.black87),
                    )])),
                  ],
                ),
              );
              }),
                      )),
            );
          }
          return const Text("Data Not Available");
        }
      ),
    );
  }
}