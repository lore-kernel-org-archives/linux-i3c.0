Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967A0C27C65
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Jun 2024 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Xfb1rDpRrK1vAD1vtiG80hOXXYFkUpYhDWZjBaZBNsk=; b=JbbSsqDXyNrLfQ1JA4b4KFjolC
	NE6gk6+Y/0BF3h0TSporzluSwMUzK14ZymGZln8uXerxLrTEwcx9FFUQ3fgKmML/QI1hdwQWgIfai
	pyORhQBnU+4Nk7Ue7DCs1joISlwpR6du5Ji9m58YOkIhA/nYQUSxNy6q1jUzp5BIlz8nvRReoVSEX
	W+czcTUsqQs2/+ivtaTvuBkAJVKlO/DPEnCim1HsUXuBTlGJXFJzWZFW8dVk5ksrEFUC4ajSFkqzJ
	wTnrfvTR/i7dGg23aMCDvmNcG10wPNsNKOCCrbKCl6l8XDokj9Dps8bTF5Tvy4B5mzd3bkyf+uLGs
	Q1bEx7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6Iy-00000009rNj-08Tb;
	Tue, 11 Jun 2024 18:33:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6Iu-00000009rMO-3jFN
	for linux-i3c@lists.infradead.org;
	Tue, 11 Jun 2024 18:33:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B50960E71;
	Tue, 11 Jun 2024 18:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72049C2BD10;
	Tue, 11 Jun 2024 18:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718130787;
	bh=zCreM3Z3hAQ/UnimTiSe9eKgPn9+Y6iFAPR6H5PRr94=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=R6/UHIJGRA/bSIGUouGJezFRj+6CUB1yK7Ajec6CreZSu2nH3LeJ92YB9uW5ZFEjf
	 Ssvm6JGjEQK4beHTrlZns7Q3q945FOZR2zEWYY1pCU8j2nBlvOyP5Sn4Il4wP/bSPz
	 kNTM349+L9bYtn0OOWYHeE4EvojP9sQiap5nEIhKqk68tsMojTWsbiSXOgXUCtw+9e
	 lyq4pD0HEOF543slqGYszst7LzX8XVx9o05BB4y0KGZkUSmDVmqLymmRwj4qgSFQ8m
	 y5Lf8IO8lgrtFB0Z9FN1gdBkmtAd8UzXVZTs6yvFYZf7B9wzneyV9K+riJbKDn015J
	 d9IyFs/cnd/OQ==
Date: Tue, 11 Jun 2024 12:33:06 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aniket <aniketmaurya@google.com>
Cc: Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
 Jeremy Kerr <jk@codeconstruct.com.au>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20240611171600.1105124-2-aniketmaurya@google.com>
References: <20240611171600.1105124-1-aniketmaurya@google.com>
 <20240611171600.1105124-2-aniketmaurya@google.com>
Message-Id: <171813078603.2869501.4487165052485708159.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: i3c: dw: Add clock binding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_113309_011904_A6421303 
X-CRM114-Status: UNSURE (   9.57  )
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


On Tue, 11 Jun 2024 17:15:59 +0000, Aniket wrote:
> Add dt binding for optional apb clock.
> Core clock is mandatory. Also add
> an example.
> 
> Signed-off-by: Aniket <aniketmaurya@google.com>
> ---
>  .../bindings/i3c/snps,dw-i3c-master.yaml      | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.example.dtb: i3c@10400: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/i3c/snps,dw-i3c-master.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.example.dtb: i3c@10400: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/i3c/snps,dw-i3c-master.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.example.dtb: i3c@10400: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/i3c/i3c.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.example.dtb: i3c@10400: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/i3c/i3c.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240611171600.1105124-2-aniketmaurya@google.com

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
