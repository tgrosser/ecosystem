# Installation
## Systemvoraussetzungen

Voraussetzung für die Installation des Cloudogu Ecosystems (CES) ist zunächst die Installation einer Virtualisierungssoftware. Installieren Sie dafür eine der folgenden Virtualisierungssoftware. Wählen Sie dabei, die für ihr Betriebssystem angebotene Version in aktuellster Form aus.

• VW Ware Workstation Player (min. Version XXX)  [Klicke hier](http://www.vmware.com/products/player/playerpro-evaluation.html)

• VirtualBox (min. Version XXX) [Klicke hier](https://www.virtualbox.org/wiki/Downloads )

•	Qemu (min. Version xxx) [Klicke hier](http://www.qemu.org/download/)

### Hardwareanforderungen
|Komponente| Minimale Anforderung | Empfohlene Anforderung |  
|:---------| :------------------- | :--- |
|Komponente 1|
|Komponente 2|....................|......|  

##Bezugsquellen für das Cloudogu Ecosystem (CES)
Informationen eintragen und Link nachtragen

## CES Image in Oracle VM VirtualBox importieren

1.	Öffnen Sie Oracle VM VirtualBox z.B. per Doppelklick auf das entsprechende Desktop-Icon. 

2.	Es öffnet sich Ihr Oracle VM VirtualBox Manager.  
![Oracle VM VirtualBox Manager](CES_VirtualBox/1.png "Orcale VM VirtualBox Manager")

3.	Wählen Sie unter Datei - Appliance importieren aus.  
![Appliance importieren auswählen](CES_VirtualBox/2.png "Appliance importieren auswählen")

4.	Wählen Sie die OVF-Datei des CES dort aus, wo Sie sie gespeichert haben und klicken Sie anschließend auf "Weiter" um fortzufahren.  
![OVF-Datei zur Einbindung des Images auswählen](CES_VirtualBox/3.png "OVF-Datei zur Einbindung des Images auswählen")

5.	Bevor Sie das Image importieren, wird Ihnen die Standardsystemkonfiguration angezeigt, die sich auf das virtuelle System für das CES beziehen. Sie können Änderungen an vielen dieser Einstellungen mittels Doppelklick bzw. durch Auswahl der entsprechenden Checkbox ändern.   
**Achtung:** Das CES ist entsprechend der Standardkonfiguration optimiert. Änderungen können die Funktionalität gefährden. Möglich sind jedoch Anpassungen  die sich auf die Leistungsfähigkeit beziehen (z.B. CPU, RAM). Dabei ist darauf zu achten, dass die Standardkonfiguration in Bezug auf ihre Leistungsfähigkeit nicht unterschritten werden darf.   
Folgende Konfigurationen sollten nicht verändert werden:  
• XXX  
• XXX   
• XXX  
Nachdem Sie Ihre Anpassungen durchgeführt haben oder die Standardkonfiguration beibehalten haben, wählen Sie das Kontrollkästchen „Zuweisen neuer MAC-Adressen für alle Netzwerkkarten“ aus und klicken auf „Importieren“.
![Appliance Einstellungen](CES_VirtualBox/4.png "Appliance Einstellungen")

6. Die Appliance bzw. das Image wird importiert. Warten Sie, in kurzer Zeit ist dieser Vorgang abgeschlossen.  
![Appliance bzw. Image Import](CES_VirtualBox/5.png "Appliance bzw. Image Import")

7. Das virtuelle System, welches zur Installation des CES benötigt wird, steht nun zur Verfügung.
![Virtuelles System erzeugt](CES_VirtualBox/6.png "Virtuelles System erzeugt")

8.	Starten Sie das virtuelles System(mit dem Namen „ces“) in dem Sie es auswählen und auf den grüne Pfeil („Starten“) klicken.

9.	Nachdem das virtuelle System gestartet wurde, erscheint folgende Ansicht.
![VirtualBox CES – CES Login](CES_VirtualBox/7.png "VirtualBox CES – CES Login")

10.	Nach der erfolgten Eingabe werden Sie aufgefordert Ihr Passwort einzugeben.
![: VirtualBox CES - Passworteingabe](CES_VirtualBox/8.png ": VirtualBox CES - Passworteingabe")
Das Passwort lautet „ces-admin“. Geben Sie es ein und bestätigen Sie mit „Enter“.  
**Achtung:** Nach dem erfolgreichen Setup (Schritt "Cloudogu Ecosystem (CES) Setup") wird das Passwort geändert, so dass ein Zugriff durch die voreingestellten Zugangsdaten nicht mehr möglich ist.

11.	Um die IP-Adresse Ihres virtuellen Systems zu ermitteln, geben Sie nun „ifconfig“ ein und bestätigen Sie mit „Enter“. Notieren Sie die IP-Adresse und fahren Sie mit dem Schritt "Cloudogu Ecosystem (CES) Setup" fort.  
**Hinweis:** Sofern Ihr virtuelles System über keine IP-Adresse verfügt überprüfen Sie bitte Ihre Netzwerkeinstellung in VirtualBox und versuchen Sie es erneut.

## CES Image in VMware Workstation Pro importieren

1.	Öffnen Sie VMware Workstation Pro z.B. per Doppelklick auf das entsprechende Desktop-Icon. 

2.	Es öffnet sich Ihre VMware Workstation.
![VMware Workstation](CES_VMware/1.png ": VMware Workstation")

3. Wählen Sie unter „File“ die Funktion „Open…“ aus.
![Image auswählen unter VMware Workstation](CES_VMware/2.png ": Image auswählen unter VMware Workstation")

4. Wählen Sie die „VMware virtual machine configuration“ des CES dort aus, wo Sie sie gespeichert haben und öffnen Sie diese. 
![VMware virtual machine configuration des CES öffnen](CES_VMware/3.png ": VMware virtual machine configuration des CES öffnen")

5.	Das Image ist nun eingebunden.
![Virtuelle Maschine importiert](CES_VMware/4.png "Virtuelle Maschine importiert")

6.	Für Konfigurationsanpassungen am virtuellen System klicken Sie auf „Edit virtual machine settings“.
![VMware - Einstellungen](CES_VMware/5.png "VMware - Einstellungen")  
Unter „Hardware“ kann die Hardwarekonfiguration des virtuellen Systems editiert werden. Die optimalen Hardwarevoraussetzungen sind voreingestellt.   
Durch Anklicken der Funktion „Add“ können Sie weitere Hardwarekomponenten hinzufügen. Mit „Remove“ können bestimmte Hardwarekomponenten wieder entfernt werden. 
Der Reiter „Options“ ermöglicht Ihnen Einstellungen vorzunehmen, die sich nicht auf die Hardware beziehen. 
Sofern Sie keine Anpassungen vornehmen wollen, können Sie zum nächsten Schritt übergehen.  
**Achtung:** Das CES ist entsprechend der Standardkonfiguration optimiert. Änderungen können die Funktionalität gefährden. Es ist darauf zu achten, dass die Standardkonfiguration in Bezug auf ihre Leistungsfähigkeit nicht unterschritten werden darf. 
Folgende Konfigurationen sollten nicht verändert werden:  
•	XXX  
•	XXX   
•	XXX   

7.	Sie haben das virtuelle System „ces“ ausgewählt. Zum Starten des System klicken Sie auf „Power on this virtual machine“. 
![Virtuelles System starten](CES_VMware/6.png "Virtuelles System starten")

8.	Nachdem das virtuelle System gestartet wurde, erscheint folgende Ansicht.
![VMware – CES Login](CES_VMware/7.png "VMware – CES Login")
Sie werden nach Ihrem „ces login:“ gefragt. Geben Sie „ces-admin“ ein und bestätigen Sie mit „Enter. 

9.	Nach der erfolgten Eingabe werden Sie aufgefordert Ihr Passwort einzugeben.
![VWware CES - Passworteingabe](CES_VMware/8.png "VWware CES - Passworteingabe")
Das Passwort lautet „ces-admin“. Geben Sie es ein und bestätigen Sie mit „Enter“.  
**Achtung:** Nach dem erfolgreichen Setup (siehe hierzu Cloudogu Ecosystem (CES) Setup, Schritt XXX) wird das Passwort geändert, so dass ein Zugriff durch die voreingestellten Zugangsdaten nicht mehr möglich ist.

10.	Um die IP-Adresse Ihres virtuellen Systems zu ermitteln, geben Sie nun „ifconfig“ ein und bestätigen Sie mit „Enter“. Notieren Sie die IP-Adresse und fahren Sie unter "Cloudogu Ecosystem (CES) Setup" fort.  
**Hinweis:** Sofern Ihr virtuelles System über keine IP-Adresse verfügt überprüfen Sie bitte Ihre Netzwerkeinstellung in VirtualBox und versuchen Sie es erneut.

## Cloudogu EcoSystem (CES) Setup

1.	Öffnen Sie einen Browser.

2.	Geben Sie in die Adressleiste „http://**IP-Adresse des virtuellen CES Systems**:8080“ ein und drücken Sie „Enter“.

3.	Es öffnet sich das Setup des CES. Als erstes beginnt die Registrierung. Klicken Sie hierzu auf „Register instance“.
![Start der Registrierung](CES_Setup/1.png "Start der Registrierung")

4.	Es öffnet sich folgendes Fenster.
![Anmeldung über bestehenden Account oder andere Konten](CES_Setup/2.png "Anmeldung über bestehenden Account oder andere Konten")  
Sofern Sie weder über ein Cloudogu-, GitHub- oder Google-Konto verfügen klicken Sie auf „Register“. Andernfalls können Sie sich über ein o.g. Konto anmelden. Hierfür wählen Sie den entsprechenden Button und melden sich an.

5.	Wenn Sie auf „Register“ geklickt haben öffnet sich das nachfolgende Fenster.
![Registrierung](CES_Setup/3.png "Registrierung")  
Geben Sie ihre E-Mail Adresse und ein von Ihnen gewähltes Passwort ein. Anschließend wiederholen Sie bitte ihr Passwort. Abschließend klicken Sie auf „Register“. Sie erhalten in Kürze eine E-Mail der einen Link zur Bestätigung enthält.

6.	Sobald Sie die E-Mail erhalten haben klicken Sie auf den Link in Ihrer Bestätigung oder kopieren Sie die URL in Ihrem Browser in die Adresszeile und bestätigen Sie mit „Enter“. Es öffnet sich folgendes Fenster.
![Registrierung abgeschlossen](CES_Setup/4.png "Registrierung abgeschlossen")  
Klicken Sie auf „Next Section“ um fortzufahren.

7.	In diesem Schritt können Sie länderspezifische Einstellungen vornehmen. 
![Region auswählen](CES_Setup/5.png "Region auswählen") 
Es stehen zwei Checkboxen zur Verfügung. In der Ersten („Terminal Locale“) können Sie die Sprache des Terminals einstellen. In der Zweiten („TimeZone“) können Sie zwischen diversen Zeitzonen auswählen. Abschließend klicken Sie auf „Next Section“.

8.	Das nächste Fenster ermöglicht es Ihnen Anpassungen im Bereich „Naming“ vorzunehmen. 
![Naming](CES_Setup/6.png "Naming") 
Die „FQDN“ zeigt standardmäßig die IP-Adresse des virtuellen Systems an. Sie können die „FQDN“ auch ändern in dem Sie z.B. eine firmeneigene URL eintragen.   
**Hinweis:** Empfehlenswert ist eine Zusammensetzung aus „Hostname“ und „Domain“  
Geben Sie anschließend einen „Hostname“, und die „Domain“ ein.  
 Das Feld „Certificate Type“ hat eine Checkbox in der Sie zwischen „Self Signed“ und „External“ wählen können. Standardmäßig ist die Checkbox auf „Self Signed“ eingestellt. Sofern Sie auf „External“ wechseln sind folgende Eingaben vorzunehmen.
![Zertifizierung ändern](CES_Setup/7.png "Zertifizierung ändern") 
Geben Sie sowohl das „Certificate“ als auch den Certificate Key in PEM-Format in die entsprechenden Felder ein.   **Hinweis:** Wenn ein Intermediate Zertifikat eingesetzt werden soll, muss sowohl das Server als auch das Intermediate Zertifikat eingefügt werden.  
Abschließend geben Sie bitte Ihren „Mail Relay Host“ als URL oder IP-Adresse ein und klicken auf „Next Section“.

9.	In diesem Abschnitt des CES-Setups können Sie für das User Backend den „Directory Service Type“ festlegen.
![Directory Service Type – Embedded](CES_Setup/8.png "Directory Service Type – Embedded") 
Standardmäßig ist der „Directory Service Type“  auf „Embedded“ gestellt. Diese Einstellung wird für das Cloudogu Ecosystem (CES) empfohlen. Sofern Sie diese Einstellung verwenden können Sie die Schritte 10., 11. und 12. überspringen und mit Schritt 13. fortfahren

10.	Das CES ermöglicht es Ihnen ein externes Usermanagement zu verwenden. Hierfür wählen Sie als „Directory Service Type“ „External“ aus. In der Checkbox „Server“ existieren die Auswahlmöglichkeiten „Active Directory“ und „Custom“. 
![Directory Service Typ - External](CES_Setup/9.png "Directory Service Typ - External") 

11.	Anbindung der Active Directory   
Wenn Sie „Active Directory“ ausgewählt haben, stehen Ihnen folgende Konfigurationsfelder zur Verfügung.
![Directory Service Type - Active Directory](CES_Setup/10.png "Directory Service Type - Active Directory") 
Eingaben im Bereich "Connection":
- Host
- Port: Der Port über den die Kommunikation mit der Ihrer Active Directory erfolgt.  
- Encryption: Sofern die Verschlüsselung durch die Angabe des Ports nicht erfolgte, kann Sie an dieser Stelle mittels Checkboxauswahl nachgetragen werden.  
- Connection DN: Geben Sie den Distinguished Name des Nutzers ein.
- Connection Password: Geben Sie das zugehörige Passwort ein.

    Eingaben imBereich „Search“:
- Base DN: Geben Sie den Suchbereich an, indem gesucht werden soll. Startpunkt muss hierbei nicht das Root-Verzeichnis sein, sonder er kann innerhalb der Verzeichnisstruktur definiert werden.

    Klicken Sie auf „Next Section“.  
Es öffnet sich folgendes Fenster.
![Active Directory Request](CES_Setup/11.png "Active Directory Request")   
Geben Sie bitte den „Username“ und das „Password“ ein, anschließend klicken Sie auf „Login“. 
Ist der Request erfolgreich gewesen, erscheint folgende Nachricht.
![Active Directory Request erfolgreich](CES_Setup/12.png "Active Directory Request erfolgreich")  
Da der Request in diesem Fall erfolgreich war, können Sie mit einem Klick auf „Continue Setup“ fortfahren.  
Ist der Request fehlgeschlagen öffnet sich dieses Fenster.
![Active Directory Request fehlgeschlagen](CES_Setup/13.png "Active Directory Request fehlgeschlagen")  
Sie können der Meldung im orangenen Kasten entnehmen, dass die von Ihnen gesuchte userdn nicht gefunden werden konnte. Zur Überprüfung der Suchfilter und der basedn Konfiguration klicken Sie auf „Edit Configuration“ und überprüfen Sie ihre Konfiguration.

12.	Anbindung einer angepassten (Custom) Konfiguration
Wenn Sie „Custom“ (in Schritt 10.) ausgewählt haben, stehen Ihnen folgende Konfigurationsfelder zur Verfügung.
![Directory Service - External](CES_Setup/14.png "Directory Service - External") 
 Das Feld „Search Filter“ dient dazu die Suche einzugrenzen z.B. über den Filterbefehl „(objectClass=person)“. Anschließend scrollen Sie herunter und sie sehen folgende Darstellung.
![Directory Service - External II](CES_Setup/15.png "Directory Service - External II")
Eingaben im Bereich „Attribute Mapping“:
- geben Sie die entsprechenden Bezeichnungen in die Felder ein, damit das Dogu „Central Authentification Service“ (CAS) auf Ihren LDAP zugreifen und die richtigen Attribute abrufen kann. Auf diese Weise weiß er welche Bezeichnung z.B. dem „Username Attribute“ entspricht. Sofern Sie eine Active Directory anbinden möchten, wäre die Bezeichnung „sAMAccountName“. (Die in Abbildung 26 unter „Attribute Mapping“ eingetragenen Bezeichnungen beziehen sich alle auf die Anbindung einer Active Directory. Je nach Konfiguration des LDAP-Servers unterscheiden sich die jeweiligen Bezeichnungen und sind dementsprechend anzupassen.)  
- Anschließend können Sie optional das Kontrollkästchen neben „Use user connection to fetch attributes“ auswählen um die Attribute mittels der Username und Password bei der Anmeldung abzurufen. Wählen Sie diese Möglichkeit nicht aus, so werden die Attribute über die „Connection DN“ und das „Connection Password“ abgerufen.
  
    Eingaben im Bereich „Group Mapping“:
- Geben Sie bitte die „Group Base DN“, den „Group Search Filter“ und das „Group Name Attribute“ ein. Hierdurch kann die Userzuweisung zu einer spezifischen Gruppe identifiziert werden. Das ist insbesondere dann notwendig, wenn keine „Member of Attribute“ Zuweisung in Ihrem LDAP vorhanden ist.  

    Klicken Sie auf „Next Section“.  
Es öffnet sich folgendes Fenster.
![Active Directory Request](CES_Setup/11.png "Active Directory Request")  
Geben Sie bitte den „Username“ und das „Password“ ein, anschließend klicken Sie auf „Login“. Der Request kann erfolgreich sein oder fehlschlagen. Beide Fälle werden nachfolgend erläutert.  
Ist der Request erfolgreich gewesen, erscheint folgende Nachricht.
![Active Directory Request erfolgreich](CES_Setup/12.png "Active Directory Request erfolgreich")  
Da der Request erfolgreich war, können Sie mit einem Klick auf „Continue Setup“ fortfahren.  
Ist der Request fehlgeschlagen öffnet sich dieses Fenster.
![Active Directory Request fehlgeschlagen](CES_Setup/13.png "Active Directory Request fehlgeschlagen") 
Sie können der Meldung im orangenen Kasten entnehmen, dass die von Ihnen gesuchte userdn nicht gefunden werden konnte. Zur Überprüfung der Suchfilter und der basedn Konfiguration klicken Sie auf „Edit Configuration“. Nehmen Sie Anpassungen an Ihrer Konfiguration vor und versuchen Sie es erneut.

13.	Im nächsten Schritt des Setups „Dõgu“ können Sie festlegen welche Dõgus sie installieren möchten.
![Auswahl der zu installierenden Dogus](CES_Setup/16.png "Auswahl der zu installierenden Dogus")
Die zur Auswahl stehenden Dõgus sind:
- Central Authentication Service
- Jenkins CI
- Nginx
- Postfix
- Redmine
- SCM-Manager
- SonarQube
- User Management
- Cockpit
- MySQL/MariaDB
- OpenLDAP (Vorausgewählt sofern als Verzeichnisdienst „Embedded“ gewählt wurde)
- PostgreSQL
- Registrator
- Smeagol
- Sonatype Nexus

    **Achtung:** Bitte beachten Sie, dass manche Dõgus stand-alone installiert werden können (z.B. Postfix oder MySQL/MariaDB), andere wiederrum nicht (z.B. Redmine, oder Jenkins CI) auf Grund ihrer Abhängigkeit von bestimmten Dõgus. Möchten Sie z.B. Jenkins CI installieren, wählt das Setup automatisch „Central Authentification Service“, „Nginx“, „Postfix“ und „Registrator“ aus.   

    In der Checkbox „Default Dogu“ können Sie das Dõgu auswählen, das standardmäßig geöffnet werden soll, wenn der „FQDN“ aufgerufen wird.  

    Klicken Sie „Next Section“ um mit dem Setup fortzufahren.

14.	Der folgende Schritt unterscheidet sich je nachdem ob Sie einen externen oder den integrierten Verzeichnisdienst nutzen. 
Haben sie den internen Verzeichnisdienst („Embedded“) gewählt erscheint folgende Darstellung.
![Admin Setup - interner Verzeichnisdienst](CES_Setup/17.png " Admin Setup - interner Verzeichnisdienst")
Eingaben Im Bereich „Administrator“:
- Legen Sie einen neuen User für den integrierten Verzeichnisdienst an.  Geben Sie hierfür einen Namen (unter „Username“), eine gültige E-Mailadresse (unter „E-Mail“) und ein Passwort (unter „Password“) ein.   Bestätigen Sie das Passwort durch erneute Eingabe (unter „Confirm Password“).  

- Als nächstes weisen Sie dem Account eine „Admin Group“ zu durch die Eingabe einer entsprechenden Bezeichnung.  (**interne Anmerkung: PRÜFEN!**)
Wenn Sie dem angelegten User außerdem als Tool-Admin-Rechte einräumen möchten, klicken Sie das Kontrollkästchen neben „Configure this user also as tool administrator?“.  
 
- Abschließend klicken Sie auf „Start Setup“ und gehen Sie zu Schritt 15. über.  

- Haben Sie sich zuvor entschieden einen externen Verzeichnisdienst (z.B. eine Active Directory) zu nutzen, dann stellt sich das Fenster wie folgt dar.
![Admin Setup - externer Verzeichnisdienst](CES_Setup/18.png "Admin Setup - externer Verzeichnisdienst")
Tragen Sie unter „Admin Group“ die Gruppe oder einen User Ihres Verzeichnisdienstes ein, der Sie Adminrechte einräumen möchten. Danach klicken Sie auf „Start Setup“. (**interne Anmerkung: PRÜFEN!**)

15.	Der Installationsprozess beginnt.
![Installationsprozess](CES_Setup/19.png "Installationsprozess")

16.	Der Installationsprozess ist erfolgreich abgeschlossen wurden.
![Installation abgeschlossen](CES_Setup/20.png "Installation abgeschlossen")
**Achtung:** Notieren Sie sich unbedingt die dargestellten Zugangsdaten („id“ und „pw“). Diese ermöglichen Ihnen den Zugang zum System, z.B. die virtuelle Maschine, auf der Sie das CES installiert haben.   
Um das Setup zu beenden und auf die Startseite Ihres CES zu gelangen klicken Sie auf „Shutdown Setup and open EcoSystem start page“.

17.	Es öffnet sich ein Browserfenster, welches Ihnen die folgende Anmeldemaske anzeigt.
![Anmeldung CES](CES_Setup/21.png "Anmeldung CES")
Geben Sie in dieser Maske die von Ihnen eingegebenen Anmeldeinformationen, sofern sie den internen Verzeichnisdienst ausgewählt haben. Andernfalls tragen Sie Ihre persönlichen Zugangsdaten des externen Verzeichnisdienstes (z.B. Active Directory) ein. 




