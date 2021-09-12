#! /usr/bin/env bash

git::clone::version() {
    local repo="$1"
    local vers="$2"

    git init .
    git remote add origin "${repo}"
    git fetch origin --depth=1 "${vers}"
    git reset --hard FETCH_HEAD
}

proto::import() {
    local name="$1"; shift
    local repo="$1"; shift
    local vers="$1"; shift

    (
        readonly WORKROOT="$(mktemp -d)"
        mkdir -p "${WORKROOT}/${name}"
        cd "${WORKROOT}/${name}"
        git::clone::version "${repo}" "${vers}"
        rsync \
            --archive \
            --prune-empty-dirs \
            --include="*/" \
            --include="*.proto" \
            --exclude="*" \
            "$@" "${SRCROOT}/proto/"
        if [ -r LICENSE ] ; then
            cp LICENSE "${SRCROOT}/proto/LICENSE.${name}"
        fi
    )

}
