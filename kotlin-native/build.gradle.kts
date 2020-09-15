buildscript {
    repositories {
        jcenter()
    }
}

plugins {
    kotlin("multiplatform") version "1.4.0"
}

repositories {
    jcenter()
}

kotlin {
    val hostTarget = when {
        org.jetbrains.kotlin.konan.target.HostManager.hostIsLinux -> linuxX64("native")
        org.jetbrains.kotlin.konan.target.HostManager.hostIsMac -> macosX64("native")
        org.jetbrains.kotlin.konan.target.HostManager.hostIsMingw -> mingwX64("native")
        else -> throw GradleException("Host OS '${org.jetbrains.kotlin.konan.target.HostManager.host_os()}' is not supported in Kotlin/Native $project.")
    }

    targets.withType<org.jetbrains.kotlin.gradle.plugin.mpp.KotlinNativeTarget> {
        binaries.all {
            freeCompilerArgs = freeCompilerArgs + "-Xallocator=mimalloc"
        }
    }

    hostTarget.apply {
        binaries {
            executable("app", setOf(DEBUG, RELEASE)) {
                entryPoint = "main"
            }
        }
    }

    sourceSets {
        commonMain {
            dependencies {
                implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.3.9-native-mt")
            }
        }
    }
}