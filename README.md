# 💩 Pueprint 💩

### What am I?

A Flutter package to make flows and pages much easier to lay out and style.

_Why Pueprint? Because it stands for Page + Blueprint, which combines to 💩Pueprint💩!_

# Table of Contents

- [Motivation](#motivation)
- [Getting started](#getting-started)
- [Core concepts](#core-concepts)
- [Usage](#usage)
  - [Flows](#flows)
    - [Pueprint](#pueprint)
    - [PuePage](#puepage)
    - [AppBarData](#appbardata)
    - [FooterData](#footerdata)
  - [Single pages](#single-pages)
    - [SoloPuePage](#solopuepage)
  - [Widgets](#widgets)
    - [PueHeader](#pueheader)
    - [PueBody](#puebody)
    - [PueFooter](#puefooter)
- [Integration with routing libraries](#integration-with-routing-libraries)
  - [AutoRoute](#autoroute)
  - [VRouter](#vrouter)

# Motivation

Flows usually consist of several pages that have an **AppBar** as well as some sort of **Footer** which allows the user to proceed to through the flow. However, these **AppBar** and **Footer** widgets are commonly overlayed _on top_ of each page and are located in parent component, which makes it tedious to tweak these widgets without a bunch of boilerplate and lifting state up.

This package makes it easy to:

- Declaratively customize each page in a flow without sacrificing styling capabilities
- Support for easily changing progress bars and page indicators through a flow
- Change onTap behaviours on each page
- Render pages based on screen size
- Integrate with any routing libraries (like AutoRoute, VRouter, Routemaster, etc.)
- _coming soon_ Animate **AppBar**s and **Footer**s when changing between pages
- ..and more..

All with minimal boilerplate and code.

In addition to flows, this package provides a simple page blueprint that allows you to easily add **AppBar**s, **Footers**s and **Header**s to pages.

# Getting Started

## For Flows

1. Define your parent `Pueprint` widget for your descendant flow pages. Think of the `Pueprint` as a scaffold for your child pages.

```dart
  Widget build(BuildContext context) {
    return Pueprint(
      appBarBuilder: (context, state) {
        return AppBar(
          leading: IconButton(
            icon: Icon(state.icon),
            onPressed: state.onTapLeading,
          )
        );
      },
      footerBuilder: (context, state) {
        return PueFooter(
          child: ElevatedButton(
            child: state.buttonChild,
            onPressed: state.onTap,
          ),
          bottom: AnimatedSmoothIndicator(
            activeStep: state.activeStep,
            count: 3,
          )
        );
      },
      body: DescendantPages(), // See below to see how to integrate your
      // descendant pages with popular routing libraries like AutoRoute and VRouter
    );
  }
```

2. Now in your flow pages, use `PuePage` to easily change your appBar and footer behaviour

```dart
  @override
  Widget build(BuildContext context) {
    return PuePage(
      appBarData: AppBarData(
        onTapLeading: () => context.router.pop(),
        icon: Icons.back_arrow_ios,
      ),
      footerData: FooterData(
        onTap: () => handleGoToNextPage(),
        buttonChild: Text('Submit'),
        activeIndex: 1,
      ),
      body: MyPageBody(),
    );
  }
```

## Outside of Flows

If you would like to use the the layout capabilities of this library, first place a [PueProvider] at the top of your widget tree.

```dart
  PueProvider(child: DescendantWidgets())
```

Now, use [SoloPuePage] like so:

```dart
SoloPuePage(
  appBar: AppBar(),
  header: PueHeader(text: "I love me some poo"),
  body: PueBody(
    child: Text("More poo"),
    listView: true,
  ),
  footer: PueFooter(
    floating: true,
    child: ElevatedButton(
      child: Text("Generate poo!"),
      onPressed: () => plopItOut(),
    )
  ),
)
```

# Core concepts

This package revolves around the idea that a page can be divded into 4 distinct parts:

- app bar
- header
- body
- footer

# Usage

# Integration with Routing Libraries

A flow UI and UX package wouldn't be complete without understanding how it can be integrated with navigation, since these features go hand-in-hand. Here are some examples of how to use this package in conjunction with some popular routing libraries.

## AutoRoute

1. Define your wrapper page. In this case, we are calling it `FlowWrapperPage`

```dart
class FlowWrapperPage extends StatelessWidget {
  const FlowWrapperPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pueprint(
      appBarBuilder: (context, state) {
        return AppBar(
          leading: IconButton(
            icon: Icon(state.icon),
            onPressed: state.onTapLeading,
          )
        );
      },
      footerBuilder: (context, state) {
        return ElevatedButton(
          child: state.buttonChild,
          onPressed: state.onTap,
        );
      },
      body: AutoRouter(),
    );
  }
}
```

2. Plug your `FlowWrapperPage` into your routing setup like so

```dart
@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute>[
        // ...your other routes
        AutoRoute(
            path: "/flow",
            page: FlowWrapperPage, // plug your wrapper page in right here!
            children: [
                AutoRoute(path: '1', page: Flow1Page),
                AutoRoute(path: '2', page: Flow2Page),
                AutoRoute(path: '3', page: Flow3Page),
            ],
        ),
    ],
)
class $AppRouter {}
```

3. Now in your flow pages use `PuePage` like so!

```dart
class Flow1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PuePage(
      appBarData: AppBarData(
        onTapLeading: () => context.router.pop(),
        icon: Icons.back_arrow_ios,
      ),
      footerData: FooterData(
        onTap: () => handleGoToNextPage(),
        buttonChild: Text('Submit'),
      ),
      body: MyPageBody(),
    );
  }
}
```

## VRouter

1. Define your wrapper page. In this case, we are calling it `FlowWrapperPage`

```dart
class FlowWrapperPage extends StatelessWidget {
  final Widget child;

  const FlowWrapperPage({Key key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pueprint(
      appBarBuilder: (context, state) {
        return AppBar(
          leading: IconButton(
            icon: Icon(state.icon),
            onPressed: state.onTapLeading,
          )
        );
      },
      footerBuilder: (context, state) {
        return ElevatedButton(
          child: state.buttonChild,
          onPressed: state.onTap,
        );
      },
      body: child,
    );
  }
}
```

2. Plug your `FlowWrapperPage` into your routing setup like so

```dart
VNester(
 path: '/flow',
 widgetBuilder: (child) => FlowWrapperPage(body: child),
 nestedRoutes: [
    VWidget(path: '1', widget: Flow1Page()),
    VWidget(path: '2', widget: Flow2Page()),
    VWidget(path: '3', widget: Flow3Page()),
 ],
)
```

3. Now in your flow pages use `PuePage` like so!

```dart
class Flow1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PuePage(
      appBarData: AppBarData(
        onTapLeading: () => context.router.pop(),
        icon: Icons.back_arrow_ios,
      ),
      footerData: FooterData(
        onTap: () => handleGoToNextPage(),
        buttonChild: Text('Submit'),
      ),
      body: MyPageBody(),
    );
  }
}
```
