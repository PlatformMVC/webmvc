<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Three.js チュートリアル１</title>
<script src="resource/js/three.min.js"></script>
<style type="text/css">
div#canvas-frame {
    border: none;
    cursor: pointer;
    width: 600px;
    height: 600px;
    background-color: #EEEEEE;
}
</style>
<script>
    var renderer;
    function initThree() {
        width = document.getElementById('canvas-frame').clientWidth;
        height = document.getElementById('canvas-frame').clientHeight;
        renderer = new THREE.WebGLRenderer({
            antialias : true
        });
        renderer.setSize(width, height);
        document.getElementById('canvas-frame')
                .appendChild(renderer.domElement);
        renderer.setClearColorHex(0xFFFFFF, 1.0);
    }

    var camera;
    function initCamera() {
        camera = new THREE.PerspectiveCamera(45, width / height, 1, 10000);
        camera.position.x = 100;
        camera.position.y = 20;
        camera.position.z = 50;
        camera.up.x = 0;
        camera.up.y = 0;
        camera.up.z = 1;
        camera.lookAt({
            x : 0,
            y : 0,
            z : 0
        });
    }
    var scene;
    function initScene() {
        scene = new THREE.Scene();
    }
    var light;
    function initLight() {
        light = new THREE.DirectionalLight(0xFF0000, 1.0, 0);
        light.position.set(100, 100, 200);
        scene.add(light);
    }
    var cube;
    function initObject() {
        cube = new THREE.Mesh(new THREE.CubeGeometry(50, 50, 50), //形状の設定
        new THREE.MeshLambertMaterial({
            color : 0xff0000
        }) //材質の設定
        );
        scene.add(cube);
        cube.position.set(0, 0, 0);
    }
    function threeStart() {
        initThree();
        initCamera();
        initScene();
        initLight();
        initObject();
        renderer.clear();
        renderer.render(scene, camera);
    }
</script>
</head>

<body onload="threeStart();">
    <div id="canvas-frame"></div>
</body>
</html>