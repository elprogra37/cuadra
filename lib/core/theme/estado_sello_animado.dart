import 'package:flutter/material.dart';

import 'estado_sello.dart';

/// La única animación con peso del producto (§5): el sello cae y se estampa
/// cuando un caso pasa a resuelto. 150 ms, rebote mínimo. Respeta
/// `prefers-reduced-motion` (MediaQuery.disableAnimations): sin animación,
/// el sello aparece ya estampado.
class EstadoSelloAnimado extends StatefulWidget {
  const EstadoSelloAnimado({
    super.key,
    required this.sello,
    this.animar = true,
  });

  final EstadoSello sello;

  /// false = mostrar directamente estampado (estados que no acaban de
  /// cambiar, listas, re-builds).
  final bool animar;

  @override
  State<EstadoSelloAnimado> createState() => _EstadoSelloAnimadoState();
}

class _EstadoSelloAnimadoState extends State<EstadoSelloAnimado>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controlador = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 150),
  );

  /// El sello "cae": escala 1.6 → 1.0 con un rebote mínimo al final.
  late final Animation<double> _escala = TweenSequence<double>([
    TweenSequenceItem(
      tween: Tween(
        begin: 1.6,
        end: 0.97,
      ).chain(CurveTween(curve: Curves.easeIn)),
      weight: 80,
    ),
    TweenSequenceItem(tween: Tween(begin: 0.97, end: 1.0), weight: 20),
  ]).animate(_controlador);

  late final Animation<double> _opacidad = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(parent: _controlador, curve: const Interval(0, 0.4)),
  );

  @override
  void initState() {
    super.initState();
    if (widget.animar) {
      _controlador.forward();
    } else {
      _controlador.value = 1;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // prefers-reduced-motion: estampado sin caída.
    if (MediaQuery.of(context).disableAnimations && !_controlador.isCompleted) {
      _controlador.value = 1;
    }
  }

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacidad,
      child: ScaleTransition(scale: _escala, child: widget.sello),
    );
  }
}
