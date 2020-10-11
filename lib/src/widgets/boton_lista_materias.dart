import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final IconData icon;
  @required
  final String texto;
  final Color color1;
  final Color color2;
  @required
  final Function onPress;

  const BotonGordo({
    this.icon = FontAwesomeIcons.circle,
    this.texto,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
    this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          _BotonGordoBackground(
            this.icon,
            this.color1,
            this.color2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 40,
              ),
              FaIcon(
                //FontAwesomeIcons.carCrash,
                this.icon,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  this.texto,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
              SizedBox(width: 40),
            ],
          )
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  const _BotonGordoBackground(
    this.icon,
    this.color1,
    this.color2,
  );
  @override
  Widget build(BuildContext context) {
    final double _sizeWidth = MediaQuery.of(context).size.width;
    final double _sizeHeight = MediaQuery.of(context).size.height;
    final double _diagonalSize =
        sqrt((_sizeHeight * _sizeHeight) + (_sizeWidth * _sizeWidth));
    return Container(
      width: double.infinity,
      height: _diagonalSize * 0.12,
      // margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4, 6),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            this.color1,
            this.color2,
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                //FontAwesomeIcons.carCrash,
                this.icon,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
