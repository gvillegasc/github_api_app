import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_api_app/core/app_strings.dart';
import 'package:github_api_app/core/responsive.dart';
import 'package:github_api_app/presentation/blocs/theme/theme_bloc.dart';
import 'package:github_api_app/presentation/ui/widgets/text_title.dart';

class CommitsHeader extends StatelessWidget {
  const CommitsHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final appTheme = Theme.of(context);
    const imageUrl = 'https://avatars.githubusercontent.com/u/40042359?v=4';
    const separator = SizedBox(height: 15);
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.widthR(5),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7)),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      TextTitleRegular(
                        text: AppStrings.textRepoAuthor,
                        color: appTheme.primaryColor.withOpacity(.8),
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: responsive.heightR(5),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/pages/icons/ic_moon.svg',
                            height: responsive.inchR(2.5),
                            color: appTheme.primaryColor.withOpacity(.8),
                          ),
                          BlocBuilder<ThemeBloc, ThemeState>(
                            builder: (context, state) {
                              return Switch(
                                activeColor: appTheme.colorScheme.secondary,
                                value: state.isDark,
                                onChanged: (value) {
                                  context
                                      .read<ThemeBloc>()
                                      .add(OnChangeTheme(value));
                                },
                              );
                            },
                          ),
                          SvgPicture.asset(
                            'assets/pages/icons/ic_sun.svg',
                            height: responsive.inchR(2.5),
                            color: appTheme.primaryColor.withOpacity(.8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            separator,
            TextTitleBig(
              text: AppStrings.textRepoName,
              color: appTheme.primaryColor,
              fontWeight: FontWeight.w700,
            ),
            separator,
            TextTitleRegular(
              text: AppStrings.textCommits,
              color: appTheme.primaryColor.withOpacity(.7),
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
