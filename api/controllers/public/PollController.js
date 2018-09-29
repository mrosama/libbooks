BookApp.controller('PollController', ['$rootScope', '$scope', 'BookCache', 'api',
function($rootScope, $b, api, api) {
	var url = "api/server/data/public/poll.php";

	$rootScope.$watch('poll()', function() {
		//console.info('poll run');
		var param = {
			show_FORM : 'show_FORM'
		};
		api.Query(url, param, function(response) {
			if (response.length != 0) {

				//console.info(response);
				if (response.show == "form") {
					$rootScope.pollform = true;
					$rootScope.pollresult = false;
				}

				if (response.show == "result") {
					$rootScope.pollresult = true;
					$rootScope.pollform = false;
				}

				$rootScope.pollquestion = response.question;
				$rootScope.pollquestion_ID = response.question_id;
				$rootScope.pollanswer = response.answer;
                $rootScope.percents = response.percent;
			}

		});

	});

	////////////////////////////

	$rootScope.addpoll = function(MyVal) {
		angular.forEach(MyVal, function(todo, i) {
			if (todo.isSelected == true) {
				//console.info(i + " " + MyVal[i].isSelected);
				//console.info("Value Chooise:" + MyVal[i].ID);

				//send data

				var datasend = {
					PollPost : 'upt',
					QuestionID : $rootScope.pollquestion_ID,
					AnswerID : MyVal[i].ID
				}

				var param = datasend;
				api.Submit(url, param, function(response) {
					//console.info(response);
					//$b.poll();
					$rootScope.pollresult = true;
					$rootScope.pollform = false;
				 
				    	$rootScope.pollquestion = response.question;
			         	$rootScope.pollquestion_ID = response.question_id;
			        	$rootScope.pollanswer = response.answer;
                        $rootScope.percents = response.percent;
                
                
				});

				MyVal[i].isSelected = false;

			}
		});

	}
	//////////////////
}]); 