# Microsoft Dynamics 365 Business Central - AL Training
Dieses Repository enthält verschiedene Beispiele und Übungen für Entwickler von Microsoft Dynamics 365 Business Central.

# Inhalt

## Salesperson - My Customer Allocation
### Anforderung
Bei Änderung des `Verkäufercodes` in der Tabelle `Debitor` soll für den neu gewählten Verkäufercode, bzw. den zugewiesenen Benutzer (siehe `Benutzer Einrichtung`), ein entsprechender Eintrag in der Tabelle `Meine Debitoren` erstellt werden. Die Zuweisung, sofern vorhanden, für den alten Verkäufercode soll dabei entfernt werden.
### Involvierte Objekte
 - Table 9150 – My Customers
 - Table 91 – User Setup
 - Table 18 – Customer

## Inventory Availablity Signal
### Anforderung
In der `Verkaufsauftragzeilen` soll, je Artikelzeile, eine farbige Markierung (Rot, Grün, Grau) angezeigt werden, je nachdem ob der gerade gewählte `Artikel` ausreichend `Lagerbestand` (grün) aufweist, oder nicht verfügbar ist (rot).

Unter Anwendung von Überladung (`Procedure overload`), wird die Funktion zum Anzeigen der Lagerbestandsmarkierung für `Artikel Buch.-Blatt Zeilen` erweitert.

### Involvierte Objekte
 - Table 37 – Sales Line
 - Table 27 – Item 
 - Table 83 – Item Journal Line

## Customer Reward
### Anforderung
Es soll einem `Debitor` eine sogenannte `Vergütungsstufe` (Reward) zugeteilt werden können. Als Vergütungsstufen werden BRONZE, SILBER und GOLD festgelegt und zu jeder Vergütungsstufe gehört ein entsprechender Rabattsatz:
| Vergütungsstufe | Rabatt in % |
| :---------------: | -----------: |
| BRONZE | 5% | 
| SILBER | 10% | 
| GOLD | 15% | 

Die Vergütungsstufe soll initial bei der Installation der App, abhängig vom `Verkauf (MW)` Betrag  vergeben werden:
| Vergütungsstufe | ab Verkauf (MW) Betrag |
| :---------------: | ----------------------: |
| BRONZE | 0,- | 
| SILBER | 1.000,- | 
| GOLD | 5.001,- | 

Abhängig der zugeteilten Vergütungsstufe soll bei der Anlage einer `Verkaufsauftragszeile` (Sales Line, Document Type = Order) der entsprechende Rabatt, **zusätzlich** zu den regulären Rabatten auf den gem. der Preisfindung, angewandt werden. 

### Involvierte Objekte
 - Table 37 – Sales Line
 - Table 18 – Customer
