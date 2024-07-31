<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수어 다국어 번역기</title>

<link rel="stylesheet" type="text/css" href="css/styles.css">

<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@latest/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@latest/dist/teachablemachine-image.min.js"></script>

<script type="text/javascript">
	const URL = "/model/";
	let model, webcam, labelContainer, maxPredictions;
	let isRunning = false;

	async function toggleWebcam() {
		if (isRunning) {
			stop();
		} else {
			await
			init();
		}
	}

	async function init() {
		if (isRunning)
			return;

		const modelURL = URL + "model2.json";
		const metadataURL = URL + "metadata2.json";

		model = await
		tmImage.load(modelURL, metadataURL);
		maxPredictions = model.getTotalClasses();

		const flip = true;
		webcam = new tmImage.Webcam(500, 500, flip);
		await
		webcam.setup();
		await
		webcam.play();
		window.requestAnimationFrame(loop);

		// Clear any previous canvas if exists
		const existingCanvas = document
				.querySelector("#webcam-container canvas");
		if (existingCanvas) {
			existingCanvas.remove();
		}

		// Append new canvas
		document.getElementById("webcam-container").appendChild(webcam.canvas);

		labelContainer = document.getElementById("label-container");
		labelContainer.innerHTML = "";
		for (let i = 0; i < maxPredictions; i++) {
			labelContainer.appendChild(document.createElement("div"));
		}
		isRunning = true;
		document.getElementById("toggleButton").innerText = "OFF";
	}

	async function loop() {
		if (isRunning) {
			webcam.update();
			await
			predict();
			window.requestAnimationFrame(loop);
		}
	}

	async function predict() {
		const prediction = await
		model.predict(webcam.canvas);
		labelContainer.innerHTML = "";
		for (let i = 0; i < maxPredictions; i++) {
			const probability = prediction[i].probability.toFixed(2);
			if (probability >= 0.80 && prediction[i].className !== "NONE") {
				const classPrediction = prediction[i].className;
				const predictionElement = document.createElement("div");
				predictionElement.classList.add("caption");
				predictionElement.innerHTML = classPrediction;
				labelContainer.appendChild(predictionElement);
			}
		}
	}

	function stop() {
		if (webcam && isRunning) {
			isRunning = false;
			webcam.stop();
			// Clear the canvas to black
			const context = webcam.canvas.getContext('2d');
			context.fillStyle = 'black';
			context.fillRect(0, 0, webcam.canvas.width, webcam.canvas.height);
			document.getElementById("toggleButton").innerText = "ON";
		}
	}
</script>

</head>
<body>
<div class="container2">
	<button id="toggleButton" type="button" onclick="toggleWebcam()">ON</button>
	<div id="webcam-container"></div>
	<div id="label-container"></div>
</div>
</body>
</html>
