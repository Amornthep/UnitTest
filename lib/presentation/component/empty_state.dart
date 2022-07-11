import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmptyState extends StatelessWidget {
  final Widget image;
  final String title;
  final String? subtitle;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final String? buttonText;

  const EmptyState({
    Key? key,
    required this.image,
    required this.title,
    this.subtitle,
    this.backgroundColor,
    this.onPressed,
    this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          color: backgroundColor ?? Colors.transparent,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 56,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image,
              const Gap(16),
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              const Gap(8),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                      ),
                  textAlign: TextAlign.center,
                ),
              const Gap(32),
              if (onPressed != null && buttonText != null)
                ConstrainedBox(
                  constraints: BoxConstraints.expand(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                  ),
                  child: ElevatedButton(
                    child: Text(
                      buttonText!,
                      style: Theme.of(context).textTheme.button?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: onPressed,
                  ),
                ),
              const Gap(56),
            ],
          ),
        ),
      ),
    );
  }
}
