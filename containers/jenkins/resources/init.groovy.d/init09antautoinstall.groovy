import jenkins.model.*;
import hudson.*
import hudson.model.*
import hudson.tasks.*
import hudson.tools.*

def version = '1.9.7';
def instance = Jenkins.getInstance();

def antDesc = instance.getDescriptor("hudson.tasks.Ant");
def installations = antDesc.getInstallations();
boolean antInstalled = false;
if (installations != null) {
  installations.each { installation ->
    def inst = "${installation}"
    if (inst.contains("Ant_"+version)) {
      // Ant version is already installed
      antInstalled = true;
    }
  }
}
if (!antInstalled) {
  def antInstaller = new Ant.AntInstaller(version);
  def instSourcProp = new InstallSourceProperty([antInstaller]);
  def antInst = new Ant.AntInstallation("Ant_"+version, "", [instSourcProp]);
  antDesc.setInstallations(antInst);
  antDesc.save();
  instance.save();
}
