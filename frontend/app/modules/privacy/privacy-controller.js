app.controller('PrivacyController',function (
    $scope,
    LoadingMaskService,
    loggedInUser,
    ApplicationService,
    ProfileService,
    $location
) {
    $scope.loadingData = true;
    LoadingMaskService.deactivate();
    ApplicationService.hideNavigationIndicator();
    ApplicationService.displayPageHeader({ search: true});
    ApplicationService.updatePageHeader(loggedInUser);

    $scope.verfiedUser = loggedInUser.state === 'verified';

    reloadData();

    function reloadData(displaySavedBanner = false) {
        $scope.loadingData = true;
        if (!$scope.verfiedUser){
            $scope.loadingData = false;
            return;
        }
        ProfileService.getPrivacy()
        .then((response)=>{
            $scope.data = {
                privacyValue : response.data.privacy,
                showCase: response.data.userShowCase === 1
            };
            $scope.loadingData = false;
            $scope.saved = displaySavedBanner;
        });
    }

    $scope.save = function () {
        $scope.savingData = true;
        ProfileService.setPrivacy($scope.data.privacyValue, $scope.data.showCase ? 1 : 0)
        .then(()=>{
            reloadData(true);
            $scope.savingData = false;
        })
    };

    $scope.deleteAccount = function(){
       ProfileService.deleteAccount()
           .then(function(data){
               if(data.status===200){
                   ApplicationService.pushNotification({
                       title: 'Account Deleted',
                       text : 'Your UCSC Results Center account has been deleted. If you logged in again the data will be collected again.',
                       template : 'success',
                       autoDismiss : false
                   });
                   $location.path('/login');
               }else{
                   ApplicationService.pushNotification({
                       title: 'Failed to Delete Account',
                       text : 'Unable to delete your account.',
                       template : 'error',
                       autoDismiss : false
                   });
               }

           })
    }
});