Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A600ACD5BC9
	for <linux-i3c@archiver.kernel.org>; Mon, 25 May 2026 18:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UFyFEDFjcNxulKeZmHPeLaluGZDTEcM/+8k+zAwMIm8=; b=XEGM/AzF08lOFVCFo8mzpB3kqM
	FDcpnCR8SDdFqLjQVT8JIN0v8QnN3KjZL5xRfIaTg2OmDre+gcImjkkQ0Wr/NbpMZ7nKlgBt46xjT
	Rsmoas+ZpqPuaPnPFx1JmRs2in5GEDS6/ah0Udfknh3mKFIyy6LCUCEzZhgLxWNRM5UYwGikzyaiW
	nHEv6fM0ef+ktUovCgDy5vatmuSLkR5t/BZ5xi3dNHHYSqJe9fFgWNGDGpous748HOiCC8km3Z+l8
	7AWJRjSJewNztpHlRpJ6K/Uhw/ovUzaxlQ/j8uK4XUWfinvz++aYfFhsJm+qLWcCfUmhBiGPpSSCE
	irzSbLIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRaIh-00000000GYP-0IE6;
	Mon, 25 May 2026 18:45:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRaIe-00000000GXe-2D8Z
	for linux-i3c@lists.infradead.org;
	Mon, 25 May 2026 18:45:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A4C0243C42;
	Mon, 25 May 2026 18:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E281F000E9;
	Mon, 25 May 2026 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779734715;
	bh=64e79zTo0Q/3LTOxcKMi6PmSR/wzB/guSZphOxF/gzg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=MgybNK8e0qDHzldZoTzHC4seiisEWAeA9YkqVlO80OC3g5EwZK2bBSsVmE3ZKoFdz
	 UNygU6b5ZqVG/6WJkRDh9Mse/ZjObjuaWU/45K+K8DCy5maEZyOGGgX9hpA+f1rx06
	 arEWKWJQ/hKGPpprOvUZMK5NIJmNvTKPWmzdCCFOFCBfarBJz91XRVTPqy/ysv/S5r
	 TRB0wfVzXVW6izyDUKvqUiKPgsJo+jN/yHIuVm3aGMGp9Tir+moBdS7N9lkX0rNGVX
	 wpONYLWinFang3PCQk20mbS9aN+zOpjObtCM8Yl2bjtY7itoLzBUFeFogtvBhTQBq5
	 jvVGgwfFosk7Q==
Date: Mon, 25 May 2026 13:45:14 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-staging@lists.linux.dev, 
 gregkh@linuxfoundation.org, devicetree@vger.kernel.org, 
 alexandre.belloni@bootlin.com, Frank.Li@nxp.com, conor+dt@kernel.org, 
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 brgl@kernel.org, linux-gpio@vger.kernel.org, linusw@kernel.org, 
 wei_wang@realsil.com.cn
To: zain_zhou@realsil.com.cn
In-Reply-To: <20260525125128.297-1-zain_zhou@realsil.com.cn>
References: <20260525125128.297-1-zain_zhou@realsil.com.cn>
Message-Id: <177973471463.4085017.2026764711842557373.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: add Realtek RTS490x I3C HUB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_114516_585148_90C927AF 
X-CRM114-Status: GOOD (  12.66  )
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


On Mon, 25 May 2026 20:51:27 +0800, zain_zhou@realsil.com.cn wrote:
> From: Yin Zhou <zain_zhou@realsil.com.cn>
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
> Signed-off-by: Yin Zhou <zain_zhou@realsil.com.cn>
> 
> Changes in v2:
> - Rework binding per Krzysztof Kozlowski's review:
>   add realtek, vendor prefix to all custom properties; use boolean
>   for enable flags; use u32 with unit suffixes (-microvolt, -ohms)
>   for voltage/resistance; change to unevaluatedProperties: false;
>   fix title, maintainer name, description, $nodename pattern
> - Consolidate examples; add dt-bindings/i2c/i2c.h include
> ---
>  .../bindings/i3c/realtek,rts490x-i3c-hub.yaml | 263 ++++++++++++++++++
>  1 file changed, 263 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.example.dtb: /example-0/i3c-master@d040000/hub@70,4ba00000000/target-port@1/i2c@10: failed to match any schema with compatible: ['i2c-slave-mqueue']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260525125128.297-1-zain_zhou@realsil.com.cn

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
