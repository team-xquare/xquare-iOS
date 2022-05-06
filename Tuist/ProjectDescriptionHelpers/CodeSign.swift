import ProjectDescription

extension SettingsDictionary {
    public static let codeSign = SettingsDictionary()
        .codeSignIdentityAppleDevelopment()
        .automaticCodeSigning(devTeam: "5G56CAU886")
}
