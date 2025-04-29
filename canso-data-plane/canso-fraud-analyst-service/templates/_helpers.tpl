{{/*
Expand the name of the chart.
*/}}
{{- define "canso-fraud-analyst-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "canso-fraud-analyst-service.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "canso-fraud-analyst-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "canso-fraud-analyst-service.labels" -}}
helm.sh/chart: {{ include "canso-fraud-analyst-service.chart" . }}
{{ include "canso-fraud-analyst-service.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "canso-fraud-analyst-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "canso-fraud-analyst-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "canso-fraud-analyst-service.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "canso-fraud-analyst-service.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
Create the image path for the passed in image field
Credits - https://blog.andyserver.com/2021/09/adding-image-digest-references-to-your-helm-charts/
*/}}
{{- define "canso-fraud-analyst-service.image" -}}
{{- $tag := .tag -}}
{{- if eq (substr 0 7 $tag) "sha256:" -}}
{{- printf "%s@%s" .repository $tag -}}
{{- else -}}
{{- printf "%s:%s" .repository $tag -}}
{{- end -}}
{{- end -}}