# XQUARE
![iOS badge](https://img.shields.io/badge/iOS-15.0%2B-green) ![swift badge](https://img.shields.io/badge/swift-5-orange)


DSM 학교 관리 시스템


## Screen
**iOS**

|홈|시간표|학사일정|
|:---:|:---:|:---:|
|<img src="https://user-images.githubusercontent.com/81291116/230513521-7dcd8e16-f9ed-4213-968f-755ea67604dc.png" width="300px">|<img src="https://user-images.githubusercontent.com/81291116/230513562-5d1cf0e9-c17f-4427-9c72-d889c34e8189.png" width="300px">|<img src="https://user-images.githubusercontent.com/81291116/230513636-453e531e-f0fd-42b6-b929-a9eaad55e166.png" width="300px">

|피드|신청|전체|
|:---:|:---:|:---:|
|<img src="https://user-images.githubusercontent.com/81291116/230513665-2222ff73-fd91-4cdd-a51e-acf6d0511d13.png" width="300px">|<img src="https://user-images.githubusercontent.com/81291116/230513698-d540a453-087e-4cf4-9b95-7a870ad48d78.png" width="300px">|<img src="https://user-images.githubusercontent.com/81291116/230513738-85d66972-7846-48aa-950a-ff999311f409.png" width="300px">

|Widget|
|:--:|
|<img src="https://user-images.githubusercontent.com/81291116/230514161-147fe907-783c-43a6-bfe8-7f7a48bfd57e.jpeg" width="300px">|


## Library
- [KeychainSwift](https://github.com/evgenyneu/keychain-swift)
- [Moya](https://github.com/Moya/Moya.git)
- [RxSwift](https://github.com/ReactiveX/RxSwift)
- [SemicolonDesign](https://github.com/semicolonDSM/SemicolonDesign_iOS.git)
- [XWebKit](https://github.com/team-xquare/XWebKit)


## Based Architecture
![iOS](https://github.com/team-xquare/xquare-iOS/assets/67373938/117c10bd-a118-44af-ae47-9ad2b409c31c)


## File structure
```bash
├── Application
│   ├── Project.swift
│   ├── Resources
│   ├── Sources
│   │   ├── Application
│   │   ├── Extension
│   │   ├── Modifier
│   │   ├── ResoucesCode
│   │   ├── Router
│   │   └── Scene
│   ├── SupportingFiles
│   └── Widget
├── Modules
│   ├── KeychainModule
│   ├── RestApiModule
│   ├── XDateUtil
│   ├── XEnvironment
│   ├── XNavigationAndTab
│   └── XOfflineCache
├── Services
│   ├── AttachmentService
│   ├── AuthService
│   ├── MealDataService
│   ├── NotificationService
│   ├── PickService
│   ├── PointService
│   ├── ScheduleService
│   ├── TimeTableService
│   └── UserService
├── Tuist
├── Workspace.swift
└── ci_scripts
