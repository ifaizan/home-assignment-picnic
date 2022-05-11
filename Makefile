PREFIX := runner-es
TIMEOUT := 1200s

install:
	helm upgrade --wait --timeout=$(TIMEOUT) --install --values master.yaml $(PREFIX)-master .
	helm upgrade --wait --timeout=$(TIMEOUT) --install --values data.yaml $(PREFIX)-data .

delete:
	helm del $(PREFIX)-master
	helm del $(PREFIX)-data