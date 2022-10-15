<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*" import="java.util.Date" import="java.text.SimpleDateFormat" import="java.util.List" import="java.util.Arrays" import="java.util.Collections" import="java.util.Comparator"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Clipboard-master</title>
<meta name="viewport" content="width=device-width">
<link rel="shortcut icon" href="../favicon.ico" />
<link rel="stylesheet" href="../styles/index.css?version=<?php echo date('YmdHi'); ?>" 
		media="screen" type="text/css"/>
<style>
    .copy{
        margin: auto;
        position: absolute;
        right: 10px;
        width: 43px;
        border-radius: 6px;
        background-color: #b3eabe;
        border: none;
        padding: 2px;
        cursor: pointer;
    }
</style>
</head>

<body>
	<div class="context">
		<div class="toptab" onclick="mainpage()">
			<img src="../favicon.ico" class="icon"/>
			<span class="mytitle">Hollway</span>
		</div>
		<br/>
		
		<div class="writing-page">
			<form method="post" class="pasteform" id="pasteform">
				<textarea name="paste-content" class="writing-space" id="paste"> </textarea>
				<input type="submit" value="Upload" class="submit" οnclick="this.disabled=true;this.form.submit();alert('h');"/>
			</form>
		</div>
	
        
        <div id="contentBox" class="list-container">
<%// java 代码，在后端自动编译
    class FileManager{
			String[] files;
			String basePath = "";
			String ip = "default";
			String output = "";
			FileManager() throws java.io.IOException{
				basePath = request.getSession().getServletContext().getRealPath("/")+"/res/text/"; 
				// put records in that directory
				File path = new File(basePath);
				if(!path.exists()) path.mkdirs();
				files = new File(basePath).list();
				/*File[] files = path.listFiles();
				List fileList = Arrays.asList(files);
				Collections.sort(fileList, new Comparator<File>() {// 按文件名重排序
                    @Override
                    public int compare(File o1, File o2) {
                        if (o1.isDirectory() && o2.isFile())
                            return -1;
                        if (o1.isFile() && o2.isDirectory())
                            return 1;
                        return o1.getName().compareTo(o2.getName());
                    }
                });*/
			}
			
			// normally the filename param is the remote ip
			void writeFile(String filename, String content) { 
				if(content.length() > 1024*10){ // write file
			        output += "<script>alert('内容过长，建议分段使用')</script>";// 防止内容过长
			    }else{
			        File fileDir = new File(basePath);
			        if(!fileDir.exists()) fileDir.mkdirs();              // 确保目录正常使用
			        File file = new File(filename);
			        try{
			            FileOutputStream fos = null;
			            if(!file.exists()){
                            file.createNewFile(); // 如果文件不存在，就创建该文件
                            fos = new FileOutputStream(file); // 首次写入获取
                        }else{
                            fos = new FileOutputStream(file,true); // 二次追加写入
                        }
			            OutputStreamWriter osw = new OutputStreamWriter(fos, "UTF-8");
			            // 构造写入内容
			            content += "&nbsp;";         // 借用空格符号分隔存储内容和日期,这样读取的时候可以用split by '&nbsp;'
		                content += new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());// append time
		                content += "&nbsp;["+request.getRemoteAddr()+"]";//append ip
			            content += "&#10;\n";
			            // I use &nbsp; to seperate signle comments
			            osw.write(content);
			            osw.flush();
			            osw.close();
			        }catch(IOException e){
			            content += e.toString();
			        }
			    }
			}
			
			// just like the above, here pass the filename with its path
			String readFile(String filename) {
				File file = new File(filename);
		        if(file.exists()){
		            StringBuffer buf = new StringBuffer();
		            try{
		            	// the input stream of bytes
		            	BufferedReader br = new BufferedReader(
		            	                        new InputStreamReader(
		            	                            new FileInputStream(filename), "UTF-8"));
		                // the buffered reading way of the input stream
		                String line = null;
		                // read by line
		                while((line=br.readLine()) != null){
		                    buf.append(line+"\r\n");
		                    // '\n' really should be appended because when we read by line
		                    // we ignore the notation of changing line
		                }
		                br.close();
		                return buf.toString();
		            }catch(Exception e){
		               return e.toString();
		            }// end of try-catch
		        }else return "";// file not exist
			}
			
			
			String run() {
			    output += "<span>评论区请注意发言哦</span>";
			    
			    // String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date()); 使用多文件存储，一天一个文件
			    String date="default";// 转为使用单一文件存储
			    try{                                                        // 将post提交的内容写入文件
    			    request.setCharacterEncoding("utf-8");
    				String content = request.getParameter("paste-content"); // the param is sent by post
    				if(content != null && !content.equals(" ")){  // if the url param is not null, we fill in the content of that ip 
    			    	writeFile(basePath+date+".txt", content); // 调用自定义方法，控制权转移至writeFile
    			    }
    			}catch(Exception e){output+="<span>"+e.toString()+"</span>";}
    			
				for(int i=0; i<files.length; i++) { // read all the content 
				    if(!files[i].equals("default.txt")) continue; // 使用单一文件存储
					String passage = readFile(basePath+files[i]);
					if(passage != "") {
					    String[] contents = passage.split("&#10;");
					    for(int j=0; j<contents.length; j++){
					        if(contents[j].contains("&nbsp;")){
					            String[] parts = contents[j].split("&nbsp;");
					            if(parts.length<2) break;
					            if(parts[0].equals(" ")) continue;
					            
					            // 防js注入攻击
					            parts[0] = parts[0].replace("<", "&lt;").replace(">", "&gt;").replace("(", "&#40;");
					            
					            output += "<div><div>"+parts[0].trim()
					                        +"</div><span>"+parts[1]
					                        +"</span><button class='copy'>copy</button></div>";
					        }
					    }
					}
				}
				return output;
			}// end of method run()
		}// end of class FileManager{}
		FileManager mng = new FileManager();
		String output = mng.run();
%><%=output %>
        </div>
    </div>
	<script type="text/javascript">
	function mainpage(){
        window.location.href="../main-pages/index.html";
    }
    
    function attachClipboard(btn, target){
        btn.addEventListener("click", function(){
            //var ps = $("#content").find("p");
            var content = target.innerHTML;
            /*for (var i = 0; i < ps.length; i++) {
                content += $(ps[i]).text() + "\n";
            }*/
            const textarea = document.createElement('textarea');
            textarea.value = content;
            document.body.appendChild(textarea);
            textarea.select();
            if (document.execCommand('copy')) {
                document.execCommand('copy');
            }
            document.body.removeChild(textarea);
            console.log("复制成功: "+content);
        });
    }
    
    onload=function(){
        if(window.history.replaceState){
            window.history.replaceState(null, null, window.location.href);
            // 替换历史记录，防止刷新页面重新提交原表单
        }
        
        let boxes = document.querySelectorAll('#contentBox > div');
        for(let i=0; i<boxes.length; i++){
            let btn = boxes[i].querySelector('.copy');
            let target = boxes[i].querySelector('div');
            attachClipboard(btn, target);
        }
    }
    
    
	</script>
</body>
</html>