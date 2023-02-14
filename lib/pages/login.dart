import 'package:flutter/material.dart';
import 'package:innova_app/theme/app_images.dart';
import 'package:innova_app/theme/custom_theme.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);

    return Scaffold(
      backgroundColor: theme.background,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppImages.logoBrand),
            Positioned(
                bottom: 24,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DefaultTextStyle(
                        style: TextStyle(
                            color: theme.secondary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        child: const Text(
                            'Comece agora mesmo a organizar sua vida.')),
                    const SizedBox(
                      height: 8,
                    ),
                    Ink(
                      height: 56,
                      width: 296,
                      decoration: BoxDecoration(
                          color: theme.container,
                          borderRadius: BorderRadius.circular(8)),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Row(
                          children: [
                            SizedBox(
                                height: 56,
                                width: 56,
                                child: Image.asset(AppImages.google)),
                            Container(
                              color: theme.background,
                              height: 56,
                              width: 2,
                            ),
                            SizedBox(
                              width: 238,
                              child: Center(
                                child: DefaultTextStyle(
                                    style: TextStyle(
                                        color: theme.secondary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                    child: const Text('Entrar com Google')),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
