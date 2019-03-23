Envido, proyecto base ruby
===========================


## Preparación del ambiente

sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install -y git
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.2.0
gem install bundler

## Uso del proyecto

Una vez realizada la instalación:

1. Instalar las dependencias del proyecto ejecutando _bundle install_
2. Ejecutar las pruebas ejecutando _bundle exec rake_

## Consigna del ejercicio

Construir una aplicación ruby de línea de comando que dado un trio de cartas calcule el valor de envido correspondiente en un juego de truco.

El desarrollo de la aplicación debe hacerse sigiuendo el ciclo BDD + TDD. 

El archivo acceptance_test.sh (Enlaces a un sitio externo.)Enlaces a un sitio externo. contiene un conjunto de pruebas funcionales desde la perspectiva de usuario y debe usarse guiar el ciclo macro propuesto por BDD.

Las pruebas de índole unitarias correspondiente al ciclo de TDD deben ser diseñadas y construidas como parte de la consigna. Dichas pruebas dependerán del diseño de objetos que cada uno realice.

Se espera que en la implementación de esta aplicación se apliquen los conceptos de diseño orientado a objeto vistos en esta materia y también en materias anteriores. También deben aplicarse los conceptos de Walking Skeleton y Arquitectura Hexagonal.