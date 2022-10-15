

var name_start = "赵钱孙李周吴郑王冯陈卫沈韩杨朱秦尤许何吕施张孔曹严华金魏陶姜戚谢邹喻水云苏潘葛奚\
范彭郎鲁韦昌马凤方任袁柳史唐费岑薛雷贺汤殷罗毕安常乐于时傅齐康伍余元卜顾孟平黄和穆萧\
尹姚邵湛汪毛禹狄明计成戴宋茅庞熊纪舒项祝董粱杜阮席季贾路危江童颜郭梅盛林钟徐邱骆\
高夏蔡田胡凌霍万柯卢莫房缪干解应宗丁宣邓郁单杭洪包诸左石崔吉龚程邢滑裴陆荣翁荀羊甄家封芮松井富\
巴弓牧山谷车侯伊宁祖武符刘景詹龙叶幸司韶黎乔苍闻劳逄宰桂牛寿通边燕尚农温庄茹鱼容向戈\
终居衡步耿满弘国文东沃曾关红游盖益桓公晋楚";
                
var boy = "伟刚勇毅俊峰强军平保东文辉力明永健世广志义兴良海山仁波宁贵福生龙元全国胜学祥才发武新利清飞彬富顺信子杰涛昌成康星光天达安岩中茂进林有坚和彪博诚先敬震振壮会思群豪心邦承乐绍功松善厚庆磊民友裕河哲江超浩亮政谦亨奇固之轮翰朗宏言若鸣朋斌梁栋维启克伦翔旭鹏泽晨辰士以建家致树炎德行时泰盛雄琛钧冠策腾楠榕风航弘";
    
var middle_name = "中凯歌易仁器义礼智信友上都卡被无加电金钰玉忠孝";
    
function getRandName(){
    let fst = name_start.substr(Math.floor(Math.random()*name_start.length),1);
    let mid = "";
    if(Math.random()>0.2) mid = middle_name.substr(Math.floor(Math.random()*middle_name.length),1);
    let end = boy.substr(Math.floor(Math.random()*boy.length),1);
    let fullname = fst + mid + end;
    return fullname;
}

function getFullName(){
    let fullname = getQueryString("name")
    if(fullname==null) fullname = getRandName();
    return fullname;
}

function getImgName(){
    let img_name = getQueryString("img_name");
    if(img_name==null) img_name = Math.floor(Math.random()*11).toString().padStart(2,'0') + ".jpg";
    return img_name;
}

function getPageSize(){
    let size = getQueryString("size");
    if(size==null) size = 1;
    return size;
} 

//获取url参数 
function getQueryString(name){
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)return  decodeURI(r[2]); return null;
}

function go_back(){
    window.history.go(-1);
}


    

    

    




