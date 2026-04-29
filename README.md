# ASD S1000D - Issue 4.2

Dieses Repository enthält die offiziellen Spezifikationen, Schemata und unterstützenden Ressourcen für die **S1000D Issue 4.2**. 

S1000D ist eine internationale Spezifikation für die Erstellung von technischen Publikationen (Technical Publications) und wird häufig im Bereich Luft- und Raumfahrt, Verteidigung sowie im Anlagenbau verwendet. Sie basiert auf dem Konzept von Data Modules (DM) und der Nutzung von XML.

## Verzeichnisstruktur und Inhalte

Dieses Projekt umfasst die folgenden Hauptbestandteile:

- **`S1000D_Issue_4.2.pdf`**
  Das Hauptdokument der Spezifikation (Issue 4.2). Es beschreibt die Konzepte, die Architektur und die genauen Anforderungen der S1000D.

- **`XML Schema Package/`**
  Enthält die vollständigen XML-Schemata (XSD) für Issue 4.2. Dies schließt ein:
  - Flache und kategorisierte Schemata (`xml_schema_flat`, `xml_schema_cat`).
  - LOM (Learning Object Metadata) Schemata.
  - Entities (`ent`).
  Diese Dateien werden zur Validierung von XML-basierten Data Modules verwendet.

- **`Default BREX Data Module/`**
  Beinhaltet das Standard-BREX (Business Rules Exchange) Data Module. BREX-Module definieren die strukturellen Geschäftsregeln für ein Projekt. Enthalten sind XML-, HTML- sowie begleitende Textdokumente.

- **`Business Rule Template/`**
  Enthält Vorlagen für Geschäftsregeln (Business Rules) inklusive eines Beispiel-DMCs (Data Module Code) im XML- und PDF-Format. Diese dienen als Ausgangspunkt für die Definition projektspezifischer Vorgaben.

- **`Business Rule Decision Point Index/`**
  Beinhaltet die Datei `Issue 4.2 Project Decision Points.xlsx`. Diese Excel-Tabelle ist ein Index aller "Business Rule Decision Points" (BRDP), an denen in einem S1000D-Projekt spezifische Entscheidungen getroffen werden müssen.

- **`Data Dictionary/`**
  Ein Verzeichnis mit Informationen und Dateien zum Data Dictionary der S1000D, welches die standardisierten Datenelemente, Attribute und deren Bedeutung auflistet.

- **`Example SNS/`**
  Beispiele für das Standard Numbering System (SNS). Enthält verschiedene PDF-Dateien von Beispiel-Datenmodulen zur Veranschaulichung der SNS-Struktur.

- **`Unit of Measure/`**
  XML- und XSD-Dateien (z. B. `S1000DUnits.xml`, `Units.xsd`), die die in der S1000D zulässigen und standardisierten Maßeinheiten definieren.

## Nutzung

Die in diesem Repository bereitgestellten Dateien dienen als Grundlage für die Implementierung und Validierung von S1000D Issue 4.2 basierten Systemen (z. B. CSDB - Common Source Database) und Publikationsprozessen. 

Für den Einstieg wird empfohlen, das Hauptdokument `S1000D_Issue_4.2.pdf` sowie die projektspezifischen Business Rules (mittels BREX und den Decision Points) zu studieren, bevor XML-Inhalte gegen das `XML Schema Package` validiert werden.
