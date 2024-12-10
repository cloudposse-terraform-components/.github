[![Banner](https://github.com/cloudposse/.github/blob/main/profile/banner/image.png?raw=true)](https://cpco.io/homepage)
<p align="right">
  <a href="https://cloudposse.com/slack" title="Slack Community"><img src="https://slack.cloudposse.com/for-the-badge.svg" alt="Slack Community"></a>
  <a href="https://cloudposse.com/office-hours/" title="Office Hours"><img src="https://img.shields.io/badge/Office_Hours-2891E8.svg?style=for-the-badge" alt="Office Hours"></a>
  <a href="https://cloudposse.com/quiz/" title="Request Quote"><img src="https://img.shields.io/badge/Request_Quote-success.svg?style=for-the-badge" alt="Request Quote"></a>
</p>

This is organization hosts a registry of [Terraform components](https://atmos.tools/core-concepts/components/) for provisioning infrastructure used by the Cloud Posse [reference architectures](https://docs.cloudposse.com). They work really well with [Atmos](https://atmos.tools), our open-source tool for managing infrastructure as code with Terraform.

> [!TIP]
> #### 👽 Use Atmos with Terraform
> Cloud Posse uses [`atmos`](https://atmos.tools) to easily orchestrate multiple environments using Terraform. <br/>
> Works with [Github Actions](https://atmos.tools/integrations/github-actions/), [Atlantis](https://atmos.tools/integrations/atlantis), or [Spacelift](https://atmos.tools/integrations/spacelift).
>
> <details>
> <summary><strong>Watch demo of using Atmos with Terraform</strong></summary>
> <img src="https://github.com/cloudposse/atmos/blob/master/docs/demo.gif?raw=true"/><br/>
> <i>Example of running <a href="https://atmos.tools"><code>atmos</code></a> to manage infrastructure from our <a href="https://atmos.tools/quick-start/">Quick Start</a> tutorial.</i>
> </detalis>

## Introduction

In this repo you'll find real-world examples of how we've implemented Terraform "root" modules as native
[Atmos Components](https://atmos.tools/core-concepts/components/) for our customers. These Components
leverage our hundreds of free and open-source [terraform "child" modules](https://cpco.io/terraform-modules).

The [component library](https://docs.cloudposse.com/components/) captures the business logic, opinions, best practices and
non-functional requirements for an organization.

It's from this library that other developers in your organization will pick and choose from whenever they need to deploy some new
capability.

These components make a lot of assumptions (aka ["convention over configuration"](https://en.wikipedia.org/wiki/Convention_over_configuration)) about how we've configured our environments.
That said, they still serve as an excellent reference for others on how to build, organize and distribute enterprise-grade infrastructure with Terraform that can be used with [Atmos](https://atmos.tools).

## Usage

Please take a look at each [component's README](https://docs.cloudposse.com/components/) for specific usage.

> [!TIP]
> ## 👽 Use Atmos with Terraform
> To orchestrate multiple environments with ease using Terraform, Cloud Posse recommends using [Atmos](https://atmos.tools),
> our open-source tool for Terraform automation.
>
> <details>
> <summary><strong>Watch demo of using Atmos with Terraform</strong></summary>
> <img src="https://github.com/cloudposse/atmos/blob/master/docs/demo.gif?raw=true"/><br/>
> <strong>Example of running <a href="https://atmos.tools"><code>atmos</code></a> to manage infrastructure from our <a href="https://atmos.tools/quick-start/">Quick Start</a> tutorial.</strong>
> </detalis>

Generally, you can use these components in [Atmos](https://atmos.tools/core-concepts/components/) by adding something like the following
code into your [stack manifest](https://atmos.tools/core-concepts/stacks/):

```yaml
components:                      # List of components to include in the stack
  terraform:                     # The toolchain being used for configuration
    vpc:                         # The name of the component (e.g. terraform "root" module)
      vars:                      # Terraform variables (e.g. `.tfvars`)
        cidr_block: 10.0.0.0/16  # A variable input passed to terraform via `.tfvars`
```

## Automated Updates of Components using GitHub Actions

Leverage our [GitHub Action](https://atmos.tools/integrations/github-actions/component-updater) to automate the creation and management of pull requests for component updates.

This is done by creating a new file (e.g. `atmos-component-updater.yml`) in the `.github/workflows` directory of your repository.

The file should contain the following:

```yaml
jobs:
update:
  runs-on:
    - "ubuntu-latest"
  steps:
    - name: Checkout Repository
      uses: actions/checkout@v4
      with:
        fetch-depth: 1

    - name: Update Atmos Components
      uses: cloudposse/github-action-atmos-component-updater@v2
      env:
        # https://atmos.tools/cli/configuration/#environment-variables
        ATMOS_CLI_CONFIG_PATH: ${{ github.workspace }}/rootfs/usr/local/etc/atmos/
      with:
        github-access-token: ${{ secrets.GITHUB_TOKEN }}
        log-level: INFO
        max-number-of-prs: 10

    - name: Delete abandoned update branches
      uses: phpdocker-io/github-actions-delete-abandoned-branches@v2
      with:
        github_token: ${{ github.token }}
        last_commit_age_days: 0
        allowed_prefixes: "component-update/"
        dry_run: no
```

For the full documentation on how to use the Component Updater GitHub Action, please see the [Atmos Integrations](https://atmos.tools/integrations/github-actions/component-updater) documentation.


## Related Projects

Check out these related projects.

- [Cloud Posse Terraform Modules](https://docs.cloudposse.com/modules/) - Our collection of reusable Terraform modules used by our [reference architectures](https://docs.cloudposse.com).
- [Atmos](https://atmos.tools) - Atmos is like docker-compose but for your infrastructure


## References

For additional context, refer to some of these links.

- [Cloud Posse Documentation](https://docs.cloudposse.com) - Complete documentation for the Cloud Posse solution
- [Reference Architectures](https://cloudposse.com/) - Launch effortlessly with our turnkey reference architectures, built either by your team or ours.

> [!TIP]
> #### Use Terraform Reference Architectures for AWS
>
> Use Cloud Posse's ready-to-go [terraform architecture blueprints](https://cloudposse.com/reference-architecture/) for AWS to get up and running quickly.
>
> ✅ We build it together with your team.<br/>
> ✅ Your team owns everything.<br/>
> ✅ 100% Open Source and backed by fanatical support.<br/>
>
> <a href="https://cpco.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-components&utm_content=commercial_support"><img alt="Request Quote" src="https://img.shields.io/badge/request%20quote-success.svg?style=for-the-badge"/></a>
> <details><summary>📚 <strong>Learn More</strong></summary>
>
> <br/>
>
> Cloud Posse is the leading [**DevOps Accelerator**](https://cpco.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-components&utm_content=commercial_support) for funded startups and enterprises.
>
> *Your team can operate like a pro today.*
>
> Ensure that your team succeeds by using Cloud Posse's proven process and turnkey blueprints. Plus, we stick around until you succeed.
> #### Day-0:  Your Foundation for Success
> - **Reference Architecture.** You'll get everything you need from the ground up built using 100% infrastructure as code.
> - **Deployment Strategy.** Adopt a proven deployment strategy with GitHub Actions, enabling automated, repeatable, and reliable software releases.
> - **Site Reliability Engineering.** Gain total visibility into your applications and services with Datadog, ensuring high availability and performance.
> - **Security Baseline.** Establish a secure environment from the start, with built-in governance, accountability, and comprehensive audit logs, safeguarding your operations.
> - **GitOps.** Empower your team to manage infrastructure changes confidently and efficiently through Pull Requests, leveraging the full power of GitHub Actions.
>
> <a href="https://cpco.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-components&utm_content=commercial_support"><img alt="Request Quote" src="https://img.shields.io/badge/request%20quote-success.svg?style=for-the-badge"/></a>
>
> #### Day-2: Your Operational Mastery
> - **Training.** Equip your team with the knowledge and skills to confidently manage the infrastructure, ensuring long-term success and self-sufficiency.
> - **Support.** Benefit from a seamless communication over Slack with our experts, ensuring you have the support you need, whenever you need it.
> - **Troubleshooting.** Access expert assistance to quickly resolve any operational challenges, minimizing downtime and maintaining business continuity.
> - **Code Reviews.** Enhance your team’s code quality with our expert feedback, fostering continuous improvement and collaboration.
> - **Bug Fixes.** Rely on our team to troubleshoot and resolve any issues, ensuring your systems run smoothly.
> - **Migration Assistance.** Accelerate your migration process with our dedicated support, minimizing disruption and speeding up time-to-value.
> - **Customer Workshops.** Engage with our team in weekly workshops, gaining insights and strategies to continuously improve and innovate.
>
> <a href="https://cpco.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-components&utm_content=commercial_support"><img alt="Request Quote" src="https://img.shields.io/badge/request%20quote-success.svg?style=for-the-badge"/></a>
> </details>

## ✨ Contributing

This project is under active development, and we encourage contributions from our community.


## References

For additional context, refer to some of these links.

- [Cloud Posse Documentation](https://docs.cloudposse.com) - Complete documentation for the Cloud Posse solution
- [Reference Architectures](https://cloudposse.com/) - Launch effortlessly with our turnkey reference architectures, built either by your team or ours.


## ✨ Contributing

This project is under active development, and we encourage contributions from our community.
Many thanks to our outstanding contributors:

<a href="https://github.com/cloudposse-terraform-components/.github/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=cloudposse-terraform-components/.github&max=24" />
</a>

### 🐛 Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/cloudposse-terraform-components/.github/issues) to report any bugs or file feature requests.

### 💻 Developing

If you are interested in being a contributor and want to get involved in developing this project or help out with Cloud Posse's other projects, we would love to hear from you!
Hit us up in [Slack](https://cpco.io/slack?utm_source=github&utm_medium=readme&utm_campaign=cloudposse-terraform-components/.github&utm_content=slack), in the `#cloudposse` channel.

### 🌎 Slack Community

Join our [Open Source Community](https://cpco.io/slack?utm_source=github&utm_medium=readme&utm_campaign=cloudposse-terraform-components/.github&utm_content=slack) on Slack. It's **FREE** for everyone! Our "SweetOps" community is where you get to talk with others who share a similar vision for how to rollout and manage infrastructure. This is the best place to talk shop, ask questions, solicit feedback, and work together as a community to build totally *sweet* infrastructure.

### 📰 Newsletter

Sign up for [our newsletter](https://cpco.io/newsletter?utm_source=github&utm_medium=readme&utm_campaign=cloudposse-terraform-components/.github&utm_content=newsletter) and join 3,000+ DevOps engineers, CTOs, and founders who get insider access to the latest DevOps trends, so you can always stay in the know.
Dropped straight into your Inbox every week — and usually a 5-minute read.

### 📆 Office Hours <a href="https://cloudposse.com/office-hours?utm_source=github&utm_medium=readme&utm_campaign=cloudposse-terraform-components/.github&utm_content=office_hours"><img src="https://img.cloudposse.com/fit-in/200x200/https://cloudposse.com/wp-content/uploads/2019/08/Powered-by-Zoom.png" align="right" /></a>

[Join us every Wednesday via Zoom](https://cloudposse.com/office-hours?utm_source=github&utm_medium=readme&utm_campaign=cloudposse-terraform-components/.github&utm_content=office_hours) for your weekly dose of insider DevOps trends, AWS news and Terraform insights, all sourced from our SweetOps community, plus a _live Q&A_ that you can’t find anywhere else.
It's **FREE** for everyone!

## About

This project is maintained by <a href="https://cpco.io/homepage?utm_source=github&utm_medium=readme&utm_campaign=cloudposse-terraform-components/.github&utm_content=">Cloud Posse, LLC</a>.
<a href="https://cpco.io/homepage?utm_source=github&utm_medium=readme&utm_campaign=cloudposse-terraform-components/.github&utm_content="><img src="https://cloudposse.com/logo-300x69.svg" align="right" /></a>

We are a [**DevOps Accelerator**](https://cpco.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudposse-terraform-components/.github&utm_content=commercial_support) for funded startups and enterprises.
Use our ready-to-go terraform architecture blueprints for AWS to get up and running quickly.
We build it with you. You own everything. Your team wins. Plus, we stick around until you succeed.

<a href="https://cpco.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudposse-terraform-components/.github&utm_content=commercial_support"><img alt="Learn More" src="https://img.shields.io/badge/learn%20more-success.svg?style=for-the-badge"/></a>

*Your team can operate like a pro today.*

Ensure that your team succeeds by using our proven process and turnkey blueprints. Plus, we stick around until you succeed.

<details>
  <summary>📚 <strong>See What's Included</strong></summary>

- **Reference Architecture.** You'll get everything you need from the ground up built using 100% infrastructure as code.
- **Deployment Strategy.** You'll have a battle-tested deployment strategy using GitHub Actions that's automated and repeatable.
- **Site Reliability Engineering.** You'll have total visibility into your apps and microservices.
- **Security Baseline.** You'll have built-in governance with accountability and audit logs for all changes.
- **GitOps.** You'll be able to operate your infrastructure via Pull Requests.
- **Training.** You'll receive hands-on training so your team can operate what we build.
- **Questions.** You'll have a direct line of communication between our teams via a Shared Slack channel.
- **Troubleshooting.** You'll get help to triage when things aren't working.
- **Code Reviews.** You'll receive constructive feedback on Pull Requests.
- **Bug Fixes.** We'll rapidly work with you to fix any bugs in our projects.
</details>

<a href="https://cloudposse.com/readme/commercial-support/link?utm_source=github&utm_medium=readme&utm_campaign=cloudposse-terraform-components/.github&utm_content=readme_commercial_support_link"><img src="https://cloudposse.com/readme/commercial-support/img"/></a>



> [!IMPORTANT]
> ### We're a DevOps Accelerator for AWS Infrastructure
>
> Skip the consultants and the DIY headaches.
>
> Use our ready-to-go [terraform architecture blueprints](https://cloudposse.com/) for AWS to get up and running quickly.
>
> ✅ Production-ready AWS infrastructure in weeks, not months<br/>
> ✅ Backed by our fanatical support<br/>
> ✅ So good, we offer a money-back guarantee<br/>
>
> [![Request Quote](https://img.shields.io/badge/Request_Quote-success.svg?style=for-the-badge)](https://cloudposse.com/quiz/)
>
> Just browsing? Kickstart your journey with [Atmos](https://atmos.tools), dive into discussions on [Slack](https://cloudposse.com/slack), and gain insights on our weekly [office hours](https://cloudposse.com/office-hours). Discover how Cloud Posse's open-source solutions can elevate your organization.
>
> <details>
>   <summary><strong>💡 Learn More about Cloud Posse</strong></summary>
>
> ### Our Approach
>
> *After you work with Cloud Posse, your team will know what they're doing.*
>
> You will have a plan in place to handle deploying every new service your company builds. You will have peace of mind knowing that everything is defined with infrastructure as code and confident in your ability to deliver. Your team will have learned to fish and become autonomous. And guess what? We are here to pull you out if you ever get stuck in the mud.
>
> [![Request Quote](https://img.shields.io/badge/Request_Quote-success.svg?style=for-the-badge)](https://cloudposse.com/quiz/)
> * [Case Studies](https://cloudposse.com/case-studies/)
> * [Foundational Infrastructure](https://cloudposse.com/reference-architecture/foundational-infrastructure/)
> * [Foundational Platform](https://cloudposse.com/reference-architecture/foundational-platform/)
> * [Foundational Release Engineering](https://cloudposse.com/reference-architecture/foundational-release-engineering/)
> * [Foundational SRE](https://cloudposse.com/reference-architecture/foundational-sre/)
> * [Foundational Security & Compliance](https://cloudposse.com/reference-architecture/foundational-security-and-compliance/)
>
> ### How it Works
> *Use the industry's most robust AWS reference architecture for terraform to solve your most challenging problems of compliance and observability.*
>
> Our plan ensures you have a platform built for scale and we'll guide you along the way so you can make informed decisions. After you graduate from our accelerator, we offer long-term support to help you grow.
>
> [![Request Quote](https://img.shields.io/badge/Request_Quote-success.svg?style=for-the-badge)](https://cloudposse.com/quiz/)
>
> * [Reference Architecture](https://cloudposse.com/reference-architecture/)
> * [Our Toolchain](https://cloudposse.com/toolchain/)
> * [Getting Started](https://cloudposse.com/get-started/)
> * [FAQs](https://cloudposse.com/faq/)
>
> ### What We Do
>
> *Your team can operate like a pro today.*
>
> Ensure that your team succeeds by using our proven process and turnkey blueprints. Plus, we stick around until you succeed.
>
> [![Request Quote](https://img.shields.io/badge/Request_Quote-success.svg?style=for-the-badge)](https://cloudposse.com/quiz/)
>
> * [What is a DevOps Accelerator](https://cloudposse.com/devops-accelerator/)
> * [The Big Picture](https://cloudposse.com/big-picture/)
> </details>


[![README Footer][readme_footer_img]][readme_footer_link]
[![Beacon][beacon]][website]

  [logo]: https://cloudposse.com/logo-300x69.svg
  [docs]: https://cpco.io/docs?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=docs
  [website]: https://cpco.io/homepage?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=website
  [github]: https://cpco.io/github?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=github
  [jobs]: https://cpco.io/jobs?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=jobs
  [hire]: https://cpco.io/hire?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=hire
  [slack]: https://cpco.io/slack?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=slack
  [linkedin]: https://cpco.io/linkedin?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=linkedin
  [twitter]: https://cpco.io/twitter?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=twitter
  [testimonial]: https://cpco.io/leave-testimonial?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=testimonial
  [office_hours]: https://cloudposse.com/office-hours?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=office_hours
  [newsletter]: https://cpco.io/newsletter?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=newsletter
  [discourse]: https://ask.sweetops.com/?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=discourse
  [email]: https://cpco.io/email?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=email
  [commercial_support]: https://cpco.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=commercial_support
  [we_love_open_source]: https://cpco.io/we-love-open-source?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=we_love_open_source
  [terraform_modules]: https://cpco.io/terraform-modules?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=terraform_modules
  [readme_header_img]: https://cloudposse.com/readme/header/img
  [readme_header_link]: https://cloudposse.com/readme/header/link?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=readme_header_link
  [readme_footer_img]: https://cloudposse.com/readme/footer/img
  [readme_footer_link]: https://cloudposse.com/readme/footer/link?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=readme_footer_link
  [readme_commercial_support_img]: https://cloudposse.com/readme/commercial-support/img
  [readme_commercial_support_link]: https://cloudposse.com/readme/commercial-support/link?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/.github&utm_content=readme_commercial_support_link
  [beacon]: https://ga-beacon.cloudposse.com/UA-76589703-4/cloudposse/.github?pixel&cs=github&cm=readme&an=.github
