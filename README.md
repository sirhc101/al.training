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
