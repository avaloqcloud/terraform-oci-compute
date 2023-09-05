schemaVersion: 1.1.0
locale: "en"
variableGroups:
  - title: "OCI(Oracle Cloud Infrastructure) details"
    variables:
      - region
      - compartment_ocid
      - current_user_ocid
      - image_id
      - image_shape
      - memory
      - ocpus
      - vm_name
variables:
  region:
    type: oci:identity:region:name
    required: true
    description: "Select the OCI region for sandbox deployment"
    title: "Region"
  compartment_ocid:
    type: oci:identity:compartment:id
    required: true
    description: "Select the OCI compartment within your tenancy for sandbox deployment"
    title: "Compartment"
  current_user_ocid:
    type: string
    required: true
    description: "Enter the user OCID associated with the OCI account"
    title: "User"
  vm_name:
    type: string
    minLength: 1
    maxLength: 255
    pattern: "^[a-z][a-zA-Z0-9]+$"
    title: VM Name
    description: "VM Name"
    required: true
  image_id:
    type: oci:core:image:id
    required: true
    description: "Select the image for the VM deployment"
    title: "Image"
    dependsOn:
      compartmentId: ${compartment_ocid}
  shape_id:
    type: oci:core:instanceshape:name
    required: true
    description: "Select the shape for the VM deployment"
    title: "Shape"
    dependsOn:
      compartmentId: ${compartment_ocid}
  memory:
    type: number
    default: 4
    maximum: 100
    minimum: 1
  ocpus:
    type: number
    default: 4
    maximum: 100
    minimum: 1
title: "Compute Instance Creation"
description: "Compute Instance Creation in OCI"
