plugins {
    alias(libs.plugins.kotlin.jvm)
    application
}

repositories {
    mavenCentral()
}

dependencies {
    implementation(kotlin("stdlib"))
}

application {
    mainClass.set("MainKt")
}

// Custom Task
tasks.register<JavaExec>("runProblem") {
    group = "execution"
    description = "Run a specific Project Euler problem"

    val problemNumber: String? = project.findProperty("problem") as String?
    if (problemNumber == null) {
        throw GradleException("Please specify the problem number using -Pproblem=XXX")
    }

    val mainClassName = "Problem${problemNumber}Kt"

    classpath = sourceSets["main"].runtimeClasspath
    mainClass.set(mainClassName)
}
