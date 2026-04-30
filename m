Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB244FF8873
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Apr 2026 13:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=T8Os7lIVpED3i/bHxCSLurNqG7zPsja/ePBKy76wzsQ=; b=xqnmI5agZhI1Wv5XtEi7tZ+uu5
	BtBwMDiv1Nr+7GKsh7YeDf/r7efWvORbwXMWiOrTvIMLX5ecMkXvQXiOb6HQlc8v1TVdTPL2wDvOp
	yPtbS5fmO0V4z2jxo4Nu6qE5tT7cAXOAvz/mNiLHeIniGGBmdxgkVsmyQ+ZdfVCVjEPgnQ1R6ZN/8
	+P5mNktqv0f9cfzDNclTBCvwkv3duPqvzDZm7nXCRu0KMRSMlBTvyh/Ear3+EMdeo9cmdG/Yylc91
	WjY/DHE67JrzZ3ZOQUtKnm8DHJuiXtFdwZZvCCjJa7zwZuY4x1ngsvNUniQLnfJie02MSogOiAO8+
	hn3jGEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIReE-00000005Y8n-2ElO;
	Thu, 30 Apr 2026 13:41:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIReC-00000005Y8O-1eEa
	for linux-i3c@lists.infradead.org;
	Thu, 30 Apr 2026 13:41:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 786B860142;
	Thu, 30 Apr 2026 13:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF17C2BCB3;
	Thu, 30 Apr 2026 13:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777556503;
	bh=qo0NVFUmB45SVo0XMWqHC4qOMxTWR++i0ZQMSOzxZkE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qep3HF6J7LU9utiSV6oY7tghewHVRkU6ejIBxqhGqkcMONqXqpem5RPYWLTDmKFBw
	 WgyTxRXQv2jFoP5jbRZ+PrYO/TM+cWVnz/Go+Zf5LGx0LkaVJKdgEjj3ty3Ny3D5m0
	 SgXndJWbzinHtk02ey/XuQXoTNG83/vB5PGOIlbYGIeXd4z+wjZo4dgvNjWjK05rdm
	 w8y7Fbs1ro1ke2y87ZMz7jLvbHiaysrbJkpbLJslDyglv5Rng6UkMmvOkvh2KGo1kC
	 rE6/KvLoyBHXuUrFqohF4dDZKPwt2E+DF+sKVueXBffIJqH55VRgedDsXwTOeFoB7U
	 NcSUXWveZiATA==
Date: Thu, 30 Apr 2026 08:41:41 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linusw@kernel.org, gregkh@linuxfoundation.org, 
 linux-i3c@lists.infradead.org, brgl@kernel.org, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-staging@lists.linux.dev, alexandre.belloni@bootlin.com, 
 linux-gpio@vger.kernel.org, Frank.Li@nxp.com, krzk+dt@kernel.org
To: zain_zhou@realsil.com.cn
In-Reply-To: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
References: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
Message-Id: <177755650101.425569.4344368132239630879.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: i3c: add binding for Realtek RTS490x
 I3C HUB
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


On Thu, 30 Apr 2026 20:13:53 +0800, zain_zhou@realsil.com.cn wrote:
> From: zain_zhou <zain_zhou@realsil.com.cn>
> 
> Add DT binding schema for Realtek RTS490x series I3C HUB devices.
> 
> The binding describes configuration properties for:
>   - LDO enable/disable and voltage level per port group
>   - Pull-up resistance per port group
>   - IO driver strength per port
>   - Per target-port mode (I3C/SMBus/GPIO/disabled), pull-up,
>     IO mode, SMBus clock frequency and polling interval
>   - Hub network always-I3C mode
>   - Hardware identification via CSEL pin (id) and CP1 pins (id-cp1)
> 
> Signed-off-by: zain_zhou <zain_zhou@realsil.com.cn>
> ---
>  .../bindings/i3c/realtek,rts490x-i3c-hub.yaml | 410 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 416 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: ignoring, error in schema: patternProperties: @[0-9]$: properties: polling-interval-ms: type
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:polling-interval-ms: 'anyOf' conditional failed, one must be fixed:
	'maxItems' is a required property
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'type' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	Additional properties are not allowed ('type' was unexpected)
		hint: Arrays must be described with a combination of minItems/maxItems/items
	'type' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/cell.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:polling-interval-ms:type: 'uint32' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:clock-frequency:type: 'uint32' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:clock-frequency: 'type' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	from schema $id: http://devicetree.org/meta-schemas/cell.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:clock-frequency:type: 'anyOf' conditional failed, one must be fixed:
	'uint32' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
	'uint32' is not of type 'array'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml: patternProperties:@[0-9]$:properties:polling-interval-ms:type: 'anyOf' conditional failed, one must be fixed:
	'uint32' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
	'uint32' is not of type 'array'
Lexical error: Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.example.dts:50.34-55 Unexpected 'I2C_OWN_SLAVE_ADDRESS'
Lexical error: Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.example.dts:114.34-55 Unexpected 'I2C_OWN_SLAVE_ADDRESS'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1637: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260430121354.6253-1-zain_zhou@realsil.com.cn

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
