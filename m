Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E074C61DA4
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Feb 2023 13:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Im0W+GB7BLHXchweb7cLyej0ARfiBzib6XJHe0bWzA=; b=Ec94qOFGqsM4fB
	v2MqEaeMoMNDkA1WznVN4f4E19zM7vEp0NuepJAqYYIWi1b+82A/s+LucW253RAZr73mGoP/zMp/W
	/l54JPAjbArn2WP/d0uRy/8aiXgWjwfyl6jmLrF1lkIBGx9YR33v0dvZTjrSPRM6708eZFX7tjVnG
	bPDnkKqBz61gXDu9j916mbPwQqVA72cSEWQihZHpsgf0RVHYbjphS0pQYKlS5pVOdOtKXYL9ppcUM
	2IaE6nXHLpfj2zI7MtyU/5UIlGtFCH353GlBi+a6svTADbszMfsf8/qf7fnruCgLvc3KwGD2Q1yxo
	SsZXAeMwPhehXlkS+E3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSemn-00ATZp-Nd; Thu, 16 Feb 2023 13:58:57 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeml-00ATYi-HC
	for linux-i3c@lists.infradead.org; Thu, 16 Feb 2023 13:58:57 +0000
Received: by mail-oi1-f172.google.com with SMTP id u11so746295oiw.9
        for <linux-i3c@lists.infradead.org>; Thu, 16 Feb 2023 05:58:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ViCQNNU/x441WaeFAdW3KxGJXeuOAm5VDmC6mRNH38=;
        b=p7wyl33Nan88SAeUDA4xFXVDZThYpjX6X4XkAcZeLyiKocT4aceKIqkDReVHaz0abR
         V48VkN4zAIt/0og3WjJ+SELRE/LrVAuuvJryJlZ1wKDRGcQjzOpIarmTqKd4DXHi9TI9
         L5sEtrUQSEkfydR+4CwRYgPOjynhY0qMupli5+JZxjCPsJE7si4icQ9IQdPCBVv8X04c
         0q4pc5zxHrCYJyOBMDhKKzrxRyHvUQ1qAQouk5s4eC0nptm1xMmk8KJ2oh0zKzd77sts
         daWZrpTrbetnRCE/91gI7CQ/w+B3+MIJ9eK9GPexcB7EuKPHNR/6O3xaa7lY1uV+YaSg
         OtSw==
X-Gm-Message-State: AO0yUKUHf1xfYtpW9Ozux3CB5xYOwmm7Fleiu69nQYh4kMc8GqZ1h4Ur
	t7HNx3eZr1nS8xhE0b1ppSSygXimIQ==
X-Google-Smtp-Source: AK7set9+niocv5iHjmV2FG/y98pgRCFH2p2yv+ry0Fn7siDHXOUJyBElG7qV3ToHWtp0pb59Wz8ocA==
X-Received: by 2002:aca:1e0f:0:b0:364:f5da:54b7 with SMTP id m15-20020aca1e0f000000b00364f5da54b7mr2478772oic.36.1676555934095;
        Thu, 16 Feb 2023 05:58:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n23-20020aca2417000000b0037d8dbe4308sm546196oic.48.2023.02.16.05.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:58:53 -0800 (PST)
Received: (nullmailer pid 2312585 invoked by uid 1000);
	Thu, 16 Feb 2023 13:58:52 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Vitor Soares <ivitro@gmail.com>, Dylan Hung <dylan_hung@aspeedtech.com>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>
In-Reply-To: <82d750f53df622d8986e9a07053c7ee27dee61a2.1676532146.git.jk@codeconstruct.com.au>
References: <cover.1676532146.git.jk@codeconstruct.com.au>
 <82d750f53df622d8986e9a07053c7ee27dee61a2.1676532146.git.jk@codeconstruct.com.au>
Message-Id: <167655476600.2292444.1311837457935007933.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: i3c: Add AST2600 i3c controller
Date: Thu, 16 Feb 2023 07:58:52 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_055855_593597_8D85B5F4 
X-CRM114-Status: GOOD (  16.76  )
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


On Thu, 16 Feb 2023 15:41:52 +0800, Jeremy Kerr wrote:
> Add a devicetree binding for the ast2600 i3c controller hardware. This
> is heavily based on the designware i3c core, plus a reset facility
> and two platform-specific properties:
> 
>  - sda-pullup-ohms: to specify the value of the configurable pullup
>    resistors on the SDA line
> 
>  - aspeed,global-regs: to reference the (ast2600-specific) i3c global
>    register block, and the device index to use within it.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> 
> ---
> changes from RFC:
>  - add vendor prefix to global-regs properties
>  - add item description on global-regs property
>  - drop global reg node from example
> ---
>  .../bindings/i3c/aspeed,ast2600-i3c.yaml      | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.example.dts:30.31-32 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1508: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/82d750f53df622d8986e9a07053c7ee27dee61a2.1676532146.git.jk@codeconstruct.com.au

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
