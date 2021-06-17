import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vrouter/vrouter.dart';
import 'package:pueprint/pueprint.dart';

void main() {
  runApp(
    VRouter(
      debugShowCheckedModeBanner: false,
      routes: [
        VWidget(path: '/', widget: HomePage()),
        VNester(
          path: null,
          widgetBuilder: (child) => FlowWrapperPage(child: child),
          nestedRoutes: [
            VWidget(path: "/1", widget: Flow1Page()),
            VWidget(path: '/2', widget: Flow2Page()),
          ],
        ),
        VWidget(path: '/solo', widget: SoloPage()),
      ],
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => context.vRouter.push("/1"),
          child: Text('to flow'),
        ),
        ElevatedButton(
          onPressed: () => context.vRouter.push("/solo"),
          child: Text('to solo page'),
        )
      ],
    );
  }
}

class FlowWrapperPage extends StatelessWidget {
  final Widget child;

  FlowWrapperPage({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pueprint(
        appBarBuilder: (context, state) => AppBar(
          leading: IconButton(
            icon: Icon(state.icon),
            onPressed: state.onTapLeading,
          ),
          title: state.title,
        ),
        footerBuilder: (context, state) => PueFooter(
          bottom: AnimatedSmoothIndicator(
            activeIndex: state.activeStep != null ? state.activeStep! - 1 : 0,
            count: 2,
            effect: WormEffect(),
          ),
          child: ElevatedButton(
            child: state.buttonChild,
            onPressed: state.onTap,
          ),
        ),
        body: child,
      ),
    );
  }
}

class Flow1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PuePage(
      appBar: BasicAppBar(),
      footerData: FooterData(
        activeStep: 1,
        onTap: () => context.vRouter.push('/2'),
        buttonChild: Text('go to flow 2 page'),
      ),
      header: PueHeader(
        text: 'flow 1 header',
      ),
      body: Center(
        child: Text('flow 1 page'),
      ),
    );
  }
}

class Flow2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PuePage(
      appBarData: AppBarData(
        icon: Icons.arrow_back,
        onTapLeading: () => context.vRouter.pop(),
      ),
      footerData: FooterData(
        activeStep: 2,
        onTap: () => context.vRouter.push('/2'),
        buttonChild: Text('go to flow 2 page'),
      ),
      header: PueHeader(
        text: 'flow 2 header',
      ),
      body: Center(
        child: Text('flow 2 page'),
      ),
    );
  }
}

class SoloPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SoloPuePage(
      body: PueBody(
        child: Center(
          child: Text('solo page'),
        ),
      ),
    );
  }
}
