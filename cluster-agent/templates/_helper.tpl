{{- define "sensitiveData" -}}
{{ (get . "data") | trim | b64enc | required (get . "message") }}
{{- end -}}
