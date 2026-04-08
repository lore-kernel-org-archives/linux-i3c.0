Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905AB10FC447
	for <linux-i3c@archiver.kernel.org>; Wed,  8 Apr 2026 21:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eO9Zv8/VXQSNBJVVUZmYO4UCWUSlBx5SrgwIIcP+FqI=; b=a1skx9C9c7XZyGJQNE5k8QUDsZ
	sl9Kn0SCsjO0LHcu7GSMZW8NAZ1WRHjg8HOm2ndth24Sd3paf78c5ThNb2LgbNewOUSi//0oYIkP3
	JnzRI5GFCHHovlLycgxvvRyyeKNxe4ICnpCLBaxe7NvYfnSQiGoLN0JO5IjP6b5z/FvfptjukvUST
	qbvo1IzzhhAVIKbWXqA7A9ctcYQt6Q574RqBOLPxFFmu56gEOV0prv8mRj4RfyqmRpFubttoxSUvU
	OJS+SeakgOxDVAc6ncGxKGyOKgOB0amQyF+it6pgaj2bvH25WTbTjiiOoC/ffkJFDI0aulKiQ/T0v
	y9HzfkMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAaYV-00000009RR0-1RGy;
	Wed, 08 Apr 2026 21:35:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAaYT-00000009RQW-1MDh;
	Wed, 08 Apr 2026 21:35:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35E0B600AD;
	Wed,  8 Apr 2026 21:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921BCC19421;
	Wed,  8 Apr 2026 21:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775684119;
	bh=U5m8hCve0SToPzGN57qTzQp7oW2CDN8d/H/F/Gwr1gk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=c8Lz1avGo9y/3VwFqk+vg4C2dwokvPKM2kRCkByp3XrW7RZDSnYhczOJwfkn5J17L
	 fZPiEDIAb2KROGCWUAncAdHDC37/G9H+3r/bDVJyxxMaT0qqLf9fZmz7PzP1madm3h
	 Y/XJsLkf6KaJAK845zD1MKfM7MnRVciZJENhnfgD+0aaBr6QVYJIPfrZ9LDk9WaW2B
	 +LWfNPwjYgAEpol/ft2FMPoaAZFaqgynKvrqrPgXPkS7Upr4LNOd5/CxKqPUIP1kjq
	 xxCp7IN2bqWWAIAFgZJG98ZioTl6cU/Y9ZeSVkPWh7bnLWcoHLjT/nFmSJvbuIQ6z4
	 dYmBPC/7/qxqQ==
Date: Wed, 08 Apr 2026 16:35:17 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org, 
 Maciej Lawniczak <maciej.lawniczak@intel.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org
To: Dawid Glazik <dawid.glazik@linux.intel.com>
In-Reply-To: <7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
 <7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com>
Message-Id: <177568411772.3278896.3414957895375606965.robh@kernel.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: i3c: Add AST2600 I3C global
 registers
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


On Wed, 08 Apr 2026 22:34:35 +0200, Dawid Glazik wrote:
> Introduce the device-tree bindings for I3C global registers found on
> AST2600 SoCs.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> ---
> I wasn't sure if I should add newline at the end of the
> file or not so I took
> https://github.com/torvalds/linux/tree/master/Documentation/devicetree/bindings/i3c
> as an example.
> ---
>  .../i3c/aspeed,ast2600-i3c-global.yaml        | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml:55:4: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.example.dts:27.35-55 Unexpected 'ASPEED_RESET_I3C_DMA'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1597: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com

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
