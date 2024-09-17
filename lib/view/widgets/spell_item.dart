import 'package:enchanted/model/spell_model.dart';
import 'package:enchanted/view/styling.dart';
import 'package:flutter/material.dart';

class SpellItem extends StatelessWidget {
  const SpellItem({
    super.key,
    required this.spell,
  });

  final Spell spell;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/stars.png',
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(kBorderRadius)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      spell.name,
                      style: kBodyText3.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      spell.effect ?? '',
                      style: kSmallText.copyWith(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: spell.incantation != null &&
                            spell.canBeVerbal != null &&
                            spell.canBeVerbal != false
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.auto_fix_high_outlined,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10,),
                              Flexible(
                                child: Text(
                                  spell.incantation!,
                                  style: kBodyText3.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Nonverbal',
                                style: kBodyText.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      spell.light != null && spell.light != 'None'
                          ? 'Magical light: ${spell.light}'
                          : '',
                      style: kSmallText.copyWith(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      spell.creator != null
                          ? 'Created by ${spell.creator}'
                          : 'Unknown Creator',
                      style: kSmallText.copyWith(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
