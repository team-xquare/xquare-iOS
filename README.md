
# XQUARE
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

## Requirements

- iOS 15+
- Swift 5
- SPM

## Architecture
```bash
├── Application
│   ├── Derived
│   │   └── Sources
│   │       ├── TuistAssets+XQUAREIOS.swift
│   │       ├── TuistAssets+XquareWidget.swift
│   │       ├── TuistBundle+XQUAREIOS.swift
│   │       ├── TuistBundle+XquareWidget.swift
│   │       └── TuistPlists+XQUAREIOS.swift
│   ├── Project.swift
│   ├── Resources
│   │   ├── Assets.xcassets
│   │   │   ├── AppIcon.appiconset
│   │   │   ├── Color
│   │   │   ├── Contents.json
│   │   │   └── Image
│   │   ├── Firebase
│   │   │   ├── GoogleService-Dev-Info.plist
│   │   │   ├── GoogleService-Prod-Info.plist
│   │   │   └── GoogleService-Stage-Info.plist
│   │   └── LaunchScreen.storyboard
│   ├── Sources
│   │   ├── Application
│   │   │   ├── AppDelegate.swift
│   │   │   └── XQUAREApp.swift
│   │   ├── Extension
│   │   │   └── UINavigationController.swift
│   │   ├── Modifier
│   │   │   └── Navigation
│   │   │       ├── NavigationBackButton.swift
│   │   │       └── NavigationBackButtonWithRouter.swift
│   │   ├── ResoucesCode
│   │   │   ├── Color.swift
│   │   │   └── Image.swift
│   │   ├── Router
│   │   │   ├── Route
│   │   │   │   └── Route
│   │   │   │       ├── NavigationNode.swift
│   │   │   │       ├── Router.swift
│   │   │   │       ├── RouterFactory.swift
│   │   │   │       ├── Routing.swift
│   │   │   │       └── View + Cover.swift
│   │   │   └── XQUARE
│   │   │       ├── XquareRoute.swift
│   │   │       ├── XquareRouter.swift
│   │   │       └── XquareRouterFactory.swift
│   │   └── Scene
│   │       ├── Application
│   │       │   ├── ApplicationView.swift
│   │       │   └── ApplicationViewModel.swift
│   │       ├── BugReport
│   │       │   ├── BugReportView.swift
│   │       │   ├── BugReportViewModel.swift
│   │       │   ├── DropDown
│   │       │   │   ├── DropDown.swift
│   │       │   │   ├── DropDownRow.swift
│   │       │   │   └── DropDownSelector.swift
│   │       │   └── ImportantText
│   │       │       └── ImportantTextView.swift
│   │       ├── ContentView.swift
│   │       ├── EditSchedule
│   │       │   └── EditScheduleView.swift
│   │       ├── Entire
│   │       │   ├── EntireView.swift
│   │       │   ├── ServiceList
│   │       │   │   ├── ServiceListCellView.swift
│   │       │   │   └── ServiceSectionView.swift
│   │       │   └── TopServiceMenu
│   │       │       ├── TopServiceMenuCellView.swift
│   │       │       └── TopServiceMenuView.swift
│   │       ├── Feed
│   │       │   ├── FeedView.swift
│   │       │   └── FeedViewModel.swift
│   │       ├── FindId
│   │       │   └── FindIdView.swift
│   │       ├── FindPassword
│   │       │   └── FindPasswordView.swift
│   │       ├── Home
│   │       │   ├── HomeView.swift
│   │       │   ├── HomeViewModel.swift
│   │       │   ├── Meal
│   │       │   │   ├── MealListCell.swift
│   │       │   │   └── MealMenuView.swift
│   │       │   ├── MovedClass
│   │       │   │   └── ClassRoomMoveView.swift
│   │       │   ├── Outing
│   │       │   │   └── OutingView.swift
│   │       │   └── Profile
│   │       │       └── ProfileView.swift
│   │       ├── LaunchScreen
│   │       │   ├── LaunchScreenView.swift
│   │       │   └── LaunchScreenViewModel.swift
│   │       ├── Login
│   │       │   ├── FindButtonView
│   │       │   │   └── FindButtonView.swift
│   │       │   ├── LoginView.swift
│   │       │   └── LoginViewModel.swift
│   │       ├── Main
│   │       │   └── MainView.swift
│   │       ├── MealDetail
│   │       │   ├── Cell
│   │       │   │   ├── MealDetailCell.swift
│   │       │   │   └── MealMenuPerMealTimeView.swift
│   │       │   ├── MealDetailView.swift
│   │       │   └── MealDetailViewModel.swift
│   │       ├── MyPage
│   │       │   ├── Information
│   │       │   │   └── MyInformationView.swift
│   │       │   ├── MyPageView.swift
│   │       │   ├── MyPageViewModel.swift
│   │       │   └── ProfileImage
│   │       │       └── ProfileImageView.swift
│   │       ├── Notification
│   │       │   ├── Cell
│   │       │   │   └── NotificationListCell.swift
│   │       │   ├── NotificationView.swift
│   │       │   └── NotificationViewModel.swift
│   │       ├── Onboarding
│   │       │   ├── OnboardingImageViewer.swift
│   │       │   └── OnboardingView.swift
│   │       ├── OutingPass
│   │       │   ├── Animation
│   │       │   │   └── SlidingTextView.swift
│   │       │   ├── Information
│   │       │   │   └── OutingInformationView.swift
│   │       │   ├── OutingPassView.swift
│   │       │   └── OutingPassViewModel.swift
│   │       ├── PointHistory
│   │       │   ├── PointHistoryListCellView.swift
│   │       │   ├── PointHistoryView.swift
│   │       │   ├── PointHistoryViewModel.swift
│   │       │   └── SelectButtonView.swift
│   │       ├── Schedule
│   │       │   ├── AcademicSchedule
│   │       │   │   ├── AcademicScheduleView.swift
│   │       │   │   ├── AcademicScheduleViewModel.swift
│   │       │   │   └── Cell
│   │       │   │       └── AcademicScheduleCell.swift
│   │       │   ├── Button
│   │       │   │   └── ScheduleButtonView.swift
│   │       │   ├── ScheduleView.swift
│   │       │   └── TimeTable
│   │       │       ├── Cell
│   │       │       │   └── TimeTableCell.swift
│   │       │       ├── PageControl
│   │       │       │   └── PageControlView.swift
│   │       │       ├── TimeTableView.swift
│   │       │       └── TimeTableViewModel.swift
│   │       ├── Signup
│   │       │   ├── SignupView.swift
│   │       │   ├── SignupViewModel.swift
│   │       │   └── TermsCaptionView.swift
│   │       └── WriteSchedule
│   │           ├── WriteScheduleView.swift
│   │           └── WriteScheduleViewModel.swift
│   ├── SupportingFiles
│   │   ├── Info.plist
│   │   └── XQUARE-iOS.entitlements
│   ├── Widget
│   │   ├── Resources
│   │   ├── Sources
│   │   │   ├── Application
│   │   │   │   └── XquareWidget.swift
│   │   │   ├── Meal
│   │   │   │   └── XquareMealWidget.swift
│   │   │   └── Schedule
│   │   │       ├── ScheduleWidgetCell.swift
│   │   │       └── XquareScheduleWidget.swift
│   │   └── SupportingFiles
│   │       ├── Info.plist
│   │       └── XquareWidget.entitlements
├── Configurations
│   ├── develop.xcconfig
│   ├── product.xcconfig
│   └── stage.xcconfig
├── LICENSE
├── Makefile
├── Modules
│   ├── KeychainModule
│   │   ├── Derived
│   │   │   └── InfoPlists
│   │   │       └── KeychainModule-Info.plist
│   │   ├── KeychainModule.xcodeproj
│   │   │   ├── project.pbxproj
│   │   │   ├── project.xcworkspace
│   │   │   │   └── contents.xcworkspacedata
│   │   │   ├── xcshareddata
│   │   │   │   ├── xcdebugger
│   │   │   │   └── xcschemes
│   │   │   │       └── KeychainModule.xcscheme
│   │   │   └── xcuserdata
│   │   │       └── gimgiyeong.xcuserdatad
│   │   │           └── xcschemes
│   │   │               └── xcschememanagement.plist
│   │   ├── Project.swift
│   │   └── Sources
│   │       ├── KeychainKeyType.swift
│   │       └── KeychainModule.swift
│   ├── RestApiModule
│   │   ├── Derived
│   │   │   └── InfoPlists
│   │   │       └── RestApiModule-Info.plist
│   │   ├── Project.swift
│   │   ├── RestApiModule.xcodeproj
│   │   │   ├── project.pbxproj
│   │   │   ├── project.xcworkspace
│   │   │   │   └── contents.xcworkspacedata
│   │   │   ├── xcshareddata
│   │   │   │   ├── xcdebugger
│   │   │   │   └── xcschemes
│   │   │   │       └── RestApiModule.xcscheme
│   │   │   └── xcuserdata
│   │   │       └── gimgiyeong.xcuserdatad
│   │   │           └── xcschemes
│   │   │               └── xcschememanagement.plist
│   │   └── Sources
│   │       ├── RestApiRemoteDataSource.swift
│   │       └── XquareAPI.swift
│   ├── XDateUtil
│   │   ├── Derived
│   │   │   └── InfoPlists
│   │   │       ├── XDateUtil-Info.plist
│   │   │       └── XDateUtilTest-Info.plist
│   │   ├── Project.swift
│   │   ├── Sources
│   │   │   ├── DateFormat.swift
│   │   │   ├── DateToString.swift
│   │   │   ├── StringToDate.swift
│   │   │   └── XDateFormatter.swift
│   │   ├── Tests
│   │   │   ├── DateToStringSpec.swift
│   │   │   └── StringToDateSpec.swift
│   ├── XEnvironment
│   │   ├── Project.swift
│   │   ├── Sources
│   │   │   └── XEnvironment.swift
│   │   ├── SupportingFiles
│   │   │   └── Info.plist
│   ├── XNavigationAndTab
│   │   ├── Derived
│   │   │   └── InfoPlists
│   │   │       └── XNavigationAndTab-Info.plist
│   │   ├── Project.swift
│   │   ├── Sources
│   │   │   ├── BackToMainView.swift
│   │   │   ├── Entity
│   │   │   │   └── TabInformation.swift
│   │   │   ├── Environment
│   │   │   │   └── TabBarSelection.swift
│   │   │   ├── OnTabSelected.swift
│   │   │   ├── Util
│   │   │   │   └── ViewToAnyView.swift
│   │   │   ├── XNavigationAndTabContent.swift
│   │   │   └── XNavigationAndTabView.swift
│   └── XOfflineCache
│       ├── Derived
│       │   └── InfoPlists
│       │       ├── XOfflineCache-Info.plist
│       │       └── XOfflineCacheTest-Info.plist
│       ├── Project.swift
│       ├── Sources
│       │   └── OfflineCacheUtil.swift
│       ├── Tests
│       │   └── OfflineCacheUtilSpec.swift
├── README.md
├── Services
│   ├── AttachmentService
│   │   ├── Derived
│   │   │   └── InfoPlists
│   │   │       └── AttachmentService-Info.plist
│   │   ├── Project.swift
│   │   └── Sources
│   │       ├── DI
│   │       │   └── AttachmentServiceDependency.swift
│   │       ├── Data
│   │       │   ├── Remote
│   │       │   │   ├── API
│   │       │   │   │   └── AttachmentAPI.swift
│   │       │   │   ├── DataSource
│   │       │   │   │   ├── RemoteAttachmentDataSource.swift
│   │       │   │   │   └── RemoteAttachmentDataSourceImpl.swift
│   │       │   │   └── Response
│   │       │   │       └── ImageUrlResponse.swift
│   │       │   └── Repository
│   │       │       └── AttachmentRepositoryImpl.swift
│   │       └── Domain
│   │           ├── Repository
│   │           │   └── AttachmentRepository.swift
│   │           └── UseCase
│   │               └── UploadImageUseCase.swift
│   ├── AuthService
│   │   ├── Derived
│   │   │   └── InfoPlists
│   │   │       └── AuthService-Info.plist
│   │   ├── Project.swift
│   │   └── Sources
│   │       ├── DI
│   │       │   └── AuthServiceDependency.swift
│   │       ├── Data
│   │       │   ├── Local
│   │       │   │   └── DataSource
│   │       │   │       ├── KeychainTypeForAuth.swift
│   │       │   │       ├── LoaclTokenDataSource.swift
│   │       │   │       ├── LoaclTokenDataSourceImpl.swift
│   │       │   │       ├── LocalAuthDataSource.swift
│   │       │   │       └── LocalAuthDataSourceImpl.swift
│   │       │   ├── Remote
│   │       │   │   ├── API
│   │       │   │   │   └── AuthAPI.swift
│   │       │   │   ├── Datasource
│   │       │   │   │   ├── RemoteAuthDataSource.swift
│   │       │   │   │   └── RemoteAuthDataSourceImpl.swift
│   │       │   │   ├── Request
│   │       │   │   │   ├── SigninRequest.swift
│   │       │   │   │   └── SignupRequest.swift
│   │       │   │   └── Response
│   │       │   │       └── SigninAndRefreshTokenResponse.swift
│   │       │   └── Repository
│   │       │       └── AuthRepositoryImpl.swift
│   │       ├── Domain
│   │       │   ├── Entity
│   │       │   │   ├── IdAndPasswordEntity.swift
│   │       │   │   ├── SigninEntity.swift
│   │       │   │   └── SignupEntity.swift
│   │       │   ├── Error
│   │       │   │   └── AuthServiceError.swift
│   │       │   ├── Repository
│   │       │   │   └── AuthRepository.swift
│   │       │   └── UseCase
│   │       │       ├── AutoLoginUseCase.swift
│   │       │       ├── CheckIsTokenValidUseCase.swift
│   │       │       ├── FetchAccessTokenUseCase.swift
│   │       │       ├── RefreshTokenIfExpiredUseCase.swift
│   │       │       ├── RefreshTokenUseCase.swift
│   │       │       ├── SigninUseCase.swift
│   │       │       └── SignupUseCase.swift
│   │       └── Plugin
│   │           └── JWTPulgin.swift
│   ├── MealDataService
│   │   ├── Project.swift
│   │   └── Sources
│   │       ├── DI
│   │       │   └── MealDataServiceDependency.swift
│   │       ├── Data
│   │       │   ├── Local
│   │       │   │   ├── DataSource
│   │       │   │   │   ├── LocalDataSource.swift
│   │       │   │   │   └── LocalDataSourceImpl.swift
│   │       │   │   └── Entity
│   │       │   │       └── MealMenu.swift
│   │       │   ├── Remote
│   │       │   │   ├── API
│   │       │   │   │   └── MealAPI.swift
│   │       │   │   ├── DateSource
│   │       │   │   │   ├── RemoteMealDataSource.swift
│   │       │   │   │   └── RemoteMealDataSourceImpl.swift
│   │       │   │   ├── Request
│   │       │   │   │   └── MonthToMealMenuRequest.swift
│   │       │   │   └── Response
│   │       │   │       ├── MealMenuPerDayResponse.swift
│   │       │   │       ├── MealMenuPerMonthListResponse.swift
│   │       │   │       └── MealMenuPerMonthResponse.swift
│   │       │   └── Repository
│   │       │       └── MealRepositoryImpl.swift
│   │       └── Domain
│   │           ├── Entity
│   │           │   ├── MealMenuEntity.swift
│   │           │   └── MealMenuPerDayEntity.swift
│   │           ├── Enum
│   │           │   └── MealTime.swift
│   │           ├── Error
│   │           │   └── MealServiceError.swift
│   │           ├── Repository
│   │           │   └── MealRepository.swift
│   │           └── UseCase
│   │               ├── FetchMealMenuPerDayUseCase.swift
│   │               └── FetchMealMenuPerMonthUseCase.swift
│   ├── NotificationService
│   │   ├── Project.swift
│   │   └── Sources
│   │       ├── DI
│   │       │   └── NotificationServiceDependency.swift
│   │       ├── Data
│   │       │   └── Remote
│   │       │       ├── API
│   │       │       │   └── NotificationAPI.swift
│   │       │       ├── DataSource
│   │       │       │   ├── RemoteNotificationDataSource.swift
│   │       │       │   └── RemoteNotificationDataSourceImpl.swift
│   │       │       ├── Repository
│   │       │       │   └── NotificationRepositoryImpl.swift
│   │       │       └── Response
│   │       │           ├── CategoryListResponse.swift
│   │       │           ├── CategoryResponse.swift
│   │       │           ├── NotificationListResponse.swift
│   │       │           ├── NotificationResponse.swift
│   │       │           └── UnreadCountResponse.swift
│   │       └── Domain
│   │           ├── Entity
│   │           │   ├── CategoryEntity.swift
│   │           │   └── NotificationEntity.swift
│   │           ├── Enum
│   │           │   └── NotificationTopic.swift
│   │           ├── Error
│   │           │   └── NotificationServiceError.swift
│   │           ├── Repository
│   │           │   └── NotificationRepository.swift
│   │           └── UseCase
│   │               ├── ActiveNotificationCategoryUseCase.swift
│   │               ├── CheckNotificationUseCase.swift
│   │               ├── FetchActivatedCategoryListUseCase.swift
│   │               ├── FetchNotificationCategoryListUseCase.swift
│   │               ├── FetchPostedNotificationListUseCase.swift
│   │               ├── FetchUncheckNotificationCountUseCase.swift
│   │               └── InactiveNotifcationCategoryUseCase.swift
│   ├── PickService
│   │   ├── Project.swift
│   │   └── Sources
│   │       ├── DI
│   │       │   └── PickServiceDependency.swift
│   │       ├── Data
│   │       │   └── Remote
│   │       │       ├── API
│   │       │       │   └── PickAPI.swift
│   │       │       ├── DataSource
│   │       │       │   ├── RemotePickDataSource.swift
│   │       │       │   └── RemotePickDataSourceImpl.swift
│   │       │       ├── Repostitory
│   │       │       │   └── PickRepositoryImpl.swift
│   │       │       └── Response
│   │       │           ├── MovedClassResponse.swift
│   │       │           ├── OutingPassResponse.swift
│   │       │           ├── OutingReturnTimeResponse.swift
│   │       │           ├── TodaySelfStudyTeacherListResponse.swift
│   │       │           └── TodaySelfStudyTeacherResponse.swift
│   │       └── Domain
│   │           ├── Entity
│   │           │   ├── MovedClassEntity.swift
│   │           │   ├── OutingPassEntity.swift
│   │           │   ├── OutingReturnTimeEntity.swift
│   │           │   ├── TodaySelfStudyTeacherEntity.swift
│   │           │   └── TodaySelfStudyTeacherListEntity.swift
│   │           ├── Error
│   │           │   └── PickServiceError.swift
│   │           ├── Repository
│   │           │   └── PickRepository.swift
│   │           └── UseCase
│   │               ├── DeleteReturnClassUseCase.swift
│   │               ├── FetchMovedClassUseCase.swift
│   │               ├── FetchOutingPassUseCase.swift
│   │               ├── FetchOutingReturnTimeUseCase.swift
│   │               └── FetchTodaySelfStudyTeacherUseCase.swift
│   ├── PointService
│   │   ├── Project.swift
│   │   └── Sources
│   │       ├── DI
│   │       │   └── PointServiceDependency.swift
│   │       ├── Data
│   │       │   └── Remote
│   │       │       ├── API
│   │       │       │   └── PointAPI.swift
│   │       │       ├── DataSource
│   │       │       │   ├── RemotePointDataSource.swift
│   │       │       │   └── RemotePointDataSourceImpl.swift
│   │       │       ├── Repository
│   │       │       │   └── PointRepositoryImpl.swift
│   │       │       └── Response
│   │       │           ├── PointHistoryResponse.swift
│   │       │           └── PointResponse.swift
│   │       └── Domain
│   │           ├── Entity
│   │           │   ├── PointEntity.swift
│   │           │   └── PointHistoryEntity.swift
│   │           ├── Enum
│   │           │   └── PointType.swift
│   │           ├── Error
│   │           │   └── PointServiceError.swift
│   │           ├── Repository
│   │           │   └── PointRepository.swift
│   │           └── UseCase
│   │               └── FetchPointHistoryUseCase.swift
│   ├── ScheduleService
│   │   └── Sources
│   │       ├── DI
│   │       │   └── ScheduleServiceDependency.swift
│   │       ├── Data
│   │       │   └── Remote
│   │       │       ├── API
│   │       │       │   └── ScheduleAPI.swift
│   │       │       ├── DataSource
│   │       │       │   ├── RemoteScheduleDataSource.swift
│   │       │       │   └── RemoteScheduleDataSourceImpl.swift
│   │       │       ├── Repository
│   │       │       │   └── ScheduleRepositoryImpl.swift
│   │       │       └── Response
│   │       │           ├── SchduleListResponse.swift
│   │       │           └── ScheduleResponse.swift
│   │       └── Domain
│   │           ├── Entity
│   │           │   └── ScheduleEntity.swift
│   │           ├── Error
│   │           │   └── ScheduleServiceError.swift
│   │           ├── Repository
│   │           │   └── ScheduleRepository.swift
│   │           └── UseCase
│   │               ├── CreateScheduleUseCase.swift
│   │               ├── DeleteScheduleUseCase.swift
│   │               ├── EditScheduleUseCase.swift
│   │               └── FetchSchedulePerMonthUseCase.swift
│   ├── TimeTableService
│   │   ├── Project.swift
│   │   ├── Sources
│   │   │   ├── DI
│   │   │   │   └── TimeTableServiceDependency.swift
│   │   │   ├── Data
│   │   │   │   └── Remote
│   │   │   │       ├── API
│   │   │   │       │   └── TimeTableAPI.swift
│   │   │   │       ├── DataSource
│   │   │   │       │   ├── RemoteTimeTableDataSource.swift
│   │   │   │       │   └── RemoteTimeTableDataSourceImpl.swift
│   │   │   │       ├── Repository
│   │   │   │       │   └── TimeTableRepositoryImpl.swift
│   │   │   │       └── Response
│   │   │   │           ├── DayTimeTableResponse.swift
│   │   │   │           ├── WeekTimeTableListResponse.swift
│   │   │   │           └── WeekTimeTableResponse.swift
│   │   │   └── Domain
│   │   │       ├── Entity
│   │   │       │   ├── DayTimeTableEntity.swift
│   │   │       │   └── WeekTimeTableEntity.swift
│   │   │       ├── Error
│   │   │       │   └── TimeTableServiceError.swift
│   │   │       ├── Repository
│   │   │       │   └── TimeTableRepository.swift
│   │   │       └── UseCase
│   │   │           └── FetchTimeTableForWeekUseCase.swift
│   └── UserService
│       ├── Project.swift
│       ├── Sources
│       │   ├── DI
│       │   │   └── UserServiceDependency.swift
│       │   ├── Data
│       │   │   └── Remote
│       │   │       ├── API
│       │   │       │   └── UserAPI.swift
│       │   │       ├── DataSource
│       │   │       │   ├── RemotaUserDataSource.swift
│       │   │       │   └── RemoteUserDataSourceImpl.swift
│       │   │       ├── Repository
│       │   │       │   └── UserRepositoryImpl.swift
│       │   │       └── Response
│       │   │           ├── ClassUserListResponse.swift
│       │   │           ├── ClassUserResponse.swift
│       │   │           ├── FCMTokenResponse.swift
│       │   │           ├── ProfileResponse.swift
│       │   │           ├── UserIdsResponse.swift
│       │   │           ├── UserResponse.swift
│       │   │           └── UserSimpleInformationResponse.swift
│       │   └── Domain
│       │       ├── Entity
│       │       │   ├── ClassUserEntity.swift
│       │       │   ├── FCMTokensEntity.swift
│       │       │   ├── ProfileEntity.swift
│       │       │   ├── UserEntity.swift
│       │       │   ├── UserIdsEntity.swift
│       │       │   └── UserSimpleInformation.swift
│       │       ├── Error
│       │       │   └── UserServiceError.swift
│       │       ├── Repository
│       │       │   └── UserRepository.swift
│       │       └── UseCase
│       │           ├── EditProfileImageUseCase.swift
│       │           ├── FetchExcludedUserListUseCase.swift
│       │           ├── FetchFCMTokenUseCase.swift
│       │           ├── FetchProfileUseCase.swift
│       │           ├── FetchUseSimpleInformationUseCase.swift
│       │           ├── FetchUserInformationByNameUseCase.swift
│       │           ├── FetchUserInformtaionByIdUseCase.swift
│       │           └── FetchUserListByClassUseCase.swift
├── Tuist
│   ├── Config.swift
│   ├── Dependencies
│   │   ├── Lockfiles
│   │   │   └── Package.resolved
│   │   ├── SwiftPackageManager
│   │   │   └── Package.swift
│   │   └── graph.json
│   ├── Dependencies.swift
│   └── ProjectDescriptionHelpers
│       ├── CodeSign.swift
│       ├── OrganizationName.swift
│       ├── Project Frame
│       │   └── Project+Framework.swift
│       ├── Scripts
│       │   ├── GoogleServiceInfoPlistScripts.swift
│       │   └── SwiftLintScripts.swift
│       └── TargetDependency
│           ├── Modules.swift
│           ├── SPM.swift
│           └── Services.swift
├── Workspace.swift
├── XQUARE-Workspace.xcworkspace
│   ├── contents.xcworkspacedata
│   ├── xcshareddata
│   │   ├── IDEWorkspaceChecks.plist
│   │   ├── WorkspaceSettings.xcsettings
│   │   ├── swiftpm
│   │   │   └── configuration
│   │   └── xcschemes
│   │       └── XQUARE-Workspace-Workspace.xcscheme
│   └── xcuserdata
│       └── gimgiyeong.xcuserdatad
│           ├── UserInterfaceState.xcuserstate
│           ├── xcdebugger
│           │   └── Breakpoints_v2.xcbkptlist
│           └── xcschemes
│               └── xcschememanagement.plist
├── ci_scripts
│   └── ci_post_clone.sh
