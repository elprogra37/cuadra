import 'package:cuadra/data/models/enums.dart';
import 'package:cuadra/services/documents/escalera.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('un caso abierto siempre ofrece presentar', () {
    expect(
      Escalera.proximo(CaseStatus.abierto, const []),
      CaseActionType.presentar,
    );
  });

  test('presentado con plazo corriendo: no hay escalón (se espera)', () {
    expect(
      Escalera.proximo(CaseStatus.presentado, const [CaseActionType.presentar]),
      isNull,
    );
  });

  test('sin respuesta: los escalones §13 salen en orden', () {
    var hechas = <CaseActionType>[CaseActionType.presentar];
    final esperados = [
      CaseActionType.reiterar,
      CaseActionType.prontoDespacho,
      CaseActionType.accesoInformacion,
      CaseActionType.defensoria,
      CaseActionType.concejal,
      CaseActionType.prensa,
      CaseActionType.datoAbierto,
    ];
    for (final esperado in esperados) {
      final proximo = Escalera.proximo(CaseStatus.sinRespuesta, hechas);
      expect(proximo, esperado);
      hechas = [...hechas, proximo!];
    }
    // Escalera completa: la reiteración siempre queda disponible (§12).
    expect(
      Escalera.proximo(CaseStatus.sinRespuesta, hechas),
      CaseActionType.reiterar,
    );
  });

  test('estados cerrados no ofrecen escalón', () {
    for (final s in [
      CaseStatus.resuelto,
      CaseStatus.archivado,
      CaseStatus.rechazado,
      CaseStatus.enEjecucion,
    ]) {
      expect(Escalera.proximo(s, const []), isNull, reason: s.name);
    }
  });

  test('cada escalón mapea a una plantilla de la ficha (§14.3)', () {
    expect(Escalera.plantillaDe(CaseActionType.presentar), 'reclamo');
    expect(Escalera.plantillaDe(CaseActionType.reiterar), 'reiteracion');
    expect(
      Escalera.plantillaDe(CaseActionType.prontoDespacho),
      'pronto_despacho',
    );
    expect(
      Escalera.plantillaDe(CaseActionType.accesoInformacion),
      'acceso_informacion',
    );
  });
}
