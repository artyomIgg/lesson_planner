import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson_planner/constants/constants.dart' as c;

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context);
    final topicStyle = TextStyle(
      fontSize: 14,
      color: textTheme.textTheme.titleLarge!.color!.withOpacity(
        .5,
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Text('Time', style: topicStyle),
            const Spacer(),
            Text('Meet', style: topicStyle),
            const Spacer(
              flex: 4,
            ),
            const SizedBox(
              width: 32,
              height: 46,
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.sort,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 500,
            // shrinkWrap: true,
            itemBuilder: (context, index) => _meetCard(
              textTheme,
              index == 0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _meetCard(ThemeData textTheme, bool isCurrent) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            children: [
              Text('10:00', style: c.TextStyles.meetCardStartTime),
              Text('11:00', style: c.TextStyles.meetCardEndTime),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: VerticalDivider(
              color: Colors.black.withOpacity(0.1),
              thickness: 2,
            ),
          ),
          Flexible(
            child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: isCurrent ? c.Colors.greenButton : c.Colors.greyLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Title',
                          style: isCurrent
                              ? c.TextStyles.meetCardTitleWhite
                              : c.TextStyles.meetCardTitleBlack,
                        ),
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              Icons.more_vert,
                              size: 24,
                              color: isCurrent ? Colors.white : Colors.black,
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Description',
                      style: isCurrent
                          ? c.TextStyles.meetCardDescriptionWhite
                          : c.TextStyles.meetCardDescriptionBlack,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 18,
                          color: isCurrent ? Colors.white : Colors.black,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Artem Fylyppov',
                          style: isCurrent
                              ? c.TextStyles.meetCardDescriptionWhite
                              : c.TextStyles.meetCardDescriptionBlack,
                        )
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
