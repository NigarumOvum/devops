helm repo add secrets-store-csi-driver https://raw.githubusercontent.com/kubernetes-sigs/secrets-store-csi-driver/master/charts
helm -n kube-system install csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver
