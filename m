Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14DFC48BC4
	for <linux-i3c@archiver.kernel.org>; Sat, 17 Feb 2024 14:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GS1x9cQzz4Uckm5EtXjf/Zuot+VmFKPaUEeIIsfLrRo=; b=b7buinOI+1zsfgtz4IpaaVWUVR
	jN+NMmNVHDCfYMvw+lhhUQ514Ww1/JlV9CfteuWv+XhT3gpOYx3DmkpUK+vmHtJE8cPsYAj9ualrV
	uhO/pSlHyZblsLWkLjGJC7uwcPY+COlFhm/XKkeTJEuQtf+CBE6nAueeLYc486dvM/GfAF6+rbqCs
	saXv1okiQuxi74tvkvsuEIVp4gvQEkScb/2Hvx9nGvqCBmUvmLNnesq8zhe4vtyJBtCzfSDRDiKuU
	G5uvzxTFvhyKM2I63Z644926ugofRr9bLYGSXODTN/+IapqnYITzPpXCDyuzcoUVSH+w4yot1Lumw
	3xri+Isg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbM6B-00000005rmd-4AXp;
	Sat, 17 Feb 2024 14:55:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbM68-00000005rkm-3OOD
	for linux-i3c@lists.infradead.org;
	Sat, 17 Feb 2024 14:55:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2A317CE09B6;
	Sat, 17 Feb 2024 14:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CFFC433C7;
	Sat, 17 Feb 2024 14:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708181720;
	bh=eicC/VhgBa2S/q5nFbRXbBaIGih0GgZsqXc1V3c08P4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=O/YHpuC2kz2pEhoUuVZ2WKjf/xjV7sQJFEkPbfkWo1i3eGjc+4J2Z6xxmuQu6mfLE
	 bLg8T3invvo9JBAw52oj3l5YsJFVyxAoFrJ7z6AZa6K3/2+O6tuvj8DyU133t/uOZE
	 oks60FNg1cDNgZTuu9h4YQhQpDvesSAnrNwJi30mWjqXa2HZbM6KMBjB/FZP9N4QC6
	 6tp5NLsoh2ANFl7NVO01G08vPZhr67O7xwx8rTZkPmIbjTBkQFQ2u3rFp544/fGkoT
	 bastFFM9vBhTBNgI54dxvQG+9V9Vh+h23lguaXhQfqlDUET8p5uCHbZV+Gqakkh+9H
	 kfJR1/9mxSzFg==
Date: Sat, 17 Feb 2024 08:55:19 -0600
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Steven Niu <steven.niu.uj@renesas.com>
Cc: krzysztof.kozlowski+dt@linaro.org, zbigniew.lukwinski@linux.intel.com, 
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, 
 alexandre.belloni@bootlin.com, conor+dt@kernel.org
In-Reply-To: <20240217131412.4145506-1-steven.niu.uj@renesas.com>
References: <20240217131412.4145506-1-steven.niu.uj@renesas.com>
Message-Id: <170818171799.2302911.16070158638236981943.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: i3c-hub: Add Renesas RG3MxxB12A1 I3C
 HUB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_065525_299312_AA8D4B34 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org


