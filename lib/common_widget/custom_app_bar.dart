import 'package:flutter/material.dart';

class CustomTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTopAppBar({
    Key? key,
    this.child,
    this.actions,
    this.title,
    this.subtitle,
    this.backButtonOnPressed,
    this.showBackBtn = true,
    this.image,
    this.showHorizontalPadding = false,
    this.replaceBackBtnWith,
    this.disableBackBtn = false,
    this.preferredSize = const Size.fromHeight(0),
  }) : super(key: key);

  final Widget? child;
  final List<Widget>? actions;
  final String? title;
  final String? subtitle;
  final Function? backButtonOnPressed;
  final bool showBackBtn;
  final Widget? image;
  final bool showHorizontalPadding;
  final Widget? replaceBackBtnWith;
  final bool disableBackBtn;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    // Use initialised actions to create bar actions to be iterated
    List<Widget>? barActions = [];
    if (actions != null) {
      barActions = actions;
    }

    return AppBar(
      elevation: 0,
      titleSpacing: 0,

      // Remove the automatically displayed leading back button
      automaticallyImplyLeading: false,

      toolbarHeight: preferredSize.height,

      // Use custom child to layout app bar
      title: Padding(
        padding: showHorizontalPadding
            ? const EdgeInsets.symmetric(
                horizontal: 20,
              )
            : const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  // standard arrow back button
                  Visibility(
                    visible: showBackBtn && replaceBackBtnWith == null,
                    child: Row(
                      children: [
                        // Increase the tap area of the back button using padding in widget
                        // CustomBackButtonWithoutSplash(
                        //   onPressed: backButtonOnPressed,
                        //   disableBackBtn: disableBackBtn,
                        //   padding: const EdgeInsets.only(
                        //     right: CustomPadding.standard1,
                        //     top: CustomPadding.small2,
                        //     bottom: CustomPadding.small2,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  // replace arrow back button with other widget
                  if (replaceBackBtnWith != null)
                    Row(
                      children: [
                        replaceBackBtnWith ?? Container(),
                        const SizedBox(width: 20),
                      ],
                    ),
                  // logo, title, subtitle
                  Visibility(
                    visible: subtitle != null && child == null,
                    child: Expanded(
                      child: Row(
                        children: [
                          // logo
                          Offstage(
                            offstage: image == null,
                            child: image,
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // title
                                Text(
                                  title ?? '',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                const SizedBox(height: 20),
                                // subtitle
                                Text(
                                  subtitle ?? '',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // title only
                  Visibility(
                    visible: subtitle == null && child == null,
                    child: Expanded(
                      child: Text(
                        title != null ? title! : '',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  child ?? const SizedBox(),
                  // Offstage(offstage: child == null, child: child)
                ],
              ),
            ),
            // Actions
            Row(
              children: barActions!.asMap().entries.map((item) {
                int idx = item.key;
                Widget action = item.value;

                return Row(children: [
                  action,
                  // Add padding to the right of all action items except the last item
                  Offstage(
                    offstage: idx == barActions!.length - 1,
                    child: const SizedBox(
                      width: 20,
                    ),
                  ),
                ]);
              }).toList(),
            ),
          ],
        ),
      ),

      // Action buttons that appear on the right side
      // actions: actions,
      // centerTitle: false,
    );
  }
}
