import 'package:ben_folio/components/responsive_provider.dart';
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final ResponsiveProvider? provider;
  final bool adapt;
  final LayoutWidgetBuilder? desktopBuilder;
  final LayoutWidgetBuilder? tabletBuilder;
  final LayoutWidgetBuilder? mobileBuilder;

  const ResponsiveBuilder({
    super.key,
    this.provider,
    this.adapt = true,
    this.desktopBuilder,
    this.tabletBuilder,
    this.mobileBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: buildLayout);
  }

  Widget buildLayout(BuildContext context, BoxConstraints constraints) {
    final double width = constraints.maxWidth;
    final double height = constraints.maxHeight;
    final ResponsiveProvider provider = this.provider ?? ResponsiveProvider.global();

    // Error message
    String? message;

    if (provider.isDesktop(width, height)) {
      if (desktopBuilder != null) {
        return desktopBuilder!(context, constraints);
      } else if (adapt && tabletBuilder != null) {
        return tabletBuilder!(context, constraints);
      } else {
        message = 'Desktop layout not set !';
      }
    } else if (provider.isTablet(width, height)) {
      if (tabletBuilder != null) {
        return tabletBuilder!(context, constraints);
      } else if (adapt && mobileBuilder != null) {
        return mobileBuilder!(context, constraints);
      } else {
        message = 'Tablet layout not set !';
      }
    } else if (provider.isMobile(width, height)) {
      if (mobileBuilder != null) {
        return mobileBuilder!(context, constraints);
      } else {
        message = 'Mobile layout not set !';
      }
    }

    return Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.devices_other, color: Colors.red, size: 128),
        Text("Error", style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 32,),
        Text(message ?? 'Something went wrong'),
      ],
    ));
  }
}
