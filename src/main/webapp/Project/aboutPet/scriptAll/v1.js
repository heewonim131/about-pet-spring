
//우선 live off 실행
var SgrLiveApiUrl = "https://sgr.aboutpet.co.kr";
var l24_site_key = '7144413e544bb0e5f2b58a385f338ca9';


//잘못된 스크립트 설치로 인한 보정
SgrLiveApiUrl = {
    'stg.aboutpet.co.kr': 'https://stgsgrlive.aboutpet.co.kr',
    'aboutpet.co.kr': 'https://sgrlive.aboutpet.co.kr',
    'www.aboutpet.co.kr': 'https://sgrlive.aboutpet.co.kr',
}[location.host] || 'https://devsgrlive.aboutpet.co.kr';

var sgrLiveState = false;

var SgrApp = {
    init:function(){
        this.chkLiveStates();

    },
    chkLiveStates:function(){
        $.ajax({
            type: 'POST',
            url: SgrLiveApiUrl+'/v1/live/state',
            data:{
                l24_site_key:l24_site_key
            },
            dataType: 'json',
            success: function(res, status) {
                if(res.code==500){
                    try {
                        endLive();
                        sgrLiveState = false;
                    }catch(e){}
                }
                if(res.code==200){

                    try {
                        startLive();
                        sgrLiveState = true;
                    }catch(e){}
                }
            },
            error: function(request,status,error) {
                console.log(request.responseText);
            }
        });
    },

}



try{
    SgrApp.init();
}catch(e){

}
