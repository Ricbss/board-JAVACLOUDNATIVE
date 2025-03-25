plugins {
    id("java")
    id("maven-publish") // Caso queira publicar o artefato em repositórios Maven
}

group = "br.com.dio"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    implementation("org.liquibase:liquibase-core:4.29.1")
    implementation("mysql:mysql-connector-java:8.0.33")
    implementation("org.projectlombok:lombok:1.18.34")

    annotationProcessor("org.projectlombok:lombok:1.18.34")
}

java {
    // Define a versão do Java (ajuste conforme sua versão)
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
}

tasks.test {
    useJUnitPlatform()
}

tasks.javadoc {
    // Habilitar a geração de Javadoc
    options.addStringOption("Xdoclint:none", "-quiet")
}

tasks.jar {
    // Adicionar tarefa de gerar JAR (caso não tenha)
    archiveBaseName.set("meu-projeto")
    archiveVersion.set("1.0.0")
}

