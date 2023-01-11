{{- define "demo-helm.deploy-front" }}
metadata:
  name: front-deploy
spec:
  selector:
    matchLabels:
      app: front-deploy
  replicas: 1
{{- end }}


{{- define "demo-helm.deploy-mid" }}
metadata:
  name: mid-deploy
spec:
  selector:
    matchLabels:
      app: mid-deploy
  replicas: 1
{{- end }}


{{- define "demo-helm.deploy-back-v1" }}
metadata:
  name: back-deploy-v1
spec:
  selector:
    matchLabels:
      app: back-deploy
  replicas: 1
{{- end }}


{{- define "demo-helm.deploy-back-v2" }}
metadata:
  name: back-deploy-v2
spec:
  selector:
    matchLabels:
      app: back-deploy
  replicas: 1
{{- end }}


{{- define "demo-helm.annotations" }}
annotations:
  sidecar.istio.io/inject: "true"
{{- end }}
