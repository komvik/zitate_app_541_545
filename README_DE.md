# Quotes App - README

## Beschreibung

Die **Quotes App** ist eine Flutter-Anwendung, die es dem Benutzer ermöglicht, Zitate anzuzeigen, ein zufälliges Zitat von einer API abzurufen und es auf dem Bildschirm darzustellen. Zusätzlich bietet die App die Möglichkeit, Zitate und Kategorien von Zitaten zu speichern, sodass beim Neustart der App ein Zitat geladen werden kann. Der Benutzer kann auch zwischen verschiedenen Kategorien von Zitaten wählen und diese kategorienbasiert anzeigen lassen.

Die App verwendet folgende Technologien:
- **Flutter**: Für die Benutzeroberfläche.
- **HTTP**: Zum Abrufen von Daten von einer API.
- **SharedPreferences**: Zum Speichern der letzten Zitate und ausgewählten Kategorien lokal.

## Features

1. **Zufälliges Zitat abrufen**: Beim Klick auf einen Button wird ein zufälliges Zitat von der API abgerufen und angezeigt.
2. **Zitate speichern**: Das zuletzt abgerufene Zitat wird in den **SharedPreferences** gespeichert, sodass es beim nächsten Start der App wieder angezeigt wird.
3. **Kategorien von Zitaten**: Der Benutzer kann eine Kategorie (z. B. „Inspirational“, „Love“) auswählen und Zitate dieser Kategorie abrufen.
4. **Zitat und Kategorie löschen**: Der Benutzer kann das gespeicherte Zitat und die ausgewählte Kategorie löschen.
5. **Zitate bei App-Start laden**: Beim Start der App wird das zuletzt gespeicherte Zitat aus den SharedPreferences geladen, falls vorhanden.

