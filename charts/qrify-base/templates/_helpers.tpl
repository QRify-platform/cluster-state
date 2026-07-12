{{- define "qrify.ecrRegistry" -}}
{{- .Values.ecrRegistry | default "856096729725.dkr.ecr.us-east-2.amazonaws.com" -}}
{{- end }}

# base labels and labels fro values file
{{- define "qrify-base.labels" -}}
app.kubernetes.io/name: {{ .Values.name | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/environment: {{ .Values.environment | quote }}


{{- end }}


{{- define "qrify-base.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.name }}-{{ .Values.environment }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
