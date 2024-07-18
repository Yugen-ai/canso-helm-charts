{{/*
Expand the name of the chart.
*/}}
{{- define "canso-agent.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "canso-agent.fullname" -}}
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
Create a default fully qualified celery app name
*/}}
{{- define "canso-agent-celery.fullname" -}}
{{- include "canso-agent.fullname" . | trunc 56 | trimSuffix "-" }}-celery
{{- end }}

{{/*
Create a default fully qualified redis app name
*/}}
{{- define "canso-agent-redis.fullname" -}}
{{- include "canso-agent.fullname" . | trunc 57 | trimSuffix "-" }}-redis
{{- end }}


{{/*
Create the name of the service account to use for canso-agent
*/}}
{{- define "canso-agent.serviceAccountName" -}}
{{- if .Values.cansoAgent.serviceAccount.create }}
{{- default (include "canso-agent.fullname" .) .Values.cansoAgent.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.cansoAgent.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "canso-agent.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels for canso-agent
*/}}
{{- define "canso-agent.selectorLabels" -}}
app.kubernetes.io/name: {{ include "canso-agent.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "canso-agent.labels" -}}
helm.sh/chart: {{ include "canso-agent.chart" . }}
{{ include "canso-agent.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Create the image path for the passed in image field
Credits - https://blog.andyserver.com/2021/09/adding-image-digest-references-to-your-helm-charts/
*/}}
{{- define "canso-agent.image" -}}
{{- $tag := .tag -}}
{{- if eq (substr 0 7 $tag) "sha256:" -}}
{{- printf "%s@%s" .repository $tag -}}
{{- else -}}
{{- printf "%s:%s" .repository $tag -}}
{{- end -}}
{{- end -}}