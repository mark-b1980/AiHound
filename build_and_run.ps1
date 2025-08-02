# Change directory to the script's location
Set-Location $PSScriptRoot

# Create NPM file
if ($args.Count -gt 0 -and $args[0] -eq "npm") {
    Copy-Item npm_pom/pom.xml .
    mvn clean package
}

# Create JAR file
else{
    Copy-Item jar_pom/pom.xml .
    mvn clean package
    #jpackage --input lib --main-jar .\target\AiHound-2.0.0.jar --main-class com.pentest_experts.aihound.AiHoundUi --name "AiHound" --type exe
    java.exe -jar .\target\AiHound-2.0.0.jar
}
