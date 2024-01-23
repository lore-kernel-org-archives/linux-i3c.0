Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770D3C47DDB
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Jan 2024 22:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WJvggPNcLwcarjykcUx0snjAFDTG8nqPY0IbpVKvmWY=; b=ADUl5ShDUjArX6ViTNeukEYhfl
	CBFgiCtc+FrXYayxh9MYgeiGgpC1PeBAvR40W57rc+iggPj5ltLj/mM5PX5j/TAn5aCuLuAC8kMl4
	bQXkhVLwfbAghuExremPmAG2rWZmLjkti7H7tLy1JwzywEdQEdbqCNDMs0slW9x9tTvVnsgbXZloI
	Am36l9cv9MF6RPCNHH7hIQhEYpHNWBKyhiLUfY7hD2OicW2QPu421w0Iw7rxgxMxhZCq/nGImGHbv
	Gr3OlH+xZDaQoTsiWmZ6oWKJ8HwGdQW918K1ol5h6ujywC+BP0eghFdWcnqR9T0RJs682KkN9GHu2
	BrHH/Vzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSPPX-000ioT-2S;
	Tue, 23 Jan 2024 22:38:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSPPU-000ing-2Z
	for linux-i3c@lists.infradead.org;
	Tue, 23 Jan 2024 22:38:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0B94ACE3035;
	Tue, 23 Jan 2024 22:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3719C433F1;
	Tue, 23 Jan 2024 22:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706049501;
	bh=/DMGv7HfPRC+XJk0/nfDyPf+n+rMzldKRmicjf3Yozc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=gV1vZT+gAFjlN9VtnZ6Lum9jgUx7VAoDhiGadatbjAQF1BMQd0ZFbBQ3ZK67EA6L8
	 wps5Ngks/NSUtIv1qyNhmUp+YBGGMfabpFVMmUOexiU3Q8wzCzq0DbqNNU8bNh1Bzn
	 yMS/yrmZX6+PwE055zv64PTnm7+NWKLbYR1t0A+BXKHyivTK0xrYAgkWbXBduStiEy
	 eHV6/R8VoT9x6lIntBdIAg91B//Z9oa64dieNE2TMLPgdZBh0KGoD1L6DEkFo9o3m5
	 4cQW25G3SN24YlwsjPnUmW5BdRt9gqg5OKOaYxJ7OWURoKgHNvKvE2bDXMU3mY9TLm
	 v9tt6dPQg8JIA==
Date: Tue, 23 Jan 2024 16:38:20 -0600
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, linux-serial@vger.kernel.org, 
 zbigniew.lukwinski@linux.intel.com, joe@perches.com, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org, 
 frank.li@nxp.com, devicetree@vger.kernel.org, miquel.raynal@bootlin.com, 
 alexandre.belloni@bootlin.com, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 krzysztof.kozlowski@linaro.org
In-Reply-To: <20240123212549.3858137-3-Frank.Li@nxp.com>
References: <20240123212549.3858137-1-Frank.Li@nxp.com>
 <20240123212549.3858137-3-Frank.Li@nxp.com>
Message-Id: <170604949961.2185792.3557017002643301182.robh@kernel.org>
Subject: Re: [PATCH v3 2/8] dt-bindings: i3c: svc: add proptery mode
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_143825_190292_E32D8C60 
X-CRM114-Status: GOOD (  11.85  )
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


On Tue, 23 Jan 2024 16:25:43 -0500, Frank Li wrote:
> Add proptery 'mode' to distinguish work at 'controller' or 'target' mode.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     Change from v2 to v3
>         - using 'mode' distringuish master and target mode
> 
>  .../devicetree/bindings/i3c/silvaco,i3c-master.yaml   | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml:26:4: [warning] wrong indentation: expected 4 but found 3 (indentation)
./Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml:30:9: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
make[2]: *** Deleting file 'Documentation/devicetree/bindings/i3c/silvaco,i3c-master.example.dts'
Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml:30:9: mapping values are not allowed in this context
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/i3c/silvaco,i3c-master.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml:30:9: mapping values are not allowed in this context
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml: ignoring, error parsing file
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1428: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240123212549.3858137-3-Frank.Li@nxp.com

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
