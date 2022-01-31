{{- define "sensitiveData" -}}
{{ (get . "data") | trim | b64enc | required (get . "message") }}
{{- end -}}

{{- define "podConfigs" }}
  image: {{ .image }}
  imagePullPolicy: {{ .imagePullPolicy }}
  resources:
  {{- toYaml .resources | nindent 4 }}
  labels:
  {{- toYaml .labels | nindent 4 }}
  annotations:
  {{- toYaml .annotations | nindent 4 }}
  nodeSelector:
  {{- toYaml .nodeSelector | nindent 4 }}
  imagePullSecrets:
  {{- toYaml .imagePullSecrets | nindent 4 }}
  affinity:
  {{- toYaml .affinity | nindent 4 }}
  tolerations:
  {{- toYaml .tolerations | nindent 4 }}
  securityContext:
  {{- toYaml .securityContext | nindent 4 }}
{{- end }}
