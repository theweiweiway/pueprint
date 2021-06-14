# 💩 Pueprint 💩

## What is it?

A Flutter package to make flows and pages easy to style.

_Why Pueprint? Because it stands for Page + Blueprint, which combines to Pueprint! 💩💩_

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

Flows usually consist of several pages that have an **AppBar** as well as some sort of **Footer** which allows the user to proceed to through the flow. However, these **AppBar** and **Footer** widgets are commonly overlayed _on top_ of each page and are located in parent component, which makes it tedious to tweak these widgets.

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

1.

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

With **AutoRoute**, you will need to use a wrapper page

1. Create your routing setup

```dart
@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute>[
        // ...your other routes
        AutoRoute(
            path: "/flow",
            page: FlowWrapperPage,
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

2. Define your wrapper page. In this case, it is `FlowWrapperPage`

```dart
class BookWrapperPage extends StatelessWidget {
  const BookWrapperPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pueprint(
      appBarBuilder: (context, state) {
        return Container(),
      },
      footerBuilder: (context, state) {
        return Container(),
      },
      body: AutoRouter(),
    );
  }
}
```

3. Now in your flow pages (in this example, `Flow1Page`, `Flow2Page` and `Flow3Page`), use `PuePage` like so!

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
      body: Container(),
    );
  }
}
```

## VRouter

## Routemaster
