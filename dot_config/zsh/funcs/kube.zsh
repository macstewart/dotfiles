function k_images() {
    kubectl describe deployments \
        | grep Image.\*maas \
        | sed 's/.*Image:.*\///' \
        | sed 's/:/ - /' 
}
alias ,kimgs=k_images
