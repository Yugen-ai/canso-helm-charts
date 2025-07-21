{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "canso-fraud-inv-jobs.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "canso-fraud-inv-jobs.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "canso-fraud-inv-jobs.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "canso-fraud-inv-jobs.labels" -}}
helm.sh/chart: {{ include "canso-fraud-inv-jobs.chart" . }}
{{ include "canso-fraud-inv-jobs.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "canso-fraud-inv-jobs.selectorLabels" -}}
app.kubernetes.io/name: {{ include "canso-fraud-inv-jobs.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
canso.ai/canso-fraud-inv-jobs-name: {{ .Values.name }}
{{- end }}

{{/*
Return the proper image name
*/}}
{{- define "canso-fraud-inv-jobs.image" -}}
{{- $registryName := .Values.deployment.image.registry -}}
{{- $repositoryName := .Values.deployment.image.repository -}}
{{- $tag := .Values.deployment.image.tag | toString -}}
{{- if $registryName }}
    {{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- else -}}
    {{- printf "%s:%s" $repositoryName $tag -}}
{{- end }}
{{- end }}