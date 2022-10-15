/**
 * 
 */

let scene, camera, renderer, spotLight, composer;

const init = () => {
	//Scene
	scene = new THREE.Scene();
	scene.background = new THREE.Color(0x000000);
	
	//renderer
	renderer = new THREE.WebGLRenderer({ antialias: true});
	renderer.setSize(window.innerWidth, window.innerHeight);
	//色调映射
	renderer.toneMapping = THREE.ReinhardToneMapping;
	renderer.toneMappingExposure = 3;//曝光
	//启动阴影映射
	renderer.shadowMap.enabled = true;
	document.body.appendChild(renderer.domElement);
	
	//Camera
	const aspect = window.innerWidth / window.innerHeight;
	camera = new THREE.PerspectiveCamera(60, aspect, 0.01, 1000);
	camera.rotation.y = (90 / 100) * Math.PI;
	camera.position.set(7, 0, -40);
	
	//Camera controls
	const controls = new THREE.OrbitControls(camera, renderer.domElement);
	controls.addEventListener("change", renderer);
	
	//light
	//ambientLight = new THREE.AmbientLight(0x404040, 9);//(color, lightness)
	//scene.add(ambientLight);
	const hemiLight = new THREE.HemisphereLight(0xffeeb1, 0x080820, 2);//(upperColor, belowColor, lightness)
	scene.add(hemiLight);
	
	spotLight = new THREE.SpotLight(0xffa95c, 2);
	spotLight.castShadow = true;
	//提高阴影质量
	spotLight.shadow.bias = -0.0001;
	spotLight.shadow.mapSize.width = 10000;
	spotLight.shadow.mapSize.height = 10000;
	scene.add(spotLight);
	
	//post processing
	composer = new POSTPROCESSING.EffectComposer(renderer);
	composer.addPass(new POSTPROCESSING.RenderPass(scene, camera));
	
	const effectPass = new POSTPROCESSING.EffectPass(
		camera, 
		new POSTPROCESSING.BloomEffect({
			intensity: 3,
			luminanceTreshold: 0.8,
			width: 100,
			height: 100,
			
		})
	);
	composer.addPass(effectPass);
	
	//loader
	const loader = new THREE.GLTFLoader();
	loader.load("scene.gltf", (result) => {
		const model = result.scene.children[0];
		model.traverse((n) => {
			if(n.isMesh){
			n.castShadow = true;
			n.receiveShadow = true;
			//提高纹理映射的各向异性，从而提高纹理过滤质量
			//if(n.material.map) n.material.map.anisotropy = 100;
			}
		});
		scene.add(model);
		animate();
	});
}

// Recursive loop for Render Scene
const animate = () =>{
	requestAnimationFrame(animate);
	spotLight.position.set(
		camera.position.x + 5,
		camera.position.y + 5,
		camera.position.z - 5
	);
	//renderer.render(scene, camera);
	//改用composer渲染
	composer.render();
}
init();