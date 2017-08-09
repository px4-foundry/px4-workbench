PX4 ROS Workbench is a stack build and deploy system for working with PX4, Mavlink and ROS

The system consists of:

1. Vagrant file to create a provisioning agent
2. Chef Cookbooks and associated configuration management JSON
  - Cookbook for creating the provisioning agent, runs as chef-zero with system arch. stored as various chef-assets represented in JSON
  - Cookbooks that implement automated delivery of the following roles (in order of priority):
      - LRS Telemetry (Sik/Mavlink/FrSky) to Wifi Bridge
      - Security Certificate MGMT, delivery and rotation services
      - Data transport appliance (messaging services)
      - Habitat encapsulated CF-Bosh system supporting provisioning, MGMT and service delivery
      - System analysis, performance and reliability
      - Scripted, unit testable via HITL Sim and Full Virtual simulation
      - Data storage, aggregation, MGMT and security (agnostic cloud and metal cloud)
      - Embedded system MGMT and delivery via ProcessIO and AVR Dude on a dedicated Pi per device.
      - Provide persistent, relational, transactional SQL services for system configuration and performance data
3. Mock Ohai models of targeted platforms for TDD and Automate integration
  - Tool to push ohai onto targeted platforms and collect information to be used in testing using Fauxhai
      Instances in cloud provisoned by Bosh (I'm assuming for the moment AWS, GCE, Azure and OpenStack)
      Light Metal:
        Pi-3 running as an SiK to TCP/IP Bridge
        Pi-3 running as a thin-edge device
        Pi-Zero running as the keymaker

      Heavy Metal:
        64-Bit Machine running Chef-Server and NodeJs/Postgres Config-MGMT and DSS API
        64-Bit Lightweight developer machines
        DSS Dash boarding HTTP Services
        Edge Device Targets
        Abstracted MicroCloud on OpenStack