On Sat, 17 Feb 2024 21:14:11 +0800, Steven Niu wrote:
> Document the Renesas RG3MxxB12A1 I3C HUB.
> 
> Signed-off-by: Steven Niu <steven.niu.uj@renesas.com>
> ---
>  .../devicetree/bindings/i3c/i3c-hub.yaml      | 400 ++++++++++++++++++
>  1 file changed, 400 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/i3c-hub.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/i3c-hub.yaml: id: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/i3c-hub.yaml: id-cp1: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/i3c-hub.yaml: target-reg: missing type definition
Documentation/devicetree/bindings/i3c/i3c-hub.example.dts:18.28-60.11: Warning (unit_address_vs_reg): /example-0/i3c-master@d040000: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/i3c/i3c-hub.example.dts:22.19-59.13: Warning (unit_address_vs_reg): /example-0/i3c-master@d040000/hub@0,0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/i3c/i3c-hub.example.dts:38.27-42.15: Warning (unit_address_vs_reg): /example-0/i3c-master@d040000/hub@0,0/target-port@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/i3c/i3c-hub.example.dts:43.27-50.15: Warning (unit_address_vs_reg): /example-0/i3c-master@d040000/hub@0,0/target-port@1: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/i3c/i3c-hub.example.dts:46.26-49.17: Warning (unit_address_vs_reg): /example-0/i3c-master@d040000/hub@0,0/target-port@1/backend@0,0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/i3c/i3c-hub.example.dts:51.27-54.15: Warning (unit_address_vs_reg): /example-0/i3c-master@d040000/hub@0,0/target-port@2: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/i3c/i3c-hub.example.dts:55.27-58.15: Warning (unit_address_vs_reg): /example-0/i3c-master@d040000/hub@0,0/target-port@3: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/i3c/i3c-hub.example.dts:78.28-124.11: Warning (unit_address_vs_reg): /example-1/i3c-master@d040000: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/i3c/i3c-hub.example.dts:102.27-106.15: Warning (unit_address_vs_reg): /example-1/i3c-master@d040000/hub@70,3C000000100/target-port@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/i3c/i3c-hub.example.dts:107.27-114.15: Warning (unit_address_vs_reg): /example-1/i3c-master@d040000/hub@70,3C000000100/target-port@1: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/i3c/i3c-hub.example.dts:110.26-113.17: Warning (unit_address_vs_reg): /example-1/i3c-master@d040000/hub@70,3C000000100/target-port@1/backend@0,0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/i3c/i3c-hub.example.dts:115.27-118.15: Warning (unit_address_vs_reg): /example-1/i3c-master@d040000/hub@70,3C000000100/target-port@2: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/i3c/i3c-hub.example.dts:119.27-122.15: Warning (unit_address_vs_reg): /example-1/i3c-master@d040000/hub@70,3C000000100/target-port@3: node has a unit name, but no reg or ranges property
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/i3c-hub.example.dtb: i3c-master@d040000: #address-cells:0:0: 3 was expected
	from schema $id: http://devicetree.org/schemas/i3c/i3c.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/i3c-hub.example.dtb: i3c-master@d040000: hub@0,0: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/i3c/i3c.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/i3c-hub.example.dtb: hub@0,0: $nodename:0: 'hub@0,0' does not match '^i3c-master@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/i3c/i3c-hub.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/i3c-hub.example.dtb: hub@0,0: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/i3c/i3c-hub.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/i3c-hub.example.dtb: hub@0,0: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/i3c/i3c-hub.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/i3c-hub.example.dtb: hub@0,0: target-port@0: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/i3c/i3c-hub.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/i3c-hub.example.dtb: hub@0,0: target-port@0: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/i3c/i3c-hub.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/i3c-hub.example.dtb: hub@0,0: target-port@1: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/i3c/i3c-hub.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/i3c-hub.example.dtb: hub@0,0: target-port@1: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/i3c/i3c-hub.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/i3c-hub.example.dtb: hub@0,0: target-port@2: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/i3c/i3c-hub.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/i3c-hub.example.dtb: hub@0,0: target-port@2: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/i3c/i3c-hub.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/i3c-hub.example.dtb: hub@0,0: target-port@3: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/i3c/i3c-hub.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/i3c-hub.example.dtb: hub@0,0: target-port@3: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/i3c/i3c-hub.yaml#
Documentation/devicetree/bindings/i3c/i3c-hub.example.dtb: /example-0/i3c-master@d040000/hub@0,0/target-port@1/backend@0,0: failed to match any schema with compatible: ['slave-mqueue']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/i3c-hub.example.dtb: i3c-master@d040000: #address-cells:0:0: 3 was expected
	from schema $id: http://devicetree.org/schemas/i3c/i3c.yaml#
Documentation/devicetree/bindings/i3c/i3c-hub.example.dtb: /example-1/i3c-master@d040000/hub@70,3C000000100/target-port@1/backend@0,0: failed to match any schema with compatible: ['slave-mqueue']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240217131412.4145506-1-steven.niu.uj@renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
