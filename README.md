Godot Physics & Render Benchmark
Dieses Projekt ist ein Physik- und Render-Benchmark, das mit Godot Engine 4.3 entwickelt wurde. Es misst die Leistungsfähigkeit eines Systems, indem es Szenarien wie das Befüllen eines Beckens mit Kugeln und die Simulation eines wachsenden Gitters ausführt. Die Messwerte helfen, die maximale Kapazität der Engine und der Hardware zu ermitteln.

Anforderungen
Godot Engine 4.3 oder neuer
Stelle sicher, dass du die richtige Version installiert hast. Die Funktionalität des Benchmarks hängt von den neuesten Funktionen und Optimierungen der Engine ab.
Ein System mit GPU-Unterstützung für das Render-Benchmarking.
Funktionen des Projekts
Becken-Füllung:

Ein Becken mit den Abmessungen 20x20 m wird mit Kugeln (Durchmesser 0,5 m) befüllt.
Es wird gemessen, wie viele Kugeln hinzugefügt werden können, bis die Frame-Time > 100 ms (entspricht <10 FPS) beträgt.
Wachsendes Gitter:

Ein Gitter aus Blöcken wächst schichtweise. Mit jeder Schicht wird das Gitter größer, und die Kamera passt ihre Position dynamisch an.
Die Performance wird in Bezug auf die durchschnittliche Frame-Time und die Anzahl der Blöcke gemessen.
Leistungsüberwachung in Echtzeit:

Das Projekt nutzt die Performance-API von Godot, um wichtige Daten wie FPS, Speicherverbrauch, Objektanzahl und GPU-Auslastung zu erfassen und anzuzeigen.
Installation
Lade das Repository herunter oder klone es:
bash
Code kopieren
git clone https://github.com/<dein-repo-name>.git
Öffne das Projekt mit Godot 4.3.
Starte die Szene Main.tscn, um den Benchmark auszuführen.
Nutzung
Physik-Benchmark (Becken-Füllung)
Beim Start wird das Becken automatisch mit Kugeln gefüllt (eine Kugel pro Millisekunde).
Der Benchmark endet automatisch, wenn die Frame-Time über 100 ms steigt.
Ergebnisse:
Die Anzahl der Kugeln und die gemessene maximale Frame-Time werden in der Konsole oder in einer Datei (user://performance_log.txt) protokolliert.
Render-Benchmark (Wachsendes Gitter)
Die Szene erzeugt ein Gitter, das sich mit jeder Kamerarotation vergrößert.
Während des Tests werden die folgenden Daten angezeigt:
FPS
Anzahl der gerenderten Objekte
Speicher- und GPU-Nutzung
Ergebnisse werden in der Konsole ausgegeben und in der Datei user://performance_log.txt gespeichert.
Messwerte verstehen
FPS (Frames per Second): Gibt an, wie flüssig die Simulation läuft. Werte unter 10 FPS deuten auf Leistungsengpässe hin.
Frame-Time: Zeit (in Millisekunden) für die Berechnung eines Frames. Werte über 100 ms bedeuten, dass die Simulation zu langsam ist.
Objektanzahl: Zeigt, wie viele aktive Objekte (Kugeln, Blöcke) in der Szene existieren.
Speichernutzung: Bezieht sich auf den statischen Speicher und den genutzten Videospeicher.
Ergebnisse speichern
Alle relevanten Messwerte werden automatisch in die Datei user://performance_log.txt geschrieben. Diese Datei ist im Export-Build verfügbar und kann zur Analyse der Testergebnisse verwendet werden.

Anpassungsmöglichkeiten
Die Parameter für die Tests, wie z. B. Startgröße des Gitters, Abstände und Kamerawinkel, können in den Skripten über Export-Variablen geändert werden. Diese Einstellungen sind direkt im Godot-Editor zugänglich.
Hinweise
Das Projekt wurde für Benchmarks auf Desktop-Systemen optimiert. Mobile Geräte könnten abweichende Ergebnisse liefern.
Es wird empfohlen, das Projekt als Windows-Export auszuführen, um die Hardware unter realistischen Bedingungen zu testen.
